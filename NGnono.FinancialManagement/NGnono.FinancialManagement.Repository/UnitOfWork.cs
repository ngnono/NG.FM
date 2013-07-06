using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.FinancialManagement.Repository.Impl;
using NGnono.Framework.Data.EF;

namespace NGnono.FinancialManagement.Repository
{
    public sealed partial class UnitOfWork : EfUnitOfWork
    {
        public UnitOfWork(DbContext context)
            : base(context)
        {
        }

        private IBillRepository _billRepository;

        public IBillRepository BillRepository
        {
            get { return _billRepository ?? new BillRepository(Context); }
        }

        private IBrandRepository _brandRepository;

        public IBrandRepository BrandRepository
        {
            get { return _brandRepository ?? new BrandRepository(Context); }
        }

        private ICustomerRepository _customerRepository;

        public ICustomerRepository CustomerRepository
        {
            get { return _customerRepository ?? new CustomerRepository(Context); }
        }

        private IProductRepository _productRepository;

        public IProductRepository ProductRepository
        {
            get { return _productRepository ?? new ProductRepository(Context); }
        }


    }
}
