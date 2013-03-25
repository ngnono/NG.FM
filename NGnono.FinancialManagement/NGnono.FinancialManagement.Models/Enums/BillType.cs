using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NGnono.FinancialManagement.Models.Enums
{
    public enum BillType
    {
        //单数为负  双为正
        None = 0,

        /// <summary>
        /// 支出
        /// </summary>
        Expenses = 1,

        /// <summary>
        /// 收入
        /// </summary>
        Revenue = 2,
    }
}
