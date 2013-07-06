using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.Framework.Data.EF;

namespace NGnono.FinancialManagement.Repository.Impl
{
    public class UserRepository : EFRepository<UserEntity, int>, IUserRepository
    {
        protected UserRepository(DbContext context) : base(context)
        {
        }

        public override UserEntity GetItem(int key)
        {
            return base.Find(key);
        }

        public UserEntity GetItem(string username, string password)
        {
            throw new NotImplementedException();
        }
    }
}
