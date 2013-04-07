using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NGnono.FinancialManagement.WebSiteCore.Models.Vo;

namespace NGnono.FinancialManagement.WebSiteCore.Models.Dto.Product
{
    public class DetailsDto : BaseDto
    {
        public ProductViewModel Product { get; set; }
    }

    public class ListDto : BaseDto
    {
        public ProductCollectionViewModel Products { get; set; }
    }
}
