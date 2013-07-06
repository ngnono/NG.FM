using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using NGnono.FinancialManagement.WebSupport.App_Start;
using NGnono.FinancialManagement.WebSupport.Binder;
using NGnono.FinancialManagement.WebSupport.Ioc;
using NGnono.Framework.Models;
using NGnono.Framework.ServiceLocation;

namespace NGnono.FinancialManagement.WebSupport.Mvc
{
    // 注意: 有关启用 IIS6 或 IIS7 经典模式的说明，
    // 请访问 http://go.microsoft.com/?LinkId=9394801

    public abstract class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            MvcHandler.DisableMvcResponseHeader = true;

            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);


            IocRegisterRun.Current.Register();
            DependencyResolver.SetResolver(ServiceLocator.Current.Resolve<IDependencyResolver>());
            ModelBinders.Binders.Add(typeof(PagerRequest),ServiceLocator.Current.Resolve<PagerRequestBinder>());
        }
    }

    public class Mobile4MvcApplication : MvcApplication
    {
        
    }
}
