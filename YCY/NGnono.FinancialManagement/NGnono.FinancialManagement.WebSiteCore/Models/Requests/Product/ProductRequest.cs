using NGnono.FinancialManagement.Models.Enums;

namespace NGnono.FinancialManagement.WebSiteCore.Models.Requests.Product
{
    public class ListRequest
    {
        public int? CustomerId { get; set; }

        public int? Sort { get; set; }

        public ProductSortOrder SortOrder
        {
            get { return Sort == null ? ProductSortOrder.Default : (ProductSortOrder)Sort.Value; }
            set { Sort = (int)value; }
        }
    }
}
