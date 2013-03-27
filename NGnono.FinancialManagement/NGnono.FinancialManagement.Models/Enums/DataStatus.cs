using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NGnono.FinancialManagement.Models.Enums
{
    public enum DataStatus
    {
        /// <summary>
        /// 默认
        /// </summary>
        Default = 0,

        /// <summary>
        /// 正常状态
        /// </summary>
        Normal = 1,

        /// <summary>
        /// 待审核
        /// </summary>
        PendingReview = 2,

        /// <summary>
        /// 软删除
        /// </summary>
        Deleted = -1
    }
}
