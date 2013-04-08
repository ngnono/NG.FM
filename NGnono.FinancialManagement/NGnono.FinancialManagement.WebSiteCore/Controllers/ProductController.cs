using System;
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
    public class ProductController : DefController
    {
        private readonly IProductRepository _productRepository;
        private readonly MapperManager _mapperManager;
        private readonly IStoreRepository _storeRepository;
        private readonly IBrandRepository _brandRepository;
        private readonly ITagRepository _tagRepository;

        public ProductController(IBrandRepository brandRepository, ITagRepository tagRepository, IProductRepository productRepository, MapperManager mapperManager, IStoreRepository storeRepository)
        {
            _mapperManager = mapperManager;
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
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [LoginAuthorize]
        public ActionResult Create(FormCollection formCollection, CreatedProductViewModel model)
        {
            if (ModelState.IsValid)
            {
                var entity = _mapperManager.ProductMapper(model);

                var e = _productRepository.Insert(entity);

                var r = Get(e.Id);

                return View("Update", r);
            }
            else
            {
                ModelState.AddModelError("", "参数验证失败.");
            }

            return View(model);
        }

        public ActionResult Details([FetchProduct(KeyName = "productid")]ProductEntity model)
        {
            var r = Get(model.Id);

            return View(r);
        }

        public ActionResult List(ListRequest request, PagerRequest pagerRequest)
        {
            var linq = _productRepository.Get(Filter(new ProductFilter
                {
                    DataStatus = DataStatus.Normal,
                    UserId = request.CustomerId
                }));

            var r = linq.Join(_storeRepository.Get(v => v.Status.Equals((int)DataStatus.Normal)), f => f.Store_Id,
                         p => p.Id, (f, p) => new ProductViewModel
                             {
                                 Product = f,
                                 Store = p
                             });
            var totalCount = r.Count();

            var result = pagerRequest.PageIndex == 1 ? r.Take(pagerRequest.PageSize) : r.Skip((pagerRequest.PageSize - 1) * pagerRequest.PageSize).Take(pagerRequest.PageSize);

            var dto = new ListDto
                {
                    Products = new ProductCollectionViewModel(pagerRequest, totalCount) { Datas = result.ToList() }
                };

            return View(dto);
        }

        [LoginAuthorize]
        [ModelOwnerCheck(TakeParameterName = "model", CustomerPropertyName = "RecommendUser")]
        public ActionResult Update([FetchProduct(KeyName = "productid")]ProductEntity model)
        {
            var r = Get(model.Id);

            return View(r);
        }

        [HttpPost]
        [LoginAuthorize]
        [ModelOwnerCheck(TakeParameterName = "model", CustomerPropertyName = "RecommendUser")]
        public ActionResult Update(FormCollection formCollection, [FetchProduct(KeyName = "productid")]ProductEntity model, UpdateProductViewModel vo)
        {
            if (ModelState.IsValid)
            {
                model = Mapper.Map(vo, model);

                _productRepository.Update(model);

                return View(Get(model.Id));
            }
            else
            {
                ModelState.AddModelError("", "参数验证失败.");
            }

            return View(vo);
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
        public ActionResult List()
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

    public class StoreController : DefController
    {
        public ActionResult List()
        {
            return View();
        }

        public ActionResult Details()
        {
            return View();
        }

        [HttpPost]
        [LoginAuthorize]
        public ActionResult Create(FormCollection formCollection)
        {
            return View("Details");
        }

        [HttpPost]
        [LoginAuthorize]
        public ActionResult Update(FormCollection formCollection)
        {
            return View("Details");
        }

        [HttpPost]
        [LoginAuthorize]
        public ActionResult Del(FormCollection formCollection)
        {
            return View("Details");
        }
    }
}