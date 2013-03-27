using NGnono.FinancialManagement.Models;

namespace NGnono.FinancialManagement.Services.Contract
{
    public interface IUserService : IUserAccountService
    {
        /// <summary>
        /// 获取用户
        /// </summary>
        /// <param name="userName">不区分大小写</param>
        /// <param name="password"></param>
        /// <returns></returns>
        UserModel Get(string userName, string password);

        /// <summary>
        /// 获取用户
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        UserModel Get(int userId);

        /// <summary>
        /// 喜欢用户
        /// </summary>
        /// <returns></returns>
        UserModel LikeAdd(int likeUserId, int likedUserId);

        /// <summary>
        /// 不喜欢用户
        /// </summary>
        /// <returns></returns>
        UserModel LikeSubtract(int likeUserId, int likedUserId);

        /// <summary>
        /// 绑定用户到店铺
        /// </summary>
        /// <param name="userId">被绑定人</param>
        /// <param name="bindStoreId">被绑定的店铺</param>
        /// <param name="authUserId">操作人</param>
        /// <returns></returns>
        UserModel BindStore(int userId, int bindStoreId, int authUserId);

        /// <summary>
        /// 绑定用户到店铺
        /// </summary>
        /// <param name="userId">被解除绑定人</param>
        /// <param name="bindStoreId">被解除绑定的店铺</param>
        /// <param name="authUserId">操作人</param>
        /// <returns></returns>
        UserModel UnStore(int userId, int bindStoreId, int authUserId);

        /// <summary>
        /// 设置用户等级
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="userLevel"></param>
        /// <param name="authUserId"></param>
        /// <returns></returns>
        UserModel UserLevelUpdate(int userId, UserLevel userLevel, int authUserId);

        /// <summary>
        /// 设置用户角色
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="userRole"></param>
        /// <param name="authUserId"></param>
        /// <returns></returns>
        UserModel UserRoleInsert(int userId, UserRole userRole, int authUserId);

        /// <summary>
        /// 删除用户角色
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="userRole"></param>
        /// <param name="authUserId"></param>
        /// <returns></returns>
        UserModel UserRoleDeleted(int userId, UserRole userRole, int authUserId);

        void SetCardBinder(int userId, bool? binded);

        /// <summary>
        /// 设置密码
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="oldPassword"></param>
        /// <param name="newPassword"></param>
        /// <returns></returns>
        bool SetPassword(int userId, string oldPassword, string newPassword);
    }
}
