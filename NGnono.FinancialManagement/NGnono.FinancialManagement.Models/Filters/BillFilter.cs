using NGnono.FinancialManagement.Models.Enums;
using NGnono.Framework.Models;

namespace NGnono.FinancialManagement.Models.Filters
{
    public abstract class BaseFilter
    {
        public bool? IsDeleted { get; set; }

        public DataStatus? DataStatus { get; set; }
    }

    public class BillFilter : BaseFilter
    {
        public int? UserId { get; set; }

        public Timestamp Timestamp { get; set; }

        public DateTimeRangeInfo DataDateRange { get; set; }
    }
}
