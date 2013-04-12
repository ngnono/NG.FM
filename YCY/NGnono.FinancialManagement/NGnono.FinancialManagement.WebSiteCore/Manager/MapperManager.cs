using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.WebSiteCore.Models.Vo;
using NGnono.Framework.Mapping;

namespace NGnono.FinancialManagement.WebSiteCore.Manager
{
    public sealed class MapperManager
    {
        private static MapperManager _instance;

        private static readonly object _syncObj = new object();

        static MapperManager()
        {

        }

        private MapperManager()
        {
        }

        public static MapperManager CurrentInstance
        {
            get
            {
                if (_instance == null)
                {
                    lock (_syncObj)
                    {
                        if (_instance == null)
                        {
                            _instance = new MapperManager();
                        }
                    }
                }

                return _instance;
            }
        }

        #region user

        #endregion

        #region product

        public ProductEntity ProductMapper(CreatedProductViewModel source)
        {
            if (source == null)
            {
                return null;
            }

            var target = Mapper.Map<CreatedProductViewModel, ProductEntity>(source);

            return target;
        }

        public ProductViewModel ProductMapper(ProductEntity source)
        {
            if (source == null)
            {
                return null;
            }

            var target = Mapper.Map<ProductEntity, ProductViewModel>(source);

            return target;
        }

        #endregion


        #region bill

        public BillEntity BillMapper(BillViewModel source)
        {
            if (source == null)
            {
                return null;
            }

            var target = Mapper.Map<BillViewModel, BillEntity>(source);
           



            return target;
        }

        public BillViewModel BillMapper(BillEntity source)
        {
            if (source == null)
            {
                return null;
            }

            var target = Mapper.Map<BillEntity, BillViewModel>(source);

            return target;
        }

        #endregion
    }
}
