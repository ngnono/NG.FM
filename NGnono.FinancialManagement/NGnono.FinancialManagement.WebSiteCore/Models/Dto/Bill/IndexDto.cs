using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NGnono.FinancialManagement.WebSiteCore.Models.Dto.Bill
{
    public class IndexDto
    {
        /// <summary>
        /// 当前月
        /// </summary>
        public string Month { get; set; }

        /// <summary>
        /// 全部
        /// </summary>
        public IaeVo Whole { get; set; }

        /// <summary>
        /// 今天
        /// </summary>
        public IaeVo ThisToday { get; set; }

        /// <summary>
        /// 本周
        /// </summary>
        public IaeVo ThisWeek { get; set; }

        /// <summary>
        /// 本月
        /// </summary>
        public IaeVo ThisMonth { get; set; }


        public string Taday { get; set; }

        public string WeekRange { get; set; }

        public string MonthRange { get; set; }



    }


    public class IaeVo
    {
        /// <summary>
        /// 收入
        /// </summary>
        public decimal Revenue { get; set; }

        /// <summary>
        /// 支出
        /// </summary>
        public decimal Expenses { get; set; }
    }
}
