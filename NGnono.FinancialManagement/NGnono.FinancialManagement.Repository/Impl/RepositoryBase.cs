using System.Collections.Generic;
using NGnono.Framework.Data;
using NGnono.Framework.Models;

namespace NGnono.FinancialManagement.Repository.Impl
{
    public abstract class RepositoryBase<TEntity, TKey> : IRepository<TEntity, TKey> where TEntity : BaseEntity
    {
        public abstract IEnumerable<TEntity> FindAll();
        public abstract TEntity GetItem(TKey key);
    }
}