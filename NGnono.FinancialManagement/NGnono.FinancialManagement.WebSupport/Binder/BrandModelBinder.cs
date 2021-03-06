﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.Framework.Web.Mvc.Binders;

namespace NGnono.FinancialManagement.WebSupport.Binder
{
    public class BrandModelBinder : ModelBinderBase
    {
        private readonly IBrandRepository _repository;

        public BrandModelBinder(IBrandRepository service)
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

    public class FetchBrandAttribute : UseBinderAttribute
    {
        public FetchBrandAttribute()
            : base(typeof(BrandModelBinder))
        {
        }
    }
}
