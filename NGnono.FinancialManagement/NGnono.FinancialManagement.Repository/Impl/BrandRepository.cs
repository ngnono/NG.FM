using System.Data.Entity;
using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.Framework.Data.EF;

namespace NGnono.FinancialManagement.Repository.Impl
{
    public class BrandRepository : EFRepository<BrandEntity, int>, IBrandRepository
    {
        public BrandRepository(DbContext context) : base(context)
        {
        }
    }
}
