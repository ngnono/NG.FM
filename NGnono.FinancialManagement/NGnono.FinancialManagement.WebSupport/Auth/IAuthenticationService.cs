﻿using System.Web;
using NGnono.FinancialManagement.WebSupport.Models;

namespace NGnono.FinancialManagement.WebSupport.Auth
{
    public interface IAuthenticationService
    {
        /// <summary>
        /// 退出登录
        /// </summary>
        /// <param name="httpContext"></param>
        void Signout(HttpContextBase httpContext);

        /// <summary>
        /// 写认证
        /// </summary>
        /// <param name="httpContext"></param>
        /// <param name="webSiteUser"></param>
        void SetAuthorize(HttpContextBase httpContext, WebSiteUser webSiteUser);

        /// <summary>
        /// 获取当前用户
        /// </summary>
        /// <param name="httpContext"></param>
        /// <returns></returns>
        WebSiteUser GetCurrentUser(HttpContextBase httpContext);

        /// <summary>
        /// 是否已登录
        /// </summary>
        /// <param name="httpContext"></param>
        /// <returns></returns>
        bool Islogged(HttpContextBase httpContext);

        /// <summary>
        /// 获取登录URL
        /// </summary>
        /// <param name="httpContext"></param>
        /// <returns></returns>
        string GetLoginUrl(HttpContextBase httpContext);

        ///// <summary>
        ///// 认证解码
        ///// </summary>
        ///// <param name="token"></param>
        ///// <returns></returns>
        //UserIdSessionData Decrypt(string token);

        ///// <summary>
        ///// 认证加码
        ///// </summary>
        ///// <param name="data"></param>
        ///// <returns></returns>
        //string Encrypt(UserIdSessionData data);

        ///// <summary>
        ///// 认证加码
        ///// </summary>
        ///// <param name="userid"></param>
        ///// <returns></returns>
        //string Encrypt(string userid);
    }
}