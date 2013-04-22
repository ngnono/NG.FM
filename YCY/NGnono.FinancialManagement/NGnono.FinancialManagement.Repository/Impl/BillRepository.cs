using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using NGnono.FinancialManagement.Data.Models;
using NGnono.FinancialManagement.Models.Enums;
using NGnono.FinancialManagement.Models.Filters;
using NGnono.FinancialManagement.Repository.Contract;
using NGnono.Framework.Data.EF;
using NGnono.Framework.Models;

namespace NGnono.FinancialManagement.Repository.Impl
{
    public class BillRepository : RepositoryBase<BillEntity, int>, IBillRepository
    {
        #region methods

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sort"></param>
        /// <returns></returns>
        private static Func<IQueryable<BillEntity>, IOrderedQueryable<BillEntity>> GetOrder(BillSortOrder sort)
        {
            Func<IQueryable<BillEntity>, IOrderedQueryable<BillEntity>> order;
            switch (sort)
            {
                case BillSortOrder.CreatedDateDesc:
                    order = v => v.OrderByDescending(s => s.CreatedDate);
                    break;
                case BillSortOrder.DataDateDesc:
                    order = v => v.OrderByDescending(s => s.DataDateTime);
                    break;
                case BillSortOrder.Default:
                default:
                    order = v => v.OrderByDescending(s => s.DataDateTime);
                    break;
            }

            return order;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="billFilter"></param>
        /// <returns></returns>
        private static Expression<Func<BillEntity, bool>> Filter(BillFilter billFilter)
        {
            var filter = PredicateBuilder.True<BillEntity>();

            if (billFilter.DataStatus != null)
            {
                filter = filter.And(v => v.Status == (int)billFilter.DataStatus);
            }

            if (billFilter.Timestamp != null)
            {
                switch (billFilter.Timestamp.TsType)
                {
                    case TimestampType.New:
                        filter = filter.And(v => v.UpdatedDate > billFilter.Timestamp.Ts);
                        break;
                    case TimestampType.Old:
                    default:
                        filter = filter.And(v => v.UpdatedDate <= billFilter.Timestamp.Ts);
                        break;
                }
            }

            if (billFilter.IsDeleted != null)
            {
                filter = filter.And(v => v.IsDeleted == billFilter.IsDeleted.Value);
            }

            if (billFilter.UserId != null)
            {
                filter = filter.And(v => v.User_Id == billFilter.UserId);
            }

            if (billFilter.DataDateRange != null)
            {
                if (billFilter.DataDateRange.StartDateTime != null)
                {
                    filter = filter.And(v => v.DataDateTime >= billFilter.DataDateRange.StartDateTime);
                }

                if (billFilter.DataDateRange.EndDateTime != null)
                {
                    filter = filter.And(v => v.DataDateTime < billFilter.DataDateRange.EndDateTime);
                }
            }

            return filter;
        }

        #endregion

        public IEnumerable<BillEntity> GetResult(BillFilter filter)
        {
            return base.Get(Filter(filter));
        }

        public IEnumerable<BillEntity> GetPagedList(PagerRequest pagerRequest, out int totalCount, BillFilter filter, BillSortOrder sortOrder)
        {
            return base.Get(Filter(filter), out totalCount, pagerRequest.PageIndex, pagerRequest.PageSize, GetOrder(sortOrder));
        }
    }
}
