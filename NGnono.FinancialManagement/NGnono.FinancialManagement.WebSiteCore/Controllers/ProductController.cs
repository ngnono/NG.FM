using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web.Mvc;
using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.Models.Enums;
using NGnono.FinancialManagement.Models.Filters;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.FinancialManagement.WebSiteCore.Manager;
using NGnono.FinancialManagement.WebSiteCore.Models.Dto.Product;
using NGnono.FinancialManagement.WebSiteCore.Models.Requests.Product;
using NGnono.FinancialManagement.WebSiteCore.Models.Vo;
using NGnono.FinancialManagement.WebSupport.Binder;
using NGnono.FinancialManagement.WebSupport.Mvc.Controllers;
using NGnono.FinancialManagement.WebSupport.Mvc.Filters;
using NGnono.Framework.Data.EF;
using NGnono.Framework.Mapping;
using NGnono.Framework.Models;
using NGnono.Framework.Web.Mvc.ActionResults;

namespace NGnono.FinancialManagement.WebSiteCore.Controllers
{
    public class ProductController : UserController
    {
        private readonly IProductRepository _productRepository;
        private readonly IStoreRepository _storeRepository;
        private readonly IBrandRepository _brandRepository;
        private readonly ITagRepository _tagRepository;
        private readonly MapperManager _mapperManager = MapperManager.CurrentInstance;

        public ProductController(IBrandRepository brandRepository, ITagRepository tagRepository, IProductRepository productRepository, IStoreRepository storeRepository)
        {
            _productRepository = productRepository;
            _storeRepository = storeRepository;
            _brandRepository = brandRepository;
            _tagRepository = tagRepository;
        }

        #region methods

        /// <summary>
        /// 排序
        /// </summary>
        /// <param name="sort"></param>
        /// <returns></returns>
        private static Func<IQueryable<ProductEntity>, IOrderedQueryable<ProductEntity>> GetOrder(ProductSortOrder sort)
        {
            Func<IQueryable<ProductEntity>, IOrderedQueryable<ProductEntity>> order;
            switch (sort)
            {
                case ProductSortOrder.Default:
                default:
                    order = v => v.OrderByDescending(s => s.SortOrder).ThenByDescending(s => s.CreatedDate);
                    break;
            }

            return order;
        }

        /// <summary>
        /// Filter
        /// </summary>
        /// <param name="productFilter"></param>
        /// <returns></returns>
        private static Expression<Func<ProductEntity, bool>> Filter(ProductFilter productFilter)
        {
            var filter = PredicateBuilder.True<ProductEntity>();

            if (productFilter.DataStatus != null)
            {
                filter = filter.And(v => v.Status.Equals((int)productFilter.DataStatus.Value));
            }

            if (productFilter.UserId != null)
            {
                filter = filter.And(v => v.RecommendUser.Equals(productFilter.UserId.Value));
            }

            if (productFilter.BrandId != null)
            {
                filter = filter.And(v => v.Brand_Id.Equals(productFilter.BrandId.Value));
            }

            if (productFilter.StoreId != null)
            {
                filter = filter.And(v => v.Store_Id.Equals(productFilter.StoreId.Value));
            }

            if (productFilter.TagId != null)
            {
                filter = filter.And(v => v.Tag_Id.Equals(productFilter.TagId.Value));
            }

            if (productFilter.IsShare != null)
            {
                filter = filter.And(v => v.IsShare == productFilter.IsShare);
            }

            return filter;
        }

        private ProductViewModel Get(int productId)
        {
            var linq = _productRepository.Get(v => v.Id == productId);

            var s = linq.Join(_storeRepository.Get(v => v.Status.Equals((int)DataStatus.Normal)), f => f.Store_Id,
                         p => p.Id, (f, p) => new
                         {
                             P = f,
                             S = p
                         }).FirstOrDefault();
            var b =
                linq.Join(_brandRepository.Get(v => v.Status.Equals((int)DataStatus.Normal)), f => f.Brand_Id,
                          p => p.Id, (f, p) =>
                                     new
                                         {
                                             B = p,
                                             P = f
                                         }).FirstOrDefault();
            var t = linq.Join(_tagRepository.Get(v => v.Status.Equals((int)DataStatus.Normal)), f => f.Tag_Id,
                          p => p.Id, (f, p) =>
                                     new
                                     {
                                         T = p,
                                         P = f
                                     }).FirstOrDefault();

            var prod = linq.FirstOrDefault();

            if (prod == null)
            {
                return null;
            }

            var result = new ProductViewModel
                {
                    Brand = b == null ? null : b.B,
                    Product = prod,
                    Store = s == null ? null : s.S,
                    Tag = t == null ? null : t.T
                };

            return result;
        }

        #endregion

        [LoginAuthorize]
        public ActionResult MyIndex(ListRequest request, PagerRequest pagerRequest)
        {
            var linq = _productRepository.Get(Filter(new ProductFilter
            {
                DataStatus = DataStatus.Normal,
                UserId = request.CustomerId
            }));

            var totalCount = linq.Count();

            var result = pagerRequest.PageIndex == 1 ? linq.Take(pagerRequest.PageSize) : linq.Skip((pagerRequest.PageSize - 1) * pagerRequest.PageSize).Take(pagerRequest.PageSize);

            var dto = new ListDto(pagerRequest, totalCount)
            {
                Datas = result.ToList()
            };

            return View(dto);
        }

        [LoginAuthorize]
        public ActionResult Create()
        {
            var model = new CreatedProductViewModel();
            model.Brands =
                _brandRepository.Get(
                    v => v.Status == (int)DataStatus.Normal && v.CreatedUser == CurrentUser.CustomerId).ToList();

            model.Stores = _storeRepository.Get(v => v.Status == (int)DataStatus.Normal && v.CreatedUser == CurrentUser.CustomerId).ToList();

            model.Tags = _tagRepository.Get(v => v.Status == (int)DataStatus.Normal && v.CreatedUser == CurrentUser.CustomerId).ToList();

            return View(model);
        }

        [HttpPost]
        [LoginAuthorize]
        public ActionResult Create(FormCollection formCollection, CreatedProductViewModel model)
        {
            if (ModelState.IsValid)
            {
                var entity = _mapperManager.ProductMapper(model);
                entity.CreatedDate = DateTime.Now;
                entity.CreatedUser = base.CurrentUser.CustomerId;
                entity.UpdatedDate = DateTime.Now;
                entity.UpdatedUser = base.CurrentUser.CustomerId;
                entity.Brand = _brandRepository.Find(entity.Brand_Id);
                entity.Store = _storeRepository.Find(entity.Store_Id);
                entity.Tag = _tagRepository.Find(entity.Tag_Id);
                entity.Favorable = string.Empty;
                entity.RecommendedReason = string.Empty;
                entity.RecommendUser = base.CurrentUser.CustomerId;
                entity.Status = (int)DataStatus.Normal;

                entity = _productRepository.Insert(entity);

                //var r = Get(e.Id);

                return new RestfulResult
                {
                    Data = new ExecuteResult<int>(entity.Id) { StatusCode = StatusCode.Success, Message = "" }
                };
            }
            else
            {
                // 如果我们进行到这一步时某个地方出错，则重新显示表单
                //var dto = new CreateDto { Tags = tagList };
                //dto.Vo = vo;
                //dto.IsError = true;
                //return View("Success",new SuccessViewModel{});
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

        public ActionResult Details([FetchProduct(KeyName = "productid")]ProductEntity model)
        {

            return View(model);


        }

        public ActionResult Index(ListRequest request, PagerRequest pagerRequest)
        {
            return List(request, pagerRequest)
             ;
        }

        public ActionResult List(ListRequest request, PagerRequest pagerRequest)
        {
            var linq = _productRepository.Get(Filter(new ProductFilter
                {
                    DataStatus = DataStatus.Normal,
                    UserId = request.CustomerId,
                    IsShare = true
                })).OrderByDescending(v=>v.UpdatedDate);

            var totalCount = linq.Count();

            var result = pagerRequest.PageIndex == 1 ? linq.Take(pagerRequest.PageSize) : linq.Skip((pagerRequest.PageIndex - 1) * pagerRequest.PageSize).Take(pagerRequest.PageSize);

            var dto = new ListDto(pagerRequest, totalCount)
                {
                    Datas = result.ToList()
                };

            return View("List", dto);
        }

        [LoginAuthorize]
        [ModelOwnerCheck(TakeParameterName = "model", CustomerPropertyName = "RecommendUser")]
        public ActionResult Update([FetchProduct(KeyName = "productid")]ProductEntity model)
        {
            var vo = Mapper.Map<ProductEntity, UpdateProductViewModel>(model);


            vo.Brands =
                _brandRepository.Get(
                    v => v.Status == (int)DataStatus.Normal && v.CreatedUser == CurrentUser.CustomerId).ToList();

            vo.Stores = _storeRepository.Get(v => v.Status == (int)DataStatus.Normal && v.CreatedUser == CurrentUser.CustomerId).ToList();

            vo.Tags = _tagRepository.Get(v => v.Status == (int)DataStatus.Normal && v.CreatedUser == CurrentUser.CustomerId).ToList();


            return View(vo);
        }

        [HttpPost]
        [LoginAuthorize]
        [ModelOwnerCheck(TakeParameterName = "model", CustomerPropertyName = "RecommendUser")]
        public ActionResult Update(FormCollection formCollection, [FetchProduct(KeyName = "productid")]ProductEntity model, UpdateProductViewModel vo)
        {
            if (ModelState.IsValid)
            {
                var id = model.Id;

                model = Mapper.Map(vo, model);
                //model.Brand = _brandRepository.Find(vo.Brand_Id);
                //model.Store = _storeRepository.Find(vo.Store_Id);
                //model.Tag = _tagRepository.Find(vo.Tag_Id);
                model.UpdatedDate = DateTime.Now;
                model.UpdatedUser = base.CurrentUser.CustomerId;
                model.Id = id;
                model.RecommendedReason = String.Empty;
                model.Favorable = String.Empty;
                _productRepository.Update(model);

                return new RestfulResult
                {
                    Data = new ExecuteResult<int>(model.Id) { StatusCode = StatusCode.Success, Message = "" }
                };
            }
            else
            {
                // 如果我们进行到这一步时某个地方出错，则重新显示表单
                //var dto = new CreateDto { Tags = tagList };
                //dto.Vo = vo;
                //dto.IsError = true;
                //return View("Success",new SuccessViewModel{});
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
        [ModelOwnerCheck(TakeParameterName = "model", CustomerPropertyName = "RecommendUser")]
        public RestfulResult Del(FormCollection formCollection, [FetchProduct(KeyName = "productid")]ProductEntity model)
        {
            var name = model.Name;
            _productRepository.Delete(model);

            var result = new ExecuteResult { StatusCode = StatusCode.Success, Message = name + "删除成功" };

            return new RestfulResult
                {
                    Data = result
                };
        }
    }

    public class ProductPriceController : DefController
    {
        public ActionResult GetList()
        {
            return View();
        }

        [HttpPost]
        [LoginAuthorize]
        public ActionResult Create(FormCollection formCollection)
        {
            return View();
        }

        [HttpPost]
        [LoginAuthorize]
        public ActionResult Update(FormCollection formCollection)
        {
            return View();
        }

        [HttpPost]
        [LoginAuthorize]
        public ActionResult Del(FormCollection formCollection)
        {
            return View();
        }
    }
}