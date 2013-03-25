using System.Web.Mvc;
using NGnono.Framework.Logger;
using NGnono.Framework.Web.Mvc.Ioc;

namespace NGnono.FinancialManagement.WebSupport.Ioc
{
    internal class ImportantSupportIocRegister : BaseIocRegister
    {
        #region Overrides of BaseIocRegister

        public override void Register()
        {
            Current.Register<IControllerActivator, CustomControllerActivator>();
            Current.Register<IDependencyResolver, IocDependencyResolver>();
            Current.RegisterSingleton<ILog, Log4NetLog>();
        }

        #endregion
    }
}