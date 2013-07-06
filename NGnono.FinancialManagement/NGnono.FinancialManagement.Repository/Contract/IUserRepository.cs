using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NGnono.FinancialManagement.Data.Models;
using NGnono.Framework.Data;
using NGnono.Framework.Data.EF;

namespace NGnono.FinancialManagement.Repository.Contract
{
    public interface IUserRepository : IEFRepository<UserEntity, int>
    {
        UserEntity GetItem(string username, string password);
    }
}
