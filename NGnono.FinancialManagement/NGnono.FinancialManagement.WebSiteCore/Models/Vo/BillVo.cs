using System.Collections.Generic;
using NGnono.FinancialManagement.Models.Enums;
using NGnono.Framework.Models;

namespace NGnono.FinancialManagement.WebSiteCore.Models.Vo
{
    public class BillViewModel
    {
        public int Id { get; set; }
        public decimal Amount { get; set; }
        public int Mode { get; set; }
        public int User_Id { get; set; }
        public int Tag_Id { get; set; }
        public int Type { get; set; }
        public string Description { get; set; }
        public System.DateTime DataDateTime { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public System.DateTime UpdatedDate { get; set; }
        public int CreatedUser { get; set; }
        public int UpdatedUser { get; set; }
        public int Status { get; set; }
        public bool IsDeleted { get; set; }
        public int ExtendedContentType { get; set; }
        public string ExtendedContent { get; set; }
    }

    public class BillCollectionViewModel : PagerInfoBaseViewModel
    {
        public BillCollectionViewModel(PagerRequest request)
            : base(request)
        {
        }

        public BillCollectionViewModel(PagerRequest request, int totalCount)
            : base(request, totalCount)
        {
        }

        public List<BillViewModel> Datas { get; set; }
    }

    public class BillCreateViewModel : BillViewModel
    {
    }

    public class BillUpdateViewModel : BillViewModel
    {
    }

    public class DateRangeDetailInfo : BaseViewModel
    {
        public int Num { get; set; }

        public string RnageShowStr { get; set; }

        public string DateShowStr { get; set; }

        public DateType DateType { get; set; }

        public DateTimeRangeInfo StartEndDateTime { get; set; }
    }
}
