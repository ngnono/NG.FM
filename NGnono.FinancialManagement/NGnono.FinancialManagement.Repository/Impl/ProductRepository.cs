using System.Data.Entity;
using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.Framework.Data.EF;

namespace NGnono.FinancialManagement.Repository.Impl
{
    public class ProductRepository : EFRepository<ProductEntity, int>, IProductRepository
    {
        public ProductRepository(DbContext context) : base(context)
        {
        }
    }
}