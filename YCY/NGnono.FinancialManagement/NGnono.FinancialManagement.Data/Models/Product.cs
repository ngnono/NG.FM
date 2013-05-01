using System;
using System.Collections.Generic;

namespace NGnono.FinancialManagement.Data.Models
{
    public partial class ProductEntity : NGnono.Framework.Models.BaseEntity
    {
        public ProductEntity()
        {
            this.PriceSettings = new List<PriceSettingEntity>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public int Brand_Id { get; set; }
        public string Description { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int CreatedUser { get; set; }
        public System.DateTime UpdatedDate { get; set; }
        public int UpdatedUser { get; set; }
        public decimal Price { get; set; }
        public string RecommendedReason { get; set; }
        public string Favorable { get; set; }
        public int RecommendUser { get; set; }
        public int Status { get; set; }
        public int Store_Id { get; set; }
        public int Tag_Id { get; set; }
        public int FavoriteCount { get; set; }
        public int ShareCount { get; set; }
        public int InvolvedCount { get; set; }
        public int RecommendSourceId { get; set; }
        public int RecommendSourceType { get; set; }
        public int SortOrder { get; set; }
        public Nullable<bool> IsShare { get; set; }
        public virtual BrandEntity Brand { get; set; }
        public virtual ICollection<PriceSettingEntity> PriceSettings { get; set; }
        public virtual StoreEntity Store { get; set; }
        public virtual TagEntity Tag { get; set; }

#region Overrides of BaseEntity

        /// <summary>
        /// KeyMemberId
        /// </summary>
        public override object EntityId
        {       
                get { return Id; }
 
        }

        #endregion

    }
}