using NGnono.FinancialManagement.Models.Enums;
using NGnono.Framework.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace NGnono.FinancialManagement.Models
{
    public class UserModel : DomainModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
        public string Nickname { get; set; }
        public int CreatedUser { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int UpdatedUser { get; set; }
        public System.DateTime UpdatedDate { get; set; }
        public System.DateTime LastLoginDate { get; set; }
        public string Mobile { get; set; }
        public string EMail { get; set; }
        public int Status { get; set; }
        public int UserLevel { get; set; }

        public int Store_Id { get; set; }
        public int Region_Id { get; set; }
        public string Logo { get; set; }
        public string Description { get; set; }
        public byte Gender { get; set; }

        public UserLevel Level
        {
            get { return (UserLevel)this.UserLevel; }
            set { this.UserLevel = (int)value; }
        }

        public List<UserRole> UserRoles { get; set; }

        public List<UserAccountModel> Accounts { get; set; }

        /// <summary>
        /// 用户角色
        /// </summary>
        public UserRole UserRole
        {
            get
            {
                if (UserRoles == null || UserRoles.Count == 0)
                {
                    return UserRole.None;
                }

                var ur = UserRole.None;
                foreach (var item in UserRoles)
                {
                    ur = ur | item;
                }

                return ur;
            }
        }

        /// <summary>
        /// 我喜欢
        /// </summary>
        public int ILikeCount { get; set; }

        /// <summary>
        /// 喜欢我
        /// </summary>
        public int LikeMeCount { get; set; }

        /// <summary>
        /// 收藏数
        /// </summary>
        public int FavorCount { get; set; }

        /// <summary>
        /// 优惠码数
        /// </summary>
        public int CouponCount { get; set; }

        /// <summary>
        /// 积分数
        /// </summary>
        public int PointCount { get; set; }

        /// <summary>
        /// 消费次数
        /// </summary>
        public int ConsumptionCount { get; set; }

        /// <summary>
        /// 分享数
        /// </summary>
        public int ShareCount { get; set; }

        public bool? IsCardBinded { get; set; }
    }


    /// <summary>
    /// 用户权限 Name 和数据库中的必须一致（属于字典表）
    /// </summary>
    [Flags]
    public enum UserRole
    {
        /// <summary>
        /// 
        /// </summary>
        None = 0,

        /// <summary>
        /// 用户
        /// </summary>
        User = 1,

        /// <summary>
        /// 店长
        /// </summary>
        Manager = 2,

        /// <summary>
        /// 管理员
        /// </summary>
        Admin = 4,

        /// <summary>
        /// 运营
        /// </summary>
        Operators = 8,

        /// <summary>
        /// 编辑
        /// </summary>
        Editor = 16,

        /// <summary>
        /// 来宾（匿名用户，未登录）
        /// </summary>
        Guest = 32
    }

    /// <summary>
    /// 用户的等级
    /// </summary>
    [Flags]
    public enum UserLevel
    {
        /// <summary>
        /// 
        /// </summary>
        [Description("默认")]
        None = 0,

        /// <summary>
        /// 普通用户
        /// </summary>
        [Description("普通用户")]
        User = 1,

        /// <summary>
        /// 达人
        /// </summary>
        [Description("达人")]
        Daren = 2,

        ///// <summary>
        ///// 店长
        ///// </summary>
        //Manager = 4,
    }

    public class UserAccountModel : DomainModel
    {
        public int Id { get; set; }
        public decimal Amount { get; set; }
        public int User_Id { get; set; }

        public int CreatedUser { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int UpdatedUser { get; set; }
        public System.DateTime UpdatedDate { get; set; }

        [System.Obsolete("注意这个")]
        public int AccountType
        {
            get { return (int)AType; }
            set { AType = (AccountType)value; }
        }
        public int AccountId { get; set; }

        public int Status { get; set; }

        /// <summary>
        /// 用户账户类型
        /// </summary>
        public AccountType AType { get; set; }
    }
}
