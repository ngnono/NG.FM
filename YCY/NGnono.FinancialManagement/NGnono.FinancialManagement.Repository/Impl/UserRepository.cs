using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.Repository.Contract;

namespace NGnono.FinancialManagement.Repository.Impl
{
    public class UserRepository : RepositoryBase<UserEntity, int>, IUserRepository
    {
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
