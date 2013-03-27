using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.Models;
using NGnono.FinancialManagement.Models.Enums;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.Framework.Helper;
using NGnono.Framework.Mapping;
using NGnono.Framework.Models;
using NGnono.Framework.ServiceLocation;
using NGnono.Framework.Utility;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;

namespace NGnono.FinancialManagement.Services.Manager
{
    public abstract class BaseMappingManager
    {
        #region fields

        protected ICustomerRepository CustomerRepository;

        private static readonly DateTime Min = new DateTime(1900, 1, 1);
        private static readonly DateTime Max = new DateTime(2079, 1, 1);

        #endregion

        #region .ctor

        protected BaseMappingManager()
        {
            CustomerRepository = ServiceLocator.Current.Resolve<ICustomerRepository>();
        }

        #endregion

        #region methods

        /// <summary>
        ///  datetime 1753-01-01到9999-12-31 00:00:00 到 23:59:59.997 3.33毫秒
        ///smalldatetime 1900-01-01 到 2079-06-06 00:00:00 到 23:59:59 分钟
        ///date 0001-01-01 到 9999-12-31 天
        ///time 00:00:00.0000000 到 23:59:59.9999999 100 纳秒
        ///datetime2 0001-01-01 到 9999-12-31 00:00:00 到 23:59:59.9999999 100 纳秒
        ///datetimeoffset 0001-01-01 到 9999-12-31 00:00:00 到 23:59:59.9999999 -14:00 到 +14:00 100 纳秒
        /// </summary>
        /// <param name="dateTime"></param>
        /// <returns></returns>
        protected static DateTime EntityDateTime(DateTime? dateTime)
        {
            if (dateTime == null)
            {
                return DateTime.Now;
            }

            if (dateTime < Min)
            {
                return Min;
            }

            if (dateTime > Max)
            {
                return Max;
            }

            return dateTime.Value;
        }

        protected static string CheckString(string t)
        {
            return String.IsNullOrWhiteSpace(t) ? String.Empty : t;
        }

        /// <summary>
        /// M
        /// </summary>
        /// <param name="coordinateInfo1"></param>
        /// <param name="coordinateInfo2"></param>
        /// <returns></returns>
        protected static double Distance(CoordinateInfo coordinateInfo1, CoordinateInfo coordinateInfo2)
        {
            var d = CoordinatePositioningHelper.GetDistance(coordinateInfo1,
                                                    coordinateInfo2);

            return d * 1000;
        }

        #endregion
    }

    /// <summary>
    /// customer
    /// </summary>
    public class MappingManagerV2 : BaseMappingManager
    {
        #region fields

        private readonly IUserAccountRepository _userAccountRepository;
        private readonly IVUserRoleRepository _vUserRoleRepository;


        #endregion

        #region .ctor

        public MappingManagerV2()
        {
            //注意 只能 查询不能有修改操作
            CustomerRepository = ServiceLocator.Current.Resolve<ICustomerRepository>();

            _userAccountRepository = ServiceLocator.Current.Resolve<IUserAccountRepository>();

            _vUserRoleRepository = ServiceLocator.Current.Resolve<IVUserRoleRepository>();
        }

        #endregion

        #region properties

        #endregion

        #region methods

        private void Init()
        {
            //TODO:MAPPING需要处理为非静态
        }

        private string GetToken(UserModel userModel)
        {
            return SessionKeyHelper.Encrypt(userModel.Id.ToString(CultureInfo.InvariantCulture));
        }

        #endregion

        #region customer

        public UserEntity UserEntityMapping(UserEntity source, UserEntity target)
        {
            var result = Mapper.Map(source, target);

            return UserEntityCheck(result);
        }

        private static UserEntity UserEntityCheck(UserEntity source)
        {
            if (source == null)
            {
                return null;
            }

            source.Description = source.Description ?? String.Empty;
            source.EMail = source.EMail ?? String.Empty;
            source.Logo = source.Logo ?? String.Empty;
            source.Mobile = source.Mobile ?? String.Empty;
            source.Name = source.Name ?? String.Empty;
            source.Nickname = source.Nickname ?? String.Empty;
            source.Password = source.Password ?? String.Empty;

            source.CreatedDate = EntityDateTime(source.CreatedDate);
            source.UpdatedDate = EntityDateTime(source.UpdatedDate);

            return source;
        }

        public IEnumerable<UserModel> UserModelMapping(List<UserEntity> source)
        {
            if (source == null || source.Count == 0)
            {
                return new List<UserModel>(0);
            }

            var userIds = source.Select(v => v.Id).Distinct().ToList();

            var accounts = UserAccountMapping(_userAccountRepository.GetListByUserIds(userIds)).ToList();
            var userRoles = _vUserRoleRepository.GetList(userIds);

            var result = new List<UserModel>(source.Count);

            foreach (var item in source)
            {
                var a = accounts.Where(v => v.User_Id == item.Id).ToList();
                var r = userRoles.Where(v => v.User_Id == item.Id).ToList();
                var target = UserModelMapping(item, a, UserRolesMapping(r));

                if (target != null)
                {
                    result.Add(target);
                }

            }

            return result;
        }

        private static UserModel UserModelMapping(UserEntity source, 
                                          List<UserAccountModel> userAccountModels, List<UserRole> userRoles)
        {
            if (source == null)
            {
                return null;
            }

            var target = Mapper.Map<UserEntity, UserModel>(source);

            //modelAccount
            target.Accounts = userAccountModels;
            //roles
            target.UserRoles = userRoles;
            //favorcount
            //ilikecount
            //likemecount

            //LOGO
            if (!String.IsNullOrWhiteSpace(target.Logo))
            {
                if (!target.Logo.StartsWith("http://", StringComparison.OrdinalIgnoreCase))
                {
                    target.Logo = ConfigManager.GetHttpApiImagePath() + target.Logo;
                }
            }

            if (target.Accounts == null || target.Accounts.Count == 0)
            {
                return target;
            }

            foreach (var item in target.Accounts)
            {
                switch (item.AType)
                {
                    case AccountType.ConsumptionCount:
                        target.ConsumptionCount = (int)item.Amount;
                        break;
                    case AccountType.Coupon:
                        target.CouponCount = (int)item.Amount;
                        break;
                    case AccountType.FavorCount:
                        target.FavorCount = (int)item.Amount;
                        break;
                    case AccountType.IlikeCount:
                        target.ILikeCount = (int)item.Amount;
                        break;
                    case AccountType.LikeMeCount:
                        target.LikeMeCount = (int)item.Amount;
                        break;
                    case AccountType.Point:
                        target.PointCount = (int)item.Amount;
                        break;
                    case AccountType.ShareCount:
                        target.ShareCount = (int)item.Amount;
                        break;
                }
            }

            return target;
        }


        public UserModel UserModelMapping(UserEntity source)
        {
            if (source == null)
            {
                return null;
            }

            //var target = Mapper.Map<UserEntity, UserModel>(source);

            //这步可以判断

            //modelAccount
            var accounts = UserAccountMapping(_userAccountRepository.GetUserAccount(source.Id)).ToList();
            //roles
            var userRoles = UserRolesMapping(_vUserRoleRepository.GetList(source.Id));

            return UserModelMapping(source, accounts, userRoles);
        }

        public UserEntity UserEntityMapping(UserModel source)
        {
            if (source == null)
            {
                return null;
            }

            var target = Mapper.Map<UserModel, UserEntity>(source);

            return CheckUserEntity(target);
        }

        private static UserEntity CheckUserEntity(UserEntity source)
        {
            if (source == null)
            {
                return null;
            }

            source.Name = CheckString(source.Name);
            source.Description = CheckString(source.Description);
            source.EMail = CheckString(source.EMail);
            source.Logo = CheckString(source.Logo);
            source.Mobile = CheckString(source.Mobile);
            source.Nickname = CheckString(source.Nickname);
            source.Password = CheckString(source.Password);

            return source;
        }

        #endregion

        #region useraccount

        public static UserAccountModel UserAccountMapping(UserAccountEntity source)
        {
            if (source == null)
            {
                return null;
            }

            var target = Mapper.Map<UserAccountEntity, UserAccountModel>(source);

            return target;
        }

        public static IEnumerable<UserAccountModel> UserAccountMapping(List<UserAccountEntity> source)
        {
            if (source == null || source.Count == 0)
            {
                return new List<UserAccountModel>(0);
            }

            var list = new List<UserAccountModel>(source.Count);

            foreach (var item in source)
            {
                var target = UserAccountMapping(item);

                if (target == null)
                {
                    continue;
                }
                list.Add(target);
            }

            return list;
        }

        #endregion

        #region vuserRoles

        public static List<UserRole> UserRolesMapping(List<VUserRoleEntity> source)
        {
            if (source == null || source.Count == 0)
            {
                return new List<UserRole>(0);
            }

            var list = new List<UserRole>(source.Count);
            //var dic = new Dictionary<UserRole, bool>(source.Count);
            foreach (var item in source)
            {
                var target = (UserRole)item.Role_Val;

                list.Add(target);
            }

            return list;
        }

        #endregion
    }
}
