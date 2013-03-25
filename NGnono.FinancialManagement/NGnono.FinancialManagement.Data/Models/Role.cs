using System;
using System.Collections.Generic;

namespace NGnono.FinancialManagement.Data.Models
{
    public partial class RoleEntity : NGnono.Framework.Models.BaseEntity
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int CreatedUser { get; set; }
        public int Status { get; set; }
        public int Val { get; set; }

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
