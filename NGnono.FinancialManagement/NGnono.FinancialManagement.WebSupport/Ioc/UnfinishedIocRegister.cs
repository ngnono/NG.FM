using NGnono.FinancialManagement.WebSupport.Binder;

namespace NGnono.FinancialManagement.WebSupport.Ioc
{
    internal class UnfinishedIocRegister : BaseIocRegister
    {
        #region Overrides of BaseIocRegister

        public override void Register()
        {
            Current.RegisterSingleton<PagerRequestBinder, PagerRequestBinder>();
        }

        #endregion
    }
}
