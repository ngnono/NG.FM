using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NGnono.FinancialManagement.Services.Contract;
using NGnono.Framework.Web.Mvc.Binders;

namespace NGnono.FinancialManagement.WebSupport.Binder
{
    public class UserModelBinder : ModelBinderBase
    {
        private readonly IUserService _userService;

        public UserModelBinder(IUserService userService)
        {
            _userService = userService;
        }

        protected override object GetModelInstance(string modelId)
        {
            return _userService.Get(Int32.Parse(modelId));
        }
    }

    public class FetchUserAttribute : UseBinderAttribute
    {
        public FetchUserAttribute()
            : base(typeof(UserModelBinder))
        {
        }
    }
}
