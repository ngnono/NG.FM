using System.Collections.Generic;
using NGnono.Framework.Data.EF;
using NGnono.Framework.Models;

namespace NGnono.FinancialManagement.Repository.Contract
{
    public interface IRepository<TEntity, in TKey> : IEFRepository<TEntity>
        where TEntity : BaseEntity
    {

        /// <summary>
        /// 全部
        /// </summary>
        /// <returns></returns>
        IEnumerable<TEntity> FindAll();

        /// <summary>
        /// 查找key
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        TEntity GetItem(TKey key);

        /// <summary>
        /// Autocomplete interface
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>
        IEnumerable<TEntity> AutoComplete(string query);
    }
}
