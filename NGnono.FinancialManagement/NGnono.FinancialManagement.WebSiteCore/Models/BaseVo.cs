using System;
using System.Runtime.Serialization;
using NGnono.Framework.Models;

namespace NGnono.FinancialManagement.WebSiteCore.Models
{
    [Serializable]
    public abstract class BaseViewModel
    {
    }

    public interface IPagerInfo
    {
        /// <summary>
        /// 页码(从1起始)
        /// </summary>
        int Index { get; set; }

        /// <summary>
        /// 页大小
        /// </summary>
        int Size { get; }

        /// <summary>
        /// 总页数
        /// </summary>
        int TotalPaged { get; }

        /// <summary>
        /// 总记录数
        /// </summary>
        int TotalCount { get; }
    }

    [DataContract]
    public abstract class PagerInfoBaseViewModel : BaseViewModel, IPagerInfo
    {
        protected PagerInfoBaseViewModel(PagerRequest request)
            : this(request, 0)
        {
        }

        protected PagerInfoBaseViewModel(PagerRequest request, int totalCount)
        {
            this.Index = request.PageIndex;
            this.Size = request.PageSize;
            this.TotalCount = totalCount;
        }

        #region Implementation of IPagerInfoResponse

        /// <summary>
        /// 索引
        /// </summary>
        [DataMember(Name = "pageindex", Order = 1)]
        public int Index { get; set; }

        /// <summary>
        /// 大小
        /// </summary>
        [DataMember(Name = "pagesize", Order = 2)]
        public int Size { get; set; }

        /// <summary>
        /// 总数据量
        /// </summary>
        [DataMember(Name = "totalcount", Order = 3)]
        public int TotalCount { get; set; }

        /// <summary>
        /// 总页数
        /// </summary>
        [DataMember(Name = "totalpaged", Order = 4)]
        public int TotalPaged
        {
            get
            {
                return (int)Math.Ceiling(this.TotalCount / (double)this.Size);
            }
            set { }
        }

        /// <summary>
        /// 是否存在分页
        /// </summary>
        [DataMember(Name = "ispaged", Order = 5)]
        public bool IsPaged
        {
            get
            {
                return Size < TotalCount;
            }
            set { }
        }

        #endregion
    }

    [DataContract]
    public abstract class PagerInfoBaseViewModel<TData> : PagerInfoBaseViewModel
    {
        protected PagerInfoBaseViewModel(PagerRequest request)
            : base(request)
        {
        }

        protected PagerInfoBaseViewModel(PagerRequest request, int totalCount)
            : base(request, totalCount)
        {
        }

        protected PagerInfoBaseViewModel(PagerRequest request, int totalCount, TData data)
            : base(request, totalCount)
        {
            Datas = data;
        }

        [DataMember(Name = "datas", Order = 6)]
        public TData Datas { get; set; }
    }
}