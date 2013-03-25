using System;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.Framework.Web.Mvc.Binders;

namespace NGnono.FinancialManagement.WebSupport.Binder
{
    public class BillModelBinder : ModelBinderBase
    {
        private readonly IBillRepository _repository;

        public BillModelBinder(IBillRepository service)
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

    public class FetchBillAttribute : UseBinderAttribute
    {
        public FetchBillAttribute()
            : base(typeof(BillModelBinder))
        {
        }
    }
}
