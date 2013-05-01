﻿using System;

namespace NGnono.FinancialManagement.WebSiteCore.Utils
{
    public class DateTimeUtil
    {
        /// <summary>
        /// 取得某月的第一天
        /// </summary>
        /// <param name="datetime">要取得月份第一天的时间</param>
        /// <returns></returns>
        public static DateTime FirstDayOfMonth(DateTime datetime)
        {
            return datetime.AddDays(1 - datetime.Day);
        }

        /// <summary>
        /// 取得某月的最后一天
        /// </summary>
        /// <param name="datetime">要取得月份最后一天的时间</param>
        /// <returns></returns>
        public static DateTime LastDayOfMonth(DateTime datetime)
        {
            return datetime.AddDays(1 - datetime.Day).AddMonths(1).AddDays(-1);
        }

        /// <summary>
        /// 取得上个月第一天
        /// </summary>
        /// <param name="datetime">要取得上个月第一天的当前时间</param>
        /// <returns></returns>
        public static DateTime FirstDayOfPreviousMonth(DateTime datetime)
        {
            return datetime.AddDays(1 - datetime.Day).AddMonths(-1);
        }

        /// <summary>
        /// 取得上个月的最后一天
        /// </summary>
        /// <param name="datetime">要取得上个月最后一天的当前时间</param>
        /// <returns></returns>
        public static DateTime LastDayOfPrdviousMonth(DateTime datetime)
        {
            return datetime.AddDays(1 - datetime.Day).AddDays(-1);
        }

        /// <summary>
        /// 本周第1天
        /// </summary>
        /// <param name="datetime"></param>
        /// <returns></returns>
        public static DateTime FirstDayOfWeek(DateTime datetime)
        {
            return datetime.AddDays(1 - Int32.Parse(datetime.DayOfWeek.ToString("d")));
        }

        /// <summary>
        /// 本周最后1天
        /// </summary>
        /// <param name="datetime"></param>
        /// <returns></returns>
        public static DateTime LastDayOfWeek(DateTime datetime)
        {
            return FirstDayOfWeek(datetime).AddDays(6);
        }


        public static string GetWeekRange(DateTime datetime, string fDateFramt, string lDateFramt, string spit)
        {
            var f = FirstDayOfWeek(datetime);
            var l = LastDayOfWeek(datetime);

            return String.Format("{0}{1}{2}", f.ToString(fDateFramt), spit, l.ToString(lDateFramt));
        }

        public static string GetYearRange(DateTime datetime, string fDateFramt, string lDateFramt, string spit)
        {
            var f = new DateTime(datetime.Year, 1, 1);
            var l = f.AddYears(1).AddDays(-1);

            return String.Format("{0}{1}{2}", f.ToString(fDateFramt), spit, l.ToString(lDateFramt));
        }

        public static string GetWeekRangeDef(DateTime datetime)
        {
            return GetWeekRange(datetime, "yyyy年MM月dd日", "MM月dd日", "-");
        }

        public static string GetYearRangeDef(DateTime datetime)
        {
            return GetYearRange(datetime, "yyyy年MM月dd日", "MM月dd日", "-");
        }

        public static string GetMonthRange(DateTime datetime, string fDateFramt, string lDateFramt, string spit)
        {
            var f = FirstDayOfMonth(datetime);
            var l = LastDayOfMonth(datetime);

            return String.Format("{0}{1}{2}", f.ToString(fDateFramt), spit, l.ToString(lDateFramt));
        }

        public static string GetMonthRangeDef(DateTime datetime)
        {
            return GetMonthRange(datetime, "yyyy年MM月dd日", "MM月dd日", "-");
        }
    }
}
