﻿using System;
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

        public BillController(IBillRepository repository, ITagRepository tagRepository)
        {
            _repository = repository;
            _tagRepository = tagRepository;
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
                UserId = customerId
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
                UserId = customerId
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
                UserId = customerId
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

            var entity = this._repository.Insert(newEntity);
            var dto2 = new DetailDto()
                {
                    Bill = entity,
                    Tags = tagList
                };
            return View("Details", dto2);
        }

        /// <summary>
        /// 详情页，可修改
        /// </summary>
        /// <returns></returns>
        [LoginAuthorize]
        [ModelOwnerCheck(TakeParameterName = "model", CustomerPropertyName = "User_Id")]
        public ActionResult Details([FetchBill(KeyName = "billid")]BillEntity model)
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
        public ActionResult Update([FetchBill(KeyName = "billid")]BillEntity model, BillUpdateViewModel vo)
        {
            if (!ModelState.IsValid)
            {
                var dto = new DetailDto();
                model.Amount = vo.Amount;
                model.DataDateTime = vo.DataDateTime;
                model.Tag_Id = vo.Tag_Id;
                model.Tag = _tagRepository.GetItem(vo.Tag_Id);
                model.Type = vo.Type;
                model.Description = vo.Description;
                dto.Bill = model;

                dto.Tags = _tagRepository.Get(v => v.Status.Equals((int)DataStatus.Normal) && v.CreatedUser == CurrentUser.CustomerId).ToList();

                // 如果我们进行到这一步时某个地方出错，则重新显示表单
                return View("Details", dto);
            }

            model = Mapper.Map(vo, model);
            model.UpdatedDate = DateTime.Now;
            model.UpdatedUser = base.CurrentUser.CustomerId;

            this._repository.Update(model);

            var dto2 = new DetailDto
            {
                Bill = model,
                Tags = _tagRepository.Get(v => v.Status.Equals((int)DataStatus.Normal) && v.CreatedUser == CurrentUser.CustomerId).ToList()
            };

            return View("Details", dto2);
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
        public ActionResult RunningAccount()
        {
            var today = DateTime.Now;
            var yearStartDate = new DateTime(today.Year, 1, 1);
            var yearEndDate = new DateTime(today.Year + 1, 1, 1);

            var resultEntities = _repository.Get(v => v.Status.Equals(DataStatus.Normal) &&
                                      v.User_Id.Equals(CurrentUser.CustomerId) &&
                                      v.DataDateTime >= yearStartDate && v.DataDateTime < yearEndDate);

            var yearIae =
                new IaeVo
                {
                    Expenses = resultEntities.Where(v => v.Type.Equals((int)BillType.Expenses)).Sum(v => v.Amount),
                    Revenue = resultEntities.Where(v => v.Type.Equals((int)BillType.Revenue)).Sum(v => v.Amount)
                }
                ;


            var d = new Dictionary<int, IaeVo>(12);
            for (var i = 1; i <= 12; i++)
            {
                var t = new DateTime(today.Year, i, 1);
                var e = t.AddMonths(1);
                var en = resultEntities.Where(v => v.DataDateTime >= t && v.DataDateTime < e);
                var iae = new IaeVo
                {
                    Expenses = en.Where(v => v.Type.Equals((int)BillType.Expenses)).Sum(v => v.Amount),
                    Revenue = en.Where(v => v.Type.Equals((int)BillType.Revenue)).Sum(v => v.Amount)
                };
                d.Add(i, iae);
            }

            var dto = new RunningAccountDto();
            dto.Year = today.Year;
            dto.YearIae = yearIae;
            dto.Data = d;

            return View(dto);
        }

        public ActionResult AccountDateList(int year, int month)
        {
            var monthStartDate = new DateTime(year, month, 1);
            var monthEndDate = monthStartDate.AddMonths(1);

            var resultEntities = _repository.Get(v => v.Status.Equals(DataStatus.Normal) &&
                                      v.User_Id.Equals(CurrentUser.CustomerId) &&
                                      v.DataDateTime >= monthStartDate && v.DataDateTime < monthEndDate).GroupBy(v => v.DataDateTime.Day).OrderByDescending(v => v.Key);

            var dto = new AccountDateListDto();
            dto.Month = month;
            dto.Year = year;
            dto.Data = null;
            //TODO:这里的分组没做完

            return View(dto);
        }
    }
}
