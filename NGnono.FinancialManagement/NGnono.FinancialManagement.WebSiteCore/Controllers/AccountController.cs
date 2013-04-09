using System;
using System.Web.Mvc;
using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.Models;
using NGnono.FinancialManagement.Models.Enums;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.FinancialManagement.Repository.Impl;
using NGnono.FinancialManagement.Services.Contract;
using NGnono.FinancialManagement.WebSiteCore.Models.Vo;
using NGnono.FinancialManagement.WebSupport.Models;
using NGnono.FinancialManagement.WebSupport.Mvc.Controllers;
using NGnono.FinancialManagement.WebSupport.Mvc.Filters;
using NGnono.FinancialManagement.WebSiteCore.Models.Dto.Account;

namespace NGnono.FinancialManagement.WebSiteCore.Controllers
{
    /// <summary>
    /// 1.登录，注册，注销
    /// 2.资料修改，密码，邮箱验证
    /// 
    /// </summary>
    public class AccountController : UserController
    {
        private readonly IUserService _userService;
        private readonly ICustomerRepository _customerRepository;

        public AccountController(IUserService userService, ICustomerRepository customerRepository)
        {
            _userService = userService;
            _customerRepository = customerRepository;
        }

        [LoginAuthorize]
        public ActionResult Index()
        {
            return View();
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

                    return RedirectToAction("Index", "Account");
                }
            }
            else
            {
                ModelState.AddModelError("", "参数验证失败.");
            }

            return View(model);
        }

        ////
        //// POST: /Account/LogOff

        public ActionResult LogOff()
        {
            base.Signout();

            return RedirectToAction("Index", "Home");
        }

        [LoginAuthorize]
        public ActionResult ChangePassword()
        {
            return View();
        }

        [HttpPost]
        [LoginAuthorize]
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
        public ActionResult Register()
        {
            return View();
        }

        ////
        //// GET: /Account/Register
        [HttpPost]
        public ActionResult Register(FormCollection formCollection, RegisterViewModel viewModel, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                var userEntity = new UserEntity();
                userEntity.CreatedDate = DateTime.Now;
                userEntity.UpdatedDate = DateTime.Now;
                userEntity.Description = String.Empty;
                userEntity.EMail = viewModel.Email;
                userEntity.Gender = 0;
                userEntity.LastLoginDate = DateTime.Now;
                userEntity.Logo = String.Empty;
                userEntity.Mobile = String.Empty;
                userEntity.Name = viewModel.UserName;
                userEntity.Password = viewModel.Password;
                userEntity.Nickname = viewModel.Nickname;
                userEntity.Status = (int)DataStatus.Normal;
                userEntity.UserLevel = (int)UserLevel.User;

                var e = _customerRepository.Insert(userEntity);

                //写认证
                SetAuthorize(new WebSiteUser(e.Name, e.Id, e.Nickname, UserRole.User));

                if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1 && returnUrl.StartsWith("/")
            && !returnUrl.StartsWith("//") && !returnUrl.StartsWith("/\\"))
                {
                    return Redirect(returnUrl);
                }

                return RedirectToAction("Index");
            }
            else
            {
                ModelState.AddModelError("", "验证错误.");
            }

            return View(viewModel);
        }

        [LoginAuthorize]
        public ActionResult Details()
        {
            var userModel = _userService.Get(base.CurrentUser.CustomerId);

            var dto = new DetailsDto { User = userModel };

            return View(dto);
        }
    }
}
