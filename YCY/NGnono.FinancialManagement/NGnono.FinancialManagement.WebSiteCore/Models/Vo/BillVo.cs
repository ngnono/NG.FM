using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using NGnono.FinancialManagement.Models.Enums;
using NGnono.Framework;
using NGnono.Framework.Models;

namespace NGnono.FinancialManagement.WebSiteCore.Models.Vo
{
    public class BillViewModel
    {
        [Required]
        [RegularExpression(RegularDefine.Money, ErrorMessage = "只能输入金额,1~2位小数")]
        [Display(Name = "金额")]
        public decimal Amount { get; set; }
        [Range(0, Int32.MaxValue)]
        public int Mode { get; set; }
        [Range(0, Int32.MaxValue)]
        public int User_Id { get; set; }
        [Range(0, Int32.MaxValue)]
        public int Tag_Id { get; set; }
        [Range(0, Int32.MaxValue)]
        public int Type { get; set; }
        [StringLength(128, MinimumLength = 0)]
        [Display(Name = "备注")]
        public string Description { get; set; }
        [DataType(DataType.DateTime)]
        public System.DateTime DataDateTime { get; set; }
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
