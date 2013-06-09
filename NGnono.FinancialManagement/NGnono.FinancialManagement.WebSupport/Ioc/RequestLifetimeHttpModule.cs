using System.Web;
using NGnono.Framework.ServiceLocation.Adapter;

namespace NGnono.FinancialManagement.WebSupport.Ioc
{
    internal class RequestLifetimeHttpModule : IHttpModule
    {
        public void Init(HttpApplication context)
        {
            context.EndRequest += (sender, e) => PerRequestUnityServiceLocator.DisposeOfHttpChildContainer();
        }

        public void Dispose()
        {
            // nothing to do here
        }        
    }
}