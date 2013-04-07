using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NGnono.FinancialManagement.Models.Enums;

namespace NGnono.FinancialManagement.Models.Filters
{
    public class ProductFilter
    {
        public int? UserId { get; set; }

        public DataStatus? DataStatus { get; set; }
    }
}
