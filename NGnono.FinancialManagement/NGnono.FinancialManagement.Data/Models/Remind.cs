using System;
using System.Collections.Generic;

namespace NGnono.FinancialManagement.Data.Models
{
    public partial class RemindEntity : NGnono.Framework.Models.BaseEntity
    {
        public int Id { get; set; }
        public int User_Id { get; set; }
        public int RemindUser { get; set; }
        public int Type { get; set; }
        public int SourceId { get; set; }
        public bool IsRemind { get; set; }
        public int Stauts { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int CreatedUser { get; set; }
        public System.DateTime UpdatedDate { get; set; }
        public int UpdatedUser { get; set; }

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
