using NGnono.FinancialManagement.Services.Contract;
using NGnono.FinancialManagement.Services.Impl;
using NGnono.FinancialManagement.Services.Manager;
using NGnono.FinancialManagement.WebSupport.Auth;

namespace NGnono.FinancialManagement.WebSupport.Ioc
{
    internal class ServiceIocRegister : BaseIocRegister
    {
        #region Implementation of IIocRegister

        public override void Register()
        {
            //service
            Current.Register<IAuthenticationService, AuthenticationService>();
            Current.Register<IUserService, UserService>();
            Current.Register<MappingManagerV2, MappingManagerV2>();
        }

        #endregion
    }
}