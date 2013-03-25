using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using NGnono.Framework.Logger;
using NGnono.Framework.ServiceLocation;

namespace NGnono.FinancialManagement.WebSiteCore
{
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
    /// 网站用户
    /// </summary>
    [Serializable]
    public class WebSiteUser
    {
        public WebSiteUser()
        {
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="WebSiteUser"/> class.
        /// </summary>
        /// <param name="loginName">
        /// The login name.
        /// </param>
        /// <param name="customerId">
        /// The customer id.
        /// </param>
        /// <param name="nickName">昵称</param>
        public WebSiteUser(string loginName, int customerId, string nickName, UserRole role)
        {
            this.LoginName = loginName;
            this.CustomerId = customerId;
            this.NickName = nickName;
            Role = role;
        }

        /// <summary>
        /// Gets LoginName.
        /// </summary>
        public string LoginName { get; set; }

        /// <summary>
        /// Gets CustomerId.
        /// </summary>
        public int CustomerId { get; set; }

        public string NickName { get; set; }

        public UserRole Role { get; set; }

    }

    public abstract class UserController : System.Web.Mvc.Controller
    {

        protected UserController()
        {
            Log = ServiceLocator.Current.Resolve<ILog>();
           // AuthenticationService = ServiceLocator.Current.Resolve<IAuthenticationService>();
        }

        protected void SetAuthorize(WebSiteUser webSiteUser)
        {
            //AuthenticationService.SetAuthorize(base.HttpContext, webSiteUser);
        }

        protected void Signout()
        {
            //AuthenticationService.Signout(base.HttpContext);
        }

        /// <summary>
        /// 当前登录用户
        /// </summary>
        private WebSiteUser _currentUser;

        /// <summary>
        /// Gets or sets ILog.
        /// </summary>
        public ILog Log
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets AuthenticationService.
        /// </summary>
        public IAuthenticationService AuthenticationService { get; set; }

        /// <summary>
        /// 获取当前登录用户
        /// </summary>
        public WebSiteUser CurrentUser
        {
            get { return new WebSiteUser();}
            //get { return this._currentUser ?? (this._currentUser = this.AuthenticationService.GetCurrentUser(base.HttpContext)); }
            /*get
            {
                if (HttpContext.Items["_CurrentUser_"]==null)
                {
                    HttpContext.Items["_CurrentUser_"] = AuthenticationService.GetCurrentUser(this.HttpContext);
                }
                return HttpContext.Items["_CurrentUser_"] as User;
            }*/
        }

        /// <summary>
        /// 禁用 Response
        /// </summary>
        [Obsolete]
        public new HttpResponseBase Response
        {
            get
            {
                throw new NotSupportedException("禁止直接使用Response");
            }
        }

        /// <summary>
        /// 禁止直接使用Request
        /// </summary>
        [Obsolete]
        public new HttpRequestBase Request
        {
            get
            {
                throw new NotSupportedException("禁止直接使用Request");
            }
        }

        /// <summary>
        /// 禁止直接使用Session
        /// </summary>
        [Obsolete]
        public new HttpSessionStateBase Session
        {
            get
            {
                throw new NotSupportedException("禁止直接使用Session");
            }
        }

        /// <summary>
        /// 禁止直接使用HttpContext
        /// </summary>
        //[Obsolete]
        //public new HttpContextBase HttpContext
        //{
        //    get
        //    {
        //        throw new NotSupportedException("禁止直接使用HttpContext");
        //    }
        //}

        ///// <summary>
        ///// 禁止直接使用 ControllerContext.
        ///// </summary>
        ////[Obsolete]
        //public new ControllerContext ControllerContext
        //{
        //    get
        //    {
        //        throw new NotSupportedException("禁止直接使用ControllerContext");
        //    }
        //}

        /// <summary>
        /// 根据Ajax请求切换对应视图
        /// </summary>
        /// <param name="viewName">
        /// The view name.
        /// </param>
        /// <param name="viewNameForAjax">
        /// The view name for ajax.
        /// </param>
        /// <returns>
        /// the view
        /// </returns>
        protected ViewResult ViewWithAjax(string viewName, string viewNameForAjax)
        {
            return this.ViewWithAjax(viewName, viewNameForAjax, null);
        }

        /// <summary>
        /// 根据Ajax请求切换对应视图
        /// </summary>
        /// <param name="viewName">
        /// The view name.
        /// </param>
        /// <param name="viewNameForAjax">
        /// The partial view name.
        /// </param>
        /// <param name="model">
        /// The model.
        /// </param>
        /// <returns>
        /// The view.
        /// </returns>
        protected ViewResult ViewWithAjax(string viewName, string viewNameForAjax, object model)
        {
            return this.View(base.Request.IsAjaxRequest() ? viewNameForAjax : viewName, model);
        }

        /// <summary>
        /// 向摘要增加错误信息
        /// 使用@Html.ValidationSummary()在view中输出 
        /// </summary>
        /// <param name="errMessage">
        /// The err message.
        /// </param>
        protected void AppendErrorSummary(string errMessage)
        {
            this.ModelState.AddModelError("summary", errMessage);
        }

        protected ActionResult Success(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;

            return View("Success");
        }
        protected JsonResult SuccessResponse()
        {
            return Json(new
            {
                Success = true
            });
        }
        protected JsonResult FailResponse()
        {
            return Json(new
            {
                Success = false
            });
        }
        public bool HasRightForCurrentAction()
        {
            object action = RouteData.Values["action"];
            string actionName = string.Empty;
            if (action != null)
                actionName = action.ToString();
            return HasRightForAction(actionName);
        }
        public bool HasRightForAction(string actionName)
        {
            string controllName = RouteData.Values["controller"].ToString();
            return HasRightForAction(controllName, actionName);

        }
        public bool HasRightForAction(string controller, string actionName)
        {

            return false;
            //if (string.IsNullOrEmpty(controller))
            //    controller = RouteData.Values["controller"].ToString();
            //if (string.IsNullOrEmpty(actionName))
            //    actionName = RouteData.Values["action"].ToString();
            //actionName = actionName.ToLower();
            //string controllName = controller.ToLower();
            //if (CurrentUser == null)
            //    return true;
            //int hasRoles = (int)CurrentUser.Role;
            //if ((hasRoles & (int)UserRole.Admin) == (int)UserRole.Admin)
            //    return true;
            ////check controll+action whether need authorize
            //bool needAuthroize = (from right in CmsV1Application.Current.RightsMap
            //                      select string.Concat(right.ControllName.ToLower()
            //                             , right.ActionName.ToLower())
            //                     ).Contains(string.Concat(controllName, actionName));
            //if (!needAuthroize)
            //    return true;
            //var result = (from role in CmsV1Application.Current.RoleRightMap
            //              from right in role.RoleAccessRights
            //              where (hasRoles & role.Val) == role.Val &&
            //                    right.AdminAccessRight != null &&
            //                     right.AdminAccessRight.ControllName.ToLower() == controllName &&
            //                    right.AdminAccessRight.ActionName.ToLower() == actionName
            //              select new { id = role.Id }
            //            ).FirstOrDefault();
            //return result != null;

        }
        [HttpGet]
        public virtual JsonResult AutoComplete(string name)
        {
            return Json(new[] { new { Name = string.Empty } }
                , JsonRequestBehavior.AllowGet);
        }
    }


    public class AuthenticationService : IAuthenticationService
    {
        public void Signout(HttpContextBase httpContext)
        {
           // throw new NotImplementedException();
        }

        public void SetAuthorize(HttpContextBase httpContext, WebSiteUser webSiteUser)
        {
            //throw new NotImplementedException();
        }

        public WebSiteUser GetCurrentUser(HttpContextBase httpContext)
        {
            return new WebSiteUser();
        }

        public bool Islogged(HttpContextBase httpContext)
        {
            return true;
        }

        public string GetLoginUrl(HttpContextBase httpContext)
        {
            return "";
        }
    }

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
