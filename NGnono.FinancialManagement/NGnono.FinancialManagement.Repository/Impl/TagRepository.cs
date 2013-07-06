using System.Data.Entity;
using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.Framework.Data.EF;

namespace NGnono.FinancialManagement.Repository.Impl
{
    public class TagRepository : EFRepository<TagEntity, int>, ITagRepository
    {
        protected TagRepository(DbContext context) : base(context)
        {
        }
    }
}