using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.Models.Enums;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.Framework.Data.EF;

namespace NGnono.FinancialManagement.Repository.Impl
{
    public class UserRoleRepository : EFRepository<UserRoleEntity, int>, IUserRoleRepository
    {
        protected UserRoleRepository(DbContext context) : base(context)
        {
        }

        public override UserRoleEntity GetItem(int key)
        {
            return base.Find(key);
        }

        public List<UserRoleEntity> GetListByRoleId(int roleId)
        {
            return base.Get(v => v.Role_Id == roleId && v.Status == (int)DataStatus.Normal).ToList();
        }

        public List<UserRoleEntity> GetListByUserId(int userId)
        {
            return base.Get(v => v.User_Id == userId && v.Status == (int)DataStatus.Normal).ToList();
        }

        public IEnumerable<RoleEntity> FindRolesByUserId(int p)
        {
            var result = from ru in DbContext.Set<UserRoleEntity>()
                         where ru.User_Id == p
                         from r in DbContext.Set<RoleEntity>()
                         where ru.Role_Id == r.Id
                         select r;
            return result;
        }
    }
}