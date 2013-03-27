using System;
using System.Web.Mvc;
using System.Web.Security;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.FinancialManagement.Services;
using NGnono.FinancialManagement.Services.Contract;
using NGnono.FinancialManagement.Services.Utils;
using NGnono.FinancialManagement.WebSiteCore.Models;
using NGnono.FinancialManagement.WebSiteCore.Models.Vo;
using NGnono.FinancialManagement.WebSupport.Models;
using NGnono.FinancialManagement.WebSupport.Mvc.Controllers;
using NGnono.FinancialManagement.WebSupport.Mvc.Filters;

namespace NGnono.FinancialManagement.WebSiteCore.Controllers
{
    /// <summary>
    /// 1.登录，注册，注销
    /// 2.资料修改，密码，邮箱验证
    /// 
    /// </summary>
    [Authorize]
    public class AccountController : UserController
    {
        private readonly IUserService _userService;

        public AccountController(IUserService userService)
        {
            _userService = userService;
        }

        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        ////
        //// POST: /Account/Login

        [HttpPost]
        public ActionResult Login(FormCollection formCollection, LoginViewModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                var userModel = _userService.Get(model.UserName, model.Password);
                if (userModel == null)
                {
                    ModelState.AddModelError("", "用户名或密码错误.");
                }
                else
                {
                    //写认证
                    SetAuthorize(new WebSiteUser(userModel.Name, userModel.Id, userModel.Nickname, userModel.UserRole));

                    if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1 && returnUrl.StartsWith("/")
                && !returnUrl.StartsWith("//") && !returnUrl.StartsWith("/\\"))
                    {
                        return Redirect(returnUrl);
                    }

                    return RedirectToAction("Index", "Home");
                }
            }

            ModelState.AddModelError("", "参数验证失败.");

            return View(model);
        }

        ////
        //// POST: /Account/LogOff

        public ActionResult LogOff()
        {
            base.Signout();

            return RedirectToAction("Index", "Home");
        }

        public ActionResult ChangePassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ChangePassword(FormCollection formCollection, ChangePasswordViewModel viewModel)
        {
            if (ModelState.IsValid)
            {
                if (_userService.SetPassword(CurrentUser.CustomerId, viewModel.OldPassword, viewModel.NewPassword))
                {
                    return View("ChangePasswordSuccess");
                }

                ModelState.AddModelError("", "OldPassword 错误.");
            }
            else
            {
                ModelState.AddModelError("", "验证错误.");
            }

            return View(viewModel);
        }

        ////
        //// GET: /Account/Register
        [AdminAuthorize]
        public ActionResult Register()
        {
            return View();
        }


        ////
        //// GET: /Account/Register
        [AdminAuthorize]
        [HttpPost]
        public ActionResult Register(FormCollection formCollection)
        {
            return View();
        }
    }
}
