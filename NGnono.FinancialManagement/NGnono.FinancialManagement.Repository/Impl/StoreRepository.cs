using System.Data.Entity;
using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.Framework.Data.EF;

namespace NGnono.FinancialManagement.Repository.Impl
{
    public class StoreRepository : EFRepository<StoreEntity, int>, IStoreRepository
    {
        protected StoreRepository(DbContext context)
            : base(context)
        {
        }
    }
}