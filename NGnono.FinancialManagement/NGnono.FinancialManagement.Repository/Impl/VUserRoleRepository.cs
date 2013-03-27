using System;
using System.Collections.Generic;
using System.Linq;
using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.Repository.Contract;

namespace NGnono.FinancialManagement.Repository.Impl
{
    public class VUserRoleRepository : RepositoryBase<VUserRoleEntity, string>, IVUserRoleRepository
    {
        public override VUserRoleEntity GetItem(string key)
        {
            throw new NotImplementedException();
        }

        public List<VUserRoleEntity> GetList(int userid)
        {
            return base.Get(v => v.User_Id == userid).ToList();
        }

        public List<VUserRoleEntity> GetList(List<int> userids)
        {
            return base.Get(v => userids.Any(s => s == v.User_Id)).ToList();
        }
    }
}