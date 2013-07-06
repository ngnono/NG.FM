using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.Framework.Data.EF;

namespace NGnono.FinancialManagement.Repository.Impl
{
    public class VUserRoleRepository : EFRepository<VUserRoleEntity, string>, IVUserRoleRepository
    {
        protected VUserRoleRepository(DbContext context) : base(context)
        {
        }

        public List<VUserRoleEntity> GetList(int userid)
        {
            return base.Get(v => v.User_Id == userid).ToList();
        }

        public List<VUserRoleEntity> GetList(List<int> userids)
        {
            return base.Get(v => userids.Any(s => s == v.User_Id)).ToList();
        }

        public VUserRoleEntity GetItem(int key)
        {
            throw new NotImplementedException();
        }
    }
}