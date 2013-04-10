using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.WebSiteCore.Models.Vo;

namespace NGnono.FinancialManagement.WebSiteCore.Models.Dto.Bill
{
    public class IndexDto
    {
        public DateTime Date { get; set; }

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

        /// <summary>
        /// 结余（收入-支出）
        /// </summary>
        public decimal Balance
        {
            get { return Revenue - Expenses; }
            set { }
        }
    }

    public class CreateDto
    {
        public List<TagEntity> Tags { get; set; }

        public BillCreateViewModel Vo { get; set; }
    }

    public class RunningAccountDto
    {
        /// <summary>
        /// 年
        /// </summary>
        public int Year { get; set; }

        /// <summary>
        /// 年 总收入和支出
        /// </summary>
        public IaeVo YearIae { get; set; }

        public Dictionary<int, IaeVo> Data { get; set; }
    }

    public class AccountDateListDto
    {
        public int Year { get; set; }

        public int Month { get; set; }

        public Dictionary<int, List<BillViewModel>> Data { get; set; }
    }

    public class DetailDto
    {
        public BillEntity Bill { get; set; }

        public List<TagEntity> Tags { get; set; }
    }
}
