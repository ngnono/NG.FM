using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NGnono.FinancialManagement.Data.Models;

namespace NGnono.FinancialManagement.Repository.Contract
{
    public interface IUserRepository : IRepository<UserEntity, int>
    {
    }
}
