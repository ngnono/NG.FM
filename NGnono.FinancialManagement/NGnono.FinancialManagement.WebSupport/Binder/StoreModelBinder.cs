using NGnono.FinancialManagement.Repository.Contract;
using NGnono.Framework.Web.Mvc.Binders;
using System;

namespace NGnono.FinancialManagement.WebSupport.Binder
{
    public class StoreModelBinder : ModelBinderBase
    {
        private readonly IStoreRepository _repository;

        public StoreModelBinder(IStoreRepository service)
        {
            _repository = service;
        }

        #region Overrides of ModelBinderBase

        /// <summary>
        /// 根据模型标识获取模型实例
        /// </summary>
        /// <param name="modelId">
        /// 模型标识
        /// </param>
        /// <returns>
        /// 模型实例
        /// </returns>
        protected override object GetModelInstance(string modelId)
        {
            return _repository.GetItem(Int32.Parse(modelId));
        }

        #endregion
    }

    public class FetchStoreAttribute : UseBinderAttribute
    {
        public FetchStoreAttribute()
            : base(typeof(StoreModelBinder))
        {
        }
    }
}
