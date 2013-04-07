using System.Web.Mvc;
using NGnono.FinancialManagement.WebSupport.Mvc.Controllers;

namespace NGnono.FinancialManagement.WebSiteCore.Controllers
{
    /// <summary>
    /// 统计
    /// </summary>
    public class StatisticsController : UserController
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