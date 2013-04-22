using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.WebSiteCore.Models.Vo;
using NGnono.Framework.Models;

namespace NGnono.FinancialManagement.WebSiteCore.Models.Dto.Product
{
    public class DetailsDto : BaseDto
    {
        public ProductEntity Product { get; set; }
    }

    public class ListDto : PagerInfoBaseViewModel<List<ProductEntity>>
    {
        public ListDto(PagerRequest request) : base(request)
        {
        }

        public ListDto(PagerRequest request, int totalCount) : base(request, totalCount)
        {
        }
    }

    public class IndexDto : PagerInfoBaseViewModel<List<ProductEntity>>
    {
        public IndexDto(PagerRequest request) : base(request)
        {
        }

        public IndexDto(PagerRequest request, int totalCount) : base(request, totalCount)
        {
        }
    }
}
