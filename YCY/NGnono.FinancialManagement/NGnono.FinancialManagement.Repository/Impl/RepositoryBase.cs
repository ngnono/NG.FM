using System.Collections.Generic;
using System.Data.Entity;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.Framework.Data.EF;
using NGnono.Framework.Models;
using NGnono.Framework.ServiceLocation;

namespace NGnono.FinancialManagement.Repository.Impl
{
    public abstract class RepositoryBase<TEntity, TKey> : EFRepository<TEntity>, IRepository<TEntity, TKey> where TEntity : BaseEntity
    {
        private DbContext _innerContext;
        //提供IOC注入方式接口
        /// <summary>
        /// EF构造
        /// </summary>
        /// <param name="context"></param>
        protected RepositoryBase(DbContext context)
            : base(context)
        {
        }

        protected RepositoryBase()
            : this(ServiceLocator.Current.Resolve<DbContext>())
        {
        }

        protected DbContext Context
        {
            get { return _innerContext ?? (_innerContext = ServiceLocator.Current.Resolve<DbContext>()); }
        }

        #region IRepository<TEntity, TKey> 成员


        public override void Update(TEntity entity)
        {
            base.Update(entity);

            //执行验证业务
            //context.Entry<T>(entity).GetValidationResult();
            //if (Context.Entry<TEntity>(entity).State == EntityState.Modified)
            //    Context.SaveChanges();
            //return entity;
        }

        public override void Delete(TEntity entity)
        {
            base.Delete(entity);
        }

        public override TEntity Find(params object[] keyValues)
        {
            return base.Find(keyValues);
        }

        public IEnumerable<TEntity> FindAll()
        {
            return GetAll();
        }

        public IEnumerable<TEntity> AutoComplete(string name)
        {
            return GetAll();
        }

        #endregion

        /// <summary>
        /// 查找key
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public virtual TEntity GetItem(TKey key)
        {
            return base.Find(key);
        }
    }
}