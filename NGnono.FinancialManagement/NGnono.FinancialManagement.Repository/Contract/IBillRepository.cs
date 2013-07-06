using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.Models.Enums;
using NGnono.FinancialManagement.Models.Filters;
using NGnono.Framework.Data;
using NGnono.Framework.Data.EF;
using NGnono.Framework.Models;

namespace NGnono.FinancialManagement.Repository.Contract
{
    public interface IBillRepository : IEFRepository<BillEntity, int>
    {
        IEnumerable<BillEntity> GetResult(BillFilter filter);

        IEnumerable<BillEntity> GetPagedList(PagerRequest pagerRequest, out  int totalCount, BillFilter filter, BillSortOrder sortOrder);
    }
}
