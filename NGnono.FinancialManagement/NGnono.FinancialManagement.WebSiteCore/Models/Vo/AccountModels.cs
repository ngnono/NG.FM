using System.ComponentModel.DataAnnotations;
using NGnono.Framework.Models;

namespace NGnono.FinancialManagement.WebSiteCore.Models.Vo
{
    public class LoginViewModel : BaseViewModel
    {
        [Required]
        [StringLength(32, MinimumLength = 6)]
        [Display(Name = "UserName")]
        public string UserName { get; set; }

        [Required]
        [StringLength(32, MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        //[Required]
        [StringLength(4, MinimumLength = 4)]
        [Display(Name = "VerifyCode")]
        public string VerifyCode { get; set; }
    }
}
