using System;
using System.Collections.Generic;

namespace NGnono.FinancialManagement.Data.Models
{
    public partial class UserRoleEntity : NGnono.Framework.Models.BaseEntity
    {
        public int Id { get; set; }
        public int Role_Id { get; set; }
        public int User_Id { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int CreatedUser { get; set; }
        public int Status { get; set; }
        public virtual RoleEntity Role { get; set; }
        public virtual UserEntity User { get; set; }

#region Overrides of BaseEntity

        /// <summary>
        /// KeyMemberId
        /// </summary>
        public override object EntityId
        {       
                get { return Id; }
 
        }

        #endregion

    }
}
