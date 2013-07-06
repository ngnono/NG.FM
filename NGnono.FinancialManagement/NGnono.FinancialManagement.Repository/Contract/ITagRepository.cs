using NGnono.FinancialManagement.Data.Models;
using NGnono.Framework.Data;
using NGnono.Framework.Data.EF;

namespace NGnono.FinancialManagement.Repository.Contract
{
    public interface ITagRepository : IEFRepository<TagEntity, int>
    {
    }
}