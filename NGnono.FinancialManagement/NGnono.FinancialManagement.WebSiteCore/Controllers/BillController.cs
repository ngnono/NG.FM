using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.Models.Enums;
using NGnono.FinancialManagement.Models.Filters;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.FinancialManagement.WebSiteCore.Manager;
using NGnono.FinancialManagement.WebSiteCore.Models.Dto.Bill;
using NGnono.FinancialManagement.WebSiteCore.Models.Vo;
using NGnono.FinancialManagement.WebSiteCore.Utils;
using NGnono.FinancialManagement.WebSupport.Binder;
using NGnono.FinancialManagement.WebSupport.Mvc.Controllers;
using NGnono.FinancialManagement.WebSupport.Mvc.Filters;
using NGnono.Framework.Mapping;
using NGnono.Framework.Models;

namespace NGnono.FinancialManagement.WebSiteCore.Controllers
{
    //http://www.gbin1.com/technology/jqueryplugins/20111228jquerymobileplugins/
    //http://demo.mobiscroll.com/datetime/date
    //http://demo.mobiscroll.com/list/treelist#mode=scroller&display=inline&theme=jqm
    public class BillController : UserController
    {
        private readonly IBillRepository _repository;
        private readonly MapperManager _mapperManager = MapperManager.CurrentInstance;
        private readonly ITagRepository _tagRepository;
        private readonly ICustomerRepository _customerRepository;

        public BillController(ICustomerRepository customerRepository, IBillRepository repository, ITagRepository tagRepository)
        {
            _repository = repository;
            _tagRepository = tagRepository;
            _customerRepository = customerRepository;
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
            dto.Date = DateTime.Now;
            dto.Month = month.ToString(CultureInfo.InvariantCulture);
            dto.MonthRange = DateTimeUtil.FirstDayOfMonth(DateTime.Now).ToString("M月d日") + " - " +
                             DateTimeUtil.LastDayOfMonth(DateTime.Now).ToString("M月d日");

            dto.Taday = DateTime.Now.ToString("yyyy年M月d日");
            dto.WeekRange = DateTimeUtil.FirstDayOfWeek(DateTime.Now).ToString("M月d日") + " - " +
                            DateTimeUtil.LastDayOfWeek(DateTime.Now).ToString("M月d日");

            var t = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);

            int? customerId = base.CurrentUser == null ? new int?() : base.CurrentUser.CustomerId;
            var r1 = _repository.GetResult(new BillFilter
                {
                    DataDateRange = new DateTimeRangeInfo
                        {
                            StartDateTime = t,
                            EndDateTime = t.AddDays(1)
                        },
                    DataStatus = DataStatus.Normal,
                    IsDeleted = false,
                    UserId = customerId
                });

            dto.ThisToday = new IaeVo()
                {
                    Expenses = r1.Where(v => v.Type == (int)BillType.Expenses).Sum(v => (decimal?)v.Amount) ?? 0,
                    Revenue = r1.Where(v => v.Type == (int)BillType.Revenue).Sum(v => (decimal?)v.Amount) ?? 0
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
                UserId = customerId
            });

            dto.ThisMonth = new IaeVo()
                {
                    Expenses = r2.Where(v => v.Type == (int)BillType.Expenses).Sum(v => (decimal?)v.Amount) ?? 0,
                    Revenue = r2.Where(v => v.Type == (int)BillType.Revenue).Sum(v => (decimal?)v.Amount) ?? 0
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
                UserId = customerId
            });

            dto.ThisWeek = new IaeVo()
            {
                Expenses = r3.Where(v => v.Type == (int)BillType.Expenses).Sum(v => (decimal?)v.Amount) ?? 0,
                Revenue = r3.Where(v => v.Type == (int)BillType.Revenue).Sum(v => (decimal?)v.Amount) ?? 0
            };

            var r4 = _repository.GetResult(new BillFilter
            {
                DataStatus = DataStatus.Normal,
                IsDeleted = false,
                UserId = customerId
            });

            dto.Whole = new IaeVo()
            {
                Expenses = r4.Where(v => v.Type == (int)BillType.Expenses).Sum(v => (decimal?)v.Amount) ?? 0,
                Revenue = r4.Where(v => v.Type == (int)BillType.Revenue).Sum(v => (decimal?)v.Amount) ?? 0
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
        [LoginAuthorize]
        public ActionResult Create()
        {
            var tagList = _tagRepository.Get(v => v.Status.Equals((int)DataStatus.Normal) && v.CreatedUser == CurrentUser.CustomerId).ToList();
            var dto = new CreateDto { Tags = tagList };

            return View(dto);
        }

        [HttpPost]
        [LoginAuthorize]
        public ActionResult Create(FormCollection formCollection, BillCreateViewModel vo)
        {
            var tagList = _tagRepository.Get(v => v.Status.Equals((int)DataStatus.Normal) && v.CreatedUser == CurrentUser.CustomerId).ToList();

            if (!this.ModelState.IsValid)
            {
                // 如果我们进行到这一步时某个地方出错，则重新显示表单
                var dto = new CreateDto { Tags = tagList };
                dto.Vo = vo;
                return View(dto);
            }

            var newEntity = _mapperManager.BillMapper(vo);
            newEntity.CreatedDate = DateTime.Now;
            newEntity.CreatedUser = base.CurrentUser.CustomerId;
            newEntity.UpdatedDate = DateTime.Now;
            newEntity.UpdatedUser = base.CurrentUser.CustomerId;
            newEntity.Status = (int)DataStatus.Normal;
            newEntity.ExtendedContent = String.Empty;
            newEntity.User_Id = vo.User_Id;
            newEntity.User = _customerRepository.GetItem(base.CurrentUser.CustomerId);

            var entity = this._repository.Insert(newEntity);

            return View("success", new SuccessViewModel
                {
                    Title = "记账成功",
                    BackName = "返回记账首页",
                    BackUrl = Url.Action("Index", "Bill"),
                    MessageTitle = "记账成功"
                });
        }

        /// <summary>
        /// 详情页，可修改
        /// </summary>
        /// <returns></returns>
        [LoginAuthorize]
        [ModelOwnerCheck(TakeParameterName = "model", CustomerPropertyName = "User_Id")]
        public ActionResult Update([FetchBill(KeyName = "billid")]BillEntity model)
        {
            var dto = new DetailDto();
            dto.Bill = model;
            dto.Tags = _tagRepository.Get(v => v.Status.Equals((int)DataStatus.Normal) && v.CreatedUser == CurrentUser.CustomerId).ToList();

            return View(dto);
        }

        /// <summary>
        /// 详情页，可修改
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [ModelOwnerCheck(TakeParameterName = "model", CustomerPropertyName = "User_Id")]
        public ActionResult Update(FormCollection formCollection, [FetchBill(KeyName = "billid")]BillEntity model, BillUpdateViewModel billUpdateViewModel)
        {
            if (!ModelState.IsValid)
            {
                var dto = new DetailDto();
                model.Amount = billUpdateViewModel.Amount;
                model.DataDateTime = billUpdateViewModel.DataDateTime;
                model.Tag_Id = billUpdateViewModel.Tag_Id;
                model.Tag = _tagRepository.GetItem(billUpdateViewModel.Tag_Id);
                model.Type = billUpdateViewModel.Type;
                model.Description = billUpdateViewModel.Description;
                dto.Bill = model;


                dto.Tags = _tagRepository.Get(v => v.Status.Equals((int)DataStatus.Normal) && v.CreatedUser == CurrentUser.CustomerId).ToList();

                // 如果我们进行到这一步时某个地方出错，则重新显示表单
                return View(dto);
            }

            model = Mapper.Map(billUpdateViewModel, model);

            model.UpdatedDate = DateTime.Now;
            model.UpdatedUser = base.CurrentUser.CustomerId;
            model.User = _customerRepository.GetItem(base.CurrentUser.CustomerId);

            this._repository.Update(model);

            var dto2 = new DetailDto
            {
                Bill = model,
                Tags = _tagRepository.Get(v => v.Status.Equals((int)DataStatus.Normal) && v.CreatedUser == CurrentUser.CustomerId).ToList()
            };

            return View("Update", dto2);
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
        [LoginAuthorize]
        public ActionResult RunningAccount(int dateType, DateTime currentDate)
        {
            var dt = (DateType)dateType;

            var today = new DateTime(currentDate.Year, currentDate.Month, currentDate.Day);
            DateTime startDate;
            DateTime endDate;

            switch (dt)
            {
                case DateType.Year:
                    startDate = new DateTime(today.Year, 1, 1);
                    endDate = startDate.AddYears(1);
                    break;
                case DateType.Week:
                    startDate = DateTimeUtil.FirstDayOfWeek(today);
                    endDate = DateTimeUtil.LastDayOfWeek(today).AddDays(1);
                    break;
                case DateType.Month:
                    startDate = new DateTime(today.Year, today.Month, 1);
                    endDate = startDate.AddMonths(1);
                    break;
                default:
                    startDate = new DateTime(today.Year, today.Month, today.Day);
                    endDate = startDate.AddDays(1);
                    break;
            }


            var resultEntities = _repository.Get(v => v.Status.Equals((int)DataStatus.Normal) &&
                                      v.User_Id.Equals(CurrentUser.CustomerId) &&
                                      v.DataDateTime >= startDate && v.DataDateTime < endDate);

            var sumiae =
                new IaeVo
                {
                    Expenses = resultEntities.Where(v => v.Type.Equals((int)BillType.Expenses)).Sum(v => (decimal?)v.Amount) ?? 0,
                    Revenue = resultEntities.Where(v => v.Type.Equals((int)BillType.Revenue)).Sum(v => (decimal?)v.Amount) ?? 0
                }
                ;

            Dictionary<int, IaeVo> d;

            switch (dt)
            {
                case DateType.Year:
                    d = YearData(today, resultEntities);
                    break;
                case DateType.Week:
                    d = WeekData(today, resultEntities);
                    break;
                case DateType.Month:
                    d = MonthData(today, resultEntities);
                    break;
                default:
                    d = DayData(today, resultEntities);
                    break;
            }

            var dto = new RunningAccountDto { CurrentDate = today, DateType = dt, YearIae = sumiae, Data = d };

            return View(dto);
        }

        private Dictionary<int, IaeVo> YearData(DateTime dt, IQueryable<BillEntity> resultEntities)
        {
            var d = new Dictionary<int, IaeVo>(12);
            for (var i = 1; i <= 12; i++)
            {
                var t = new DateTime(dt.Year, i, 1);
                var e = t.AddMonths(1);
                var en = resultEntities.Where(v => v.DataDateTime >= t && v.DataDateTime < e);
                var iae = new IaeVo
                {
                    Expenses = en.Where(v => v.Type.Equals((int)BillType.Expenses)).Sum(v => (decimal?)v.Amount) ?? 0,
                    Revenue = en.Where(v => v.Type.Equals((int)BillType.Revenue)).Sum(v => (decimal?)v.Amount) ?? 0,
                    Date = t
                };
                d.Add(i, iae);
            }

            return d;
        }

        private Dictionary<int, IaeVo> MonthData(DateTime dt, IQueryable<BillEntity> resultEntities)
        {
            var s = DateTimeUtil.FirstDayOfMonth(dt);
            var e2 = DateTimeUtil.LastDayOfMonth(dt);
            var c = (int)((e2 - s).TotalDays) + 1;

            var d = new Dictionary<int, IaeVo>(c);

            for (var i = 0; i < c; i++)
            {
                var t = s.AddDays(i);
                var e = t.AddDays(1);
                var en = resultEntities.Where(v => v.DataDateTime >= t && v.DataDateTime < e);
                var iae = new IaeVo
                {
                    Expenses = en.Where(v => v.Type.Equals((int)BillType.Expenses)).Sum(v => (decimal?)v.Amount) ?? 0,
                    Revenue = en.Where(v => v.Type.Equals((int)BillType.Revenue)).Sum(v => (decimal?)v.Amount) ?? 0,
                    Date = t
                };
                d.Add(i + 1, iae);
            }

            return d;
        }

        private Dictionary<int, IaeVo> DayData(DateTime dt, IQueryable<BillEntity> resultEntities)
        {
            var d = new Dictionary<int, IaeVo>(1);


            var t = new DateTime(dt.Year, dt.Month, dt.Day);
            var e = t.AddDays(1);
            var en = resultEntities.Where(v => v.DataDateTime >= t && v.DataDateTime < e);
            var iae = new IaeVo
            {
                Expenses = en.Where(v => v.Type.Equals((int)BillType.Expenses)).Sum(v => (decimal?)v.Amount) ?? 0,
                Revenue = en.Where(v => v.Type.Equals((int)BillType.Revenue)).Sum(v => (decimal?)v.Amount) ?? 0,
                Date = t
            };

            d.Add(t.Day, iae);

            return d;
        }

        private Dictionary<int, IaeVo> WeekData(DateTime dt, IQueryable<BillEntity> resultEntities)
        {
            var s = DateTimeUtil.FirstDayOfWeek(dt);
            var e2 = DateTimeUtil.LastDayOfWeek(dt);
            var c = (int)((e2 - s).TotalDays) + 1;

            var d = new Dictionary<int, IaeVo>(c);

            for (var i = 0; i < c; i++)
            {
                var t = s.AddDays(i);
                var e = t.AddDays(1);
                var en = resultEntities.Where(v => v.DataDateTime >= t && v.DataDateTime < e);
                var iae = new IaeVo
                {
                    Expenses = en.Where(v => v.Type.Equals((int)BillType.Expenses)).Sum(v => (decimal?)v.Amount) ?? 0,
                    Revenue = en.Where(v => v.Type.Equals((int)BillType.Revenue)).Sum(v => (decimal?)v.Amount) ?? 0,
                    Date = t
                };
                d.Add(i + 1, iae);
            }

            return d;
        }

        [LoginAuthorize]
        public ActionResult AccountDate(DateTime dt)
        {
            var b = new DateTime(dt.Year, dt.Month, dt.Day);
            var e = b.AddDays(1);
            var resultEntities = _repository.Get(v => v.Status.Equals(DataStatus.Normal) &&
                                      v.User_Id.Equals(CurrentUser.CustomerId) &&
                                      v.DataDateTime >= b && v.DataDateTime < e);

            var sumiae =
    new IaeVo
    {
        Expenses = resultEntities.Where(v => v.Type.Equals((int)BillType.Expenses)).Sum(v => (decimal?)v.Amount) ?? 0,
        Revenue = resultEntities.Where(v => v.Type.Equals((int)BillType.Revenue)).Sum(v => (decimal?)v.Amount) ?? 0
    }
    ;


            var dto = new AccountDateDto { Summ = sumiae, CurrentDate = b, Data = resultEntities.ToList() };

            return View(dto);
        }
    }
}
