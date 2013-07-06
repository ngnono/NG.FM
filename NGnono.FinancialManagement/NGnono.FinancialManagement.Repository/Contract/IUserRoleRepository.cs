using System.Collections.Generic;
using NGnono.FinancialManagement.Data.Models;
using NGnono.Framework.Data.EF;

namespace NGnono.FinancialManagement.Repository.Contract
{
    public interface IUserRoleRepository : IEFRepository<UserRoleEntity, int>
    {
        List<UserRoleEntity> GetListByRoleId(int roleId);

        List<UserRoleEntity> GetListByUserId(int userId);

        IEnumerable<RoleEntity> FindRolesByUserId(int p);
    }
}