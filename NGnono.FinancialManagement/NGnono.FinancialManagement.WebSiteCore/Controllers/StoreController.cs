using System;
using System.Collections.Generic;
using System.Linq;
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
    public class StoreController : UserController
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
        public ActionResult Create(FormCollection formCollection, CreateStoreViewModel vo)
        {
            if (ModelState.IsValid)
            {
                var entity = Mapper.Map<CreateStoreViewModel, StoreEntity>(vo);
                entity.CreatedDate = DateTime.Now;
                entity.CreatedUser = base.CurrentUser.CustomerId;
                entity.UpdatedDate = DateTime.Now;
                entity.UpdatedUser = base.CurrentUser.CustomerId;
                entity.Status = (int)DataStatus.Normal;

                _storeRepository.Insert(entity);

                return new RestfulResult
                {
                    Data = new ExecuteResult<int>(entity.Id) { StatusCode = StatusCode.Success, Message = "" }
                };
            }
            else
            {
                List<string> sb = new List<string>();
                //获取所有错误的Key
                List<string> Keys = ModelState.Keys.ToList();
                //获取每一个key对应的ModelStateDictionary
                foreach (var key in Keys)
                {
                    var errors = ModelState[key].Errors.ToList();
                    //将错误描述添加到sb中
                    foreach (var error in errors)
                    {
                        sb.Add(error.ErrorMessage);
                    }
                }

                return new RestfulResult
                {
                    Data = new ExecuteResult<List<string>>(sb) { StatusCode = StatusCode.ClientError, Message = "验证失败" }
                };
            }


        }

        [HttpPost]
        [LoginAuthorize]
        [ModelOwnerCheck(TakeParameterName = "store", CustomerPropertyName = "CreatedUser")]
        public ActionResult Update(FormCollection formCollection, [FetchStore(KeyName = "id")]StoreEntity store, UpdateStoreViewModel vo)
        {
            if (ModelState.IsValid)
            {
                store = Mapper.Map(vo, store);
                store.UpdatedDate = DateTime.Now;
                store.UpdatedUser = base.CurrentUser.CustomerId;

                _storeRepository.Update(store);

                return new RestfulResult
                {
                    Data = new ExecuteResult<int>(store.Id) { StatusCode = StatusCode.Success, Message = "" }
                };
            }
            else
            {
                ModelState.AddModelError("", "参数验证失败.");
                List<string> sb = new List<string>();
                //获取所有错误的Key
                List<string> Keys = ModelState.Keys.ToList();
                //获取每一个key对应的ModelStateDictionary
                foreach (var key in Keys)
                {
                    var errors = ModelState[key].Errors.ToList();
                    //将错误描述添加到sb中
                    foreach (var error in errors)
                    {
                        sb.Add(error.ErrorMessage);
                    }
                }

                return new RestfulResult
                {
                    Data = new ExecuteResult<List<string>>(sb) { StatusCode = StatusCode.ClientError, Message = "验证失败" }
                };
            }
        }

        [LoginAuthorize]
        [ModelOwnerCheck(TakeParameterName = "store", CustomerPropertyName = "CreatedUser")]
        public ActionResult Update([FetchStore(KeyName = "storeid")]StoreEntity store)
        {
            var vo = Mapper.Map<StoreEntity, UpdateStoreViewModel>(store);

            return View(vo);
        }

        [LoginAuthorize]
        public ActionResult UpdateList()
        {
            var data =
                _storeRepository.Get(
                    v => v.Status == (int) DataStatus.Normal && v.CreatedUser == CurrentUser.CustomerId)
                                .OrderByDescending(v => v.UpdatedDate).ToList();

            return View(data);
        }


        [HttpPost]
        [LoginAuthorize]
        [ModelOwnerCheck(TakeParameterName = "store", CustomerPropertyName = "CreatedUser")]
        public ActionResult Del(FormCollection formCollection, [FetchStore(KeyName = "id")]StoreEntity store)
        {
            _storeRepository.Delete(store);

            return new RestfulResult
            {
                Data = new ExecuteResult<int>() { StatusCode = StatusCode.Success, Message = "" }
            };
        }
    }
}