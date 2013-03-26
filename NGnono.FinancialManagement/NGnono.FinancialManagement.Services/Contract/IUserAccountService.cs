namespace NGnono.FinancialManagement.Services.Contract
{
    public interface IUserAccountService
    {
        /// <summary>
        /// 增加收藏数
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="foverCount"></param>
        /// <param name="updateUserId"></param>
        void AddFover(int userId, int foverCount, int updateUserId);

        /// <summary>
        /// 减少收藏数
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="foverCount"></param>
        /// <param name="updateUserId"></param>
        void SubFover(int userId, int foverCount, int updateUserId);

        /// <summary>
        /// 增加积分
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="pointCount"></param>
        /// <param name="updateUserId"></param>
        void AddPoint(int userId, int pointCount, int updateUserId);

        /// <summary>
        /// 减少积分
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="pointCount"></param>
        /// <param name="updateUserId"></param>
        void SubPoint(int userId, int pointCount, int updateUserId);

        /// <summary>
        /// 增加优惠码数
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="couponCount"></param>
        /// <param name="updateUserId"></param>
        void AddCoupon(int userId, int couponCount, int updateUserId);

        /// <summary>
        /// 减少优惠码数
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="couponCount"></param>
        /// <param name="updateUserId"></param>
        void SubCoupon(int userId, int couponCount, int updateUserId);

        /// <summary>
        /// 增加消费数
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="couponCount"></param>
        /// <param name="updateUserId"></param>
        void AddConsumption(int userId, int couponCount, int updateUserId);

        /// <summary>
        /// 减少消费数
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="couponCount"></param>
        /// <param name="updateUserId"></param>
        void SubConsumption(int userId, int couponCount, int updateUserId);

        /// <summary>
        /// 增加分享数
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="shareCount"></param>
        /// <param name="updateUserId"></param>
        void AddShare(int userId, int shareCount, int updateUserId);

        /// <summary>
        /// 增加我喜欢数
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="iLikeCount"></param>
        /// <param name="updateUserId"></param>
        void AddILike(int userId, int iLikeCount, int updateUserId);

        /// <summary>
        /// 减少我喜欢数
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="iLikeCount"></param>
        /// <param name="updateUserId"></param>
        void SubILike(int userId, int iLikeCount, int updateUserId);

        /// <summary>
        /// 增加喜欢我
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="likeMeCount"></param>
        /// <param name="updateUserId"></param>
        void AddLikeMe(int userId, int likeMeCount, int updateUserId);

        /// <summary>
        /// 减少喜欢我
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="likeMeCount"></param>
        /// <param name="updateUserId"></param>
        void SubLikeMe(int userId, int likeMeCount, int updateUserId);
    }
}