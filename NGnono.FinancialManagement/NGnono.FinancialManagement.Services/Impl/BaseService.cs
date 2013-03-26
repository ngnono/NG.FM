using NGnono.Framework.Logger;

namespace NGnono.FinancialManagement.Services.Impl
{
    public abstract class BaseService
    {
        public static ILog Logger;
        //BaseService
        protected BaseService()
        {
        }

        static BaseService()
        {
            Logger = LoggerManager.Current();
        }
    }
}