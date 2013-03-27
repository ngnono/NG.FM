﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NGnono.FinancialManagement.Models.Enums
{
    public enum AccountType
    {
        /// <summary>
        /// 默认
        /// </summary>
        Default = 0,

        /// <summary>
        /// 优惠卷
        /// </summary>
        Coupon = 1,

        /// <summary>
        /// 积分
        /// </summary>
        Point = 2,

        /// <summary>
        /// 收藏数
        /// </summary>
        FavorCount = 3,

        /// <summary>
        /// 我喜欢数
        /// </summary>
        IlikeCount = 4,

        /// <summary>
        /// 喜欢我数
        /// </summary>
        LikeMeCount = 5,

        /// <summary>
        /// 消费次数
        /// </summary>
        ConsumptionCount = 6,

        /// <summary>
        /// 分享数
        /// </summary>
        ShareCount = 7
    }
}
