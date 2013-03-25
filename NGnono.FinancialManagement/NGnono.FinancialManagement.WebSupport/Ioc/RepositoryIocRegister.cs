using NGnono.FinancialManagement.Repository.Contract;
using NGnono.FinancialManagement.Repository.Impl;

namespace NGnono.FinancialManagement.WebSupport.Ioc
{
    internal class RepositoryIocRegister : BaseIocRegister
    {
        #region Overrides of BaseIocRegister

        public override void Register()
        {
            Current.Register<IBillRepository, BillRepository>();
        }

        #endregion
    }
}