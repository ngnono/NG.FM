using NGnono.Framework.Logger;
using NGnono.Framework.ServiceLocation;

namespace NGnono.FinancialManagement.WebSupport.Mvc.Controllers
{
    public abstract class BaseController : System.Web.Mvc.Controller
    {
        protected BaseController()
        {
            Logger = ServiceLocator.Current.Resolve<ILog>();
        }

        /// <summary>
        /// Gets or sets ILog.
        /// </summary>
        public ILog Logger
        {
            get;
            set;
        }
    }
}