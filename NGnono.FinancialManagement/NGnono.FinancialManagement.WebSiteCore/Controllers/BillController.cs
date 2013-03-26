using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using NGnono.FinancialManagement.Models.Enums;
using NGnono.FinancialManagement.Models.Filters;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.FinancialManagement.WebSiteCore.Models.Dto.Bill;
using NGnono.FinancialManagement.WebSiteCore.Utils;
using NGnono.FinancialManagement.WebSupport.Mvc.Controllers;
using NGnono.Framework.Models;

namespace NGnono.FinancialManagement.WebSiteCore.Controllers
{
    public class BillController : UserController
    {
        private IBillRepository _repository;

        public BillController(IBillRepository repository)
        {
            _repository = repository;
        }


        /// <summary>
        ///  区域1
        ///     1.当前月
        ///     2.收入总额： ￥0.00
        ///     3.支出总额： ￥0.00
        ///     4.预算总额： ￥0.00
        ///   区域2
        ///         记录
        ///      1.今天（日期）   收入和支出
        ///      2.本周（日期-日期） 收入和支出
        ///      3.本月（日期-日期） 收入和支出
        ///      4.本年
        ///  
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            //
            var month = DateTime.Now.Month;

            var dto = new Models.Dto.Bill.IndexDto();
            dto.Month = month.ToString(CultureInfo.InvariantCulture);
            dto.MonthRange = DateTimeUtil.FirstDayOfMonth(DateTime.Now).ToString("M月d日") + " - " +
                             DateTimeUtil.LastDayOfMonth(DateTime.Now).ToString("M月d日");

            dto.Taday = DateTime.Now.ToString("yyyy年M月d日");
            dto.WeekRange = DateTimeUtil.FirstDayOfWeek(DateTime.Now).ToString("M月d日") + " - " +
                            DateTimeUtil.LastDayOfWeek(DateTime.Now);

            var t = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
            var r1 = _repository.GetResult(new BillFilter
                {
                    DataDateRange = new DateTimeRangeInfo
                        {
                            StartDateTime = t,
                            EndDateTime = t.AddDays(1)
                        },
                    DataStatus = DataStatus.Normal,
                    IsDeleted = false,
                    UserId = base.CurrentUser.CustomerId
                });

            dto.ThisToday = new IaeVo()
                {
                    Expenses = r1.Where(v => v.Type == (int)BillType.Expenses).Sum(v => v.Amount),
                    Revenue = r1.Where(v => v.Type == (int)BillType.Revenue).Sum(v => v.Amount)
                };

            var r2 = _repository.GetResult(new BillFilter
            {
                DataDateRange = new DateTimeRangeInfo
                {
                    StartDateTime = DateTimeUtil.FirstDayOfMonth(t),
                    EndDateTime = DateTimeUtil.LastDayOfMonth(t).AddDays(1)
                },
                DataStatus = DataStatus.Normal,
                IsDeleted = false,
                UserId = base.CurrentUser.CustomerId
            });

            dto.ThisMonth = new IaeVo()
                {
                    Expenses = r2.Where(v => v.Type == (int)BillType.Expenses).Sum(v => v.Amount),
                    Revenue = r2.Where(v => v.Type == (int)BillType.Revenue).Sum(v => v.Amount)
                };

            var r3 = _repository.GetResult(new BillFilter
            {
                DataDateRange = new DateTimeRangeInfo
                {
                    StartDateTime = DateTimeUtil.FirstDayOfWeek(t),
                    EndDateTime = DateTimeUtil.LastDayOfWeek(t).AddDays(1)
                },
                DataStatus = DataStatus.Normal,
                IsDeleted = false,
                UserId = base.CurrentUser.CustomerId
            });

            dto.ThisWeek = new IaeVo()
            {
                Expenses = r3.Where(v => v.Type == (int)BillType.Expenses).Sum(v => v.Amount),
                Revenue = r3.Where(v => v.Type == (int)BillType.Revenue).Sum(v => v.Amount)
            };

            var r4 = _repository.GetResult(new BillFilter
            {
                DataStatus = DataStatus.Normal,
                IsDeleted = false,
                UserId = base.CurrentUser.CustomerId
            });

            dto.Whole = new IaeVo()
            {
                Expenses = r4.Where(v => v.Type == (int)BillType.Expenses).Sum(v => v.Amount),
                Revenue = r4.Where(v => v.Type == (int)BillType.Revenue).Sum(v => v.Amount)
            };

            return View(dto);
        }

        /// <summary>
        /// 记一笔
        /// 
        ///   区域1  支出-收入-转账-借贷-代付（报销）-退款
        ///         1.拍照
        ///         2. 金额 ￥0.00
        ///   类别 
        ///   账户 
        ///   成员（谁与该笔 有关）：
        ///   商家：
        ///   备注：
        /// </summary>
        /// <returns></returns>
        public ActionResult Create()
        {
            return View();
        }

        /// <summary>
        /// 详情页，可修改
        /// </summary>
        /// <returns></returns>
        public ActionResult Details()
        {
            return View();
        }

        /// <summary>
        /// 流水
        ///  
        ///  当前年 2013年流水
        ///  结余    ￥0.00
        /// （+）收入 ￥0.00   （-）支出 ￥0.00
        ///  按照每月罗列
        /// 3月  收入 支出 结余  【可展开，显示当月记录】
        /// 列出每天的记录，分类等，可以点击进入，修改
        /// 2月
        /// 1月
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult LiuShui()
        {
            return View();
        }

        /// <summary>
        /// 账户
        /// 
        /// 净资产： ￥0.00  负债
        /// 
        /// 各账户：
        /// 现金账户：点击进入-按每月罗列
        /// 金融账户
        /// 虚拟账户
        /// 信用卡账户：
        /// </summary>
        /// <returns></returns>
        public ActionResult Account()
        {
            return View();
        }

        public ActionResult AccountList()
        {
            return View();
        }

    }

    /// <summary>
    /// 统计
    /// </summary>
    public class TongjiController : Controller
    {
        /// <summary>
        /// 统计设置界面
        /// 1.支出报表  『分类支出、二级支出、账户支出、商家支出、项目支出、成员支出』
        /// 2.收入报表  『分类收入、二级收入、账户收入、项目收入、成员收入』
        /// 3.资产报表  『资产、负债』
        /// 4.月度报表  『收入、支出、收支对比、预算支出、成员收支』
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Details()
        {
            return View();
        }
    }
}
