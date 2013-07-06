using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.Models.Enums;
using NGnono.Framework.Data;
using NGnono.Framework.Data.EF;
using NGnono.Framework.Models;
using System;
using System.Collections.Generic;

namespace NGnono.FinancialManagement.Repository.Contract
{
    public interface ICustomerRepository : IEFRepository<UserEntity, int>
    {
        /// <summary>
        /// 获取指定的用户
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        List<UserEntity> GetListByIds(List<int> ids);

        /// <summary>
        /// 获取制定item,name不区分大小写
        /// </summary>
        /// <param name="name"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        UserEntity GetItem(string name, string password);

        /// <summary>
        /// 顾客分页
        /// </summary>
        /// <param name="pagerRequest">page</param>
        /// <param name="totalCount">记录数</param>
        /// <param name="sortOrder">排序方式</param>
        /// <returns></returns>
        List<UserEntity> GetPagedList(PagerRequest pagerRequest, out int totalCount, CustomerSortOrder sortOrder);

        /// <summary>
        /// 搜索
        /// </summary>
        /// <param name="pagerRequest"></param>
        /// <param name="totalCount"></param>
        /// <param name="sortOrder"></param>
        /// <param name="nickName">前缀搜索</param>
        /// <param name="mobile"></param>
        /// <returns></returns>
        List<UserEntity> GetPagedListForNickName(PagerRequest pagerRequest, out int totalCount,
                                       CustomerSortOrder sortOrder, string nickName, string mobile);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="dateTime"></param>
        int SetLoginDate(int userId, DateTime dateTime);
    }

    public interface IUserAccountRepository : IRepository<UserAccountEntity, int>
    {
        /// <summary>
        /// 获取用户账户
        /// </summary>
        /// <param name="userId">userid</param>
        /// <param name="accountType">accountType</param>
        /// <returns></returns>
        UserAccountEntity GetItem(int userId, AccountType accountType);

        /// <summary>
        /// 获取当前用户的账户信息
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        List<UserAccountEntity> GetUserAccount(int userId);

        /// <summary>
        /// 获取
        /// </summary>
        /// <param name="userIds"></param>
        /// <returns></returns>
        List<UserAccountEntity> GetListByUserIds(List<int> userIds);

        /// <summary>
        /// 设置
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="accountType"></param>
        /// <param name="amount"></param>
        void SetAmount(int userId, AccountType accountType, decimal amount);

        /// <summary>
        /// 账户加操作
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="accountType"></param>
        /// <param name="amount"></param>
        /// <param name="updateUser"></param>
        /// <returns></returns>
        int AddCount(int userId, AccountType accountType, decimal amount, int? updateUser);

        /// <summary>
        /// 账户减操作
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="accountType"></param>
        /// <param name="amount"></param>
        /// <param name="updateUser"></param>
        /// <returns></returns>
        int SubCount(int userId, AccountType accountType, decimal amount, int? updateUser);
    }

    public interface IRoleRepository : IRepository<RoleEntity, int>
    {
        RoleEntity GetItemByRoleName(string roleName);

        RoleEntity GetItemByRoleVal(int val);

        List<RoleEntity> GetListByIds(List<int> ids);

        List<RoleEntity> GetList();

        IEnumerable<RoleEntity> LoadAllEagerly();

        RoleEntity UpdateWithRights(RoleEntity roleEntity);

        void InsertWithUserRelation(int User, string[] p);

        void DeleteRolesOfUserId(int Id);

        void UpdateWithUserRelation(int User, string[] p);

        IEnumerable<UserEntity> FindAllUsersHavingRoles();
    }
}
