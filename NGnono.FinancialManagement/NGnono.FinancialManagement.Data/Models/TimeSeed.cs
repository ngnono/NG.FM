using System;
using System.Collections.Generic;

namespace NGnono.FinancialManagement.Data.Models
{
    public partial class TimeSeedEntity : NGnono.Framework.Models.BaseEntity
    {
        public int Id { get; set; }
        public int Year { get; set; }
        public int Month { get; set; }
        public int Day { get; set; }
        public int Hour { get; set; }
        public int Seed { get; set; }
        public string KeySeed { get; set; }
        public System.DateTime Date { get; set; }
        public System.DateTime CreatedDate { get; set; }

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
