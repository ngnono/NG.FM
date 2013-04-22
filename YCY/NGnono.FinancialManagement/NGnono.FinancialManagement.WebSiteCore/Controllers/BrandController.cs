using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.Models.Enums;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.FinancialManagement.WebSiteCore.Models.Vo;
using NGnono.FinancialManagement.WebSupport.Binder;
using NGnono.FinancialManagement.WebSupport.Mvc.Controllers;
using NGnono.FinancialManagement.WebSupport.Mvc.Filters;
using NGnono.Framework.Mapping;

namespace NGnono.FinancialManagement.WebSiteCore.Controllers
{
    public class BrandController : UserController
    {
        private readonly IBrandRepository _repository;

        public BrandController(IBrandRepository repository)
        {
            _repository = repository;
        }

        [LoginAuthorize]
        public ActionResult Create()
        {
            return View();
        }

        [LoginAuthorize]
        [HttpPost]
        public ActionResult Create(FormCollection formCollection, BrandCreateViewModel vo)
        {
            if (this.ModelState.IsValid)
            {
                var entity = new BrandEntity{
                        Name = vo.Name,
                        EnglishName = String.Empty,
                        Description = String.Empty,
                        Logo = String.Empty,
                        Group = String.Empty,
                        WebSite = String.Empty,
                        CreatedDate = DateTime.Now,
                        CreatedUser = base.CurrentUser.CustomerId,
                        UpdatedDate = DateTime.Now,
                        Status = (int)DataStatus.Normal,
                        UpdatedUser = 0
                    };
                var entityNew = this._repository.Insert(entity);

                return View("Success", new SuccessViewModel
                    {
                        BackName = "主页",
                        BackUrl = Url.Action("Index", "Home"),
                        MessageDesc = "创建品牌:" + entityNew.Name + " 成功",
                        MessageTitle = "创建品牌成功",
                        Title = "创建品牌成功"
                    });
            }
            else
            {
                ModelState.AddModelError("", "参数验证错误.");
            }

            return View(vo);
        }

        [LoginAuthorize]
        [HttpPost]
        [ModelOwnerCheck(TakeParameterName = "Brand", CustomerPropertyName = "CreatedUser")]
        public ActionResult Update(FormCollection formCollection, [FetchBrand(KeyName = "brandid")]BrandEntity Brand, BrandCreateViewModel vo)
        {
            if (this.ModelState.IsValid)
            {
                Brand = Mapper.Map(vo, Brand);
                Brand.UpdatedDate = DateTime.Now;
                Brand.UpdatedUser = base.CurrentUser.CustomerId;

                this._repository.Update(Brand);

                return View("Success", new SuccessViewModel
                    {
                        BackName = "主页",
                        BackUrl = Url.Action("Index", "Home"),
                        MessageDesc = "编辑品牌:" + Brand.Name + " 成功",
                        MessageTitle = "编辑品牌成功",
                        Title = "编辑品牌成功"
                    });
            }
            else
            {
                ModelState.AddModelError("", "参数验证错误.");
                Brand.Name = vo.Name;
            }

            return View(Brand);
        }

        [LoginAuthorize]
        [ModelOwnerCheck(TakeParameterName = "Brand", CustomerPropertyName = "CreatedUser")]
        public ActionResult Update([FetchBrand(KeyName = "Brandid")]BrandEntity Brand)
        {
            return View(Brand);
        }

        [LoginAuthorize]
        public ActionResult UpdateList()
        {
            var list =
                _repository.Get(
                    v => v.Status.Equals((int)DataStatus.Normal) && v.CreatedUser == CurrentUser.CustomerId).ToList();

            return View(list);
        }
    }
}
