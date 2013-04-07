using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.WebSiteCore.Models.Dto.Bill;
using NGnono.Framework.Mapping;

namespace NGnono.FinancialManagement.WebSiteCore.Manager
{
    public class MapperManager
    {
        #region bill

        public BillEntity BillMapper(BillVo source)
        {
            if (source == null)
            {
                return null;
            }

            var target = Mapper.Map<BillVo, BillEntity>(source);

            return target;
        }

        public BillVo BillMapper(BillEntity source)
        {
            if (source == null)
            {
                return null;
            }

            var target = Mapper.Map<BillEntity, BillVo>(source);

            return target;
        }

        #endregion
    }
}
