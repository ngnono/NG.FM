using System;
using System.Collections.Generic;
using System.Web.Mvc;
using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.Models;
using NGnono.FinancialManagement.Models.Enums;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.FinancialManagement.WebSiteCore.Models.Vo;
using NGnono.FinancialManagement.WebSupport.Binder;
using NGnono.FinancialManagement.WebSupport.Mvc.Controllers;
using NGnono.FinancialManagement.WebSupport.Mvc.Filters;
using NGnono.Framework.Mapping;
using NGnono.Framework.Models;
using NGnono.Framework.Web.Mvc.ActionResults;

namespace NGnono.FinancialManagement.WebSiteCore.Controllers
{
    public class StoreController : DefController
    {
        private readonly IStoreRepository _storeRepository;

        public StoreController(IStoreRepository storeRepository)
        {
            _storeRepository = storeRepository;
        }

        public ActionResult List()
        {
            return View();
        }

        public RestfulResult GetList()
        {
            var entitis = _storeRepository.GetAll();

            var list = new List<StoreViewModel>();
            foreach (var storeEntity in entitis)
            {
                list.Add(Mapper.Map<StoreEntity, StoreViewModel>(storeEntity));
            }

            return new RestfulResult
                {
                    Data = new ExecuteResult<List<StoreViewModel>>(list) { StatusCode = StatusCode.Success }
                };
        }

        public ActionResult Details([FetchStore(KeyName = "storeid")]StoreEntity model)
        {
            return View(Mapper.Map<StoreEntity, StoreViewModel>(model));
        }

        [LoginAuthorize]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [LoginAuthorize]
        public ActionResult Create(FormCollection formCollection, CreateStoreViewModel vo, [FetchUser(KeyName = "userid")]UserModel userModel)
        {
            if (ModelState.IsValid)
            {
                var entity = Mapper.Map<CreateStoreViewModel, StoreEntity>(vo);
                entity.CreatedDate = DateTime.Now;
                entity.CreatedUser = userModel.Id;
                entity.UpdatedDate = DateTime.Now;
                entity.UpdatedUser = userModel.Id;
                entity.Status = (int)DataStatus.Normal;

                _storeRepository.Insert(entity);
            }
            else
            {
                ModelState.AddModelError("", "参数验证失败.");
            }

            return View();
        }

        [HttpPost]
        [LoginAuthorize]
        //[ModelOwnerCheck(TakeParameterName = "store", CustomerPropertyName = "User_Id")]
        public ActionResult Update(FormCollection formCollection, [FetchStore(KeyName = "storeid")]StoreEntity store, UpdateStoreViewModel vo, [FetchUser(KeyName = "userid")]UserModel userModel)
        {
            if (ModelState.IsValid)
            {
                store = Mapper.Map(vo, store);
                store.UpdatedDate = DateTime.Now;
                store.UpdatedUser = userModel.Id;

                _storeRepository.Insert(store);
            }
            else
            {
                ModelState.AddModelError("", "参数验证失败.");
            }

            return View();
        }

        [HttpPost]
        [LoginAuthorize]
        //[ModelOwnerCheck(TakeParameterName = "store", CustomerPropertyName = "User_Id")]
        public ActionResult Del(FormCollection formCollection, [FetchStore(KeyName = "storeid")]StoreEntity store, [FetchUser(KeyName = "userid")]UserModel userModel)
        {
            _storeRepository.Delete(store);

            return View();
        }
    }
}