using System;
using System.Linq;
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
    public class TagController : UserController
    {
        private readonly ITagRepository _tagRepository;

        public TagController(ITagRepository tagRepository)
        {
            _tagRepository = tagRepository;
        }

        [LoginAuthorize]
        public ActionResult Create()
        {
            return View();
        }

        [LoginAuthorize]
        [HttpPost]
        public ActionResult Create(FormCollection formCollection, TagCreateViewModel vo)
        {
            if (this.ModelState.IsValid)
            {
                var entity = new TagEntity
                    {
                        Name = vo.Name,
                        Description = String.Empty,
                        CreatedDate = DateTime.Now,
                        CreatedUser = base.CurrentUser.CustomerId,
                        UpdatedDate = DateTime.Now,
                        Status = (int)DataStatus.Normal,
                        UpdatedUser = 0
                    };
                var entityNew = this._tagRepository.Insert(entity);

                return View("Success", new SuccessViewModel
                    {
                        BackName = "主页",
                        BackUrl = Url.Action("Index", "Home"),
                        MessageDesc = "创建分类:" + entityNew.Name + " 成功",
                        MessageTitle = "创建分类成功",
                        Title = "创建分类成功"
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
        [ModelOwnerCheck(TakeParameterName = "tag", CustomerPropertyName = "CreatedUser")]
        public ActionResult Update(FormCollection formCollection, [FetchTag(KeyName = "tagid")]TagEntity tag, TagCreateViewModel vo)
        {
            if (this.ModelState.IsValid)
            {
                tag = Mapper.Map(vo, tag);
                tag.UpdatedDate = DateTime.Now;
                tag.UpdatedUser = base.CurrentUser.CustomerId;

                this._tagRepository.Update(tag);

                return View("Success", new SuccessViewModel
                    {
                        BackName = "主页",
                        BackUrl = Url.Action("Index", "Home"),
                        MessageDesc = "编辑分类:" + tag.Name + " 成功",
                        MessageTitle = "编辑分类成功",
                        Title = "编辑分类成功"
                    });
            }
            else
            {
                ModelState.AddModelError("", "参数验证错误.");
                tag.Name = vo.Name;
            }

            return View(tag);
        }

        [LoginAuthorize]
        [ModelOwnerCheck(TakeParameterName = "tag", CustomerPropertyName = "CreatedUser")]
        public ActionResult Update([FetchTag(KeyName = "tagid")]TagEntity tag)
        {
            return View(tag);
        }

        [LoginAuthorize]
        public ActionResult UpdateList()
        {
            var list =
                _tagRepository.Get(
                    v => v.Status.Equals((int)DataStatus.Normal) && v.CreatedUser == CurrentUser.CustomerId).ToList();

            return View(list);
        }
    }
}