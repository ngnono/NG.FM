using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NGnono.FinancialManagement.WebSiteCore.Models.Vo
{
    public class TagCreateViewModel : BaseViewModel
    {
        public int Id { get; set; }

        [Required]
        [StringLength(14, MinimumLength = 1)]
        [Display(Name = "分类名称")]
        public string Name { get; set; }
    }

    public class BrandCreateViewModel : BaseViewModel
    {
        public int Id { get; set; }

        [Required]
        [StringLength(14, MinimumLength = 1)]
        [Display(Name = "品牌名称")]
        public string Name { get; set; }
    }
}
