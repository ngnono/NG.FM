using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NGnono.FinancialManagement.Data.Models;
using NGnono.Framework.Models;

namespace NGnono.FinancialManagement.WebSiteCore.Models.Vo
{

    public class ProductInfo : BaseViewModel
    {
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
    }

    public class ProductViewModel
    {
        public ProductEntity Product { get; set; }
        public StoreEntity Store { get; set; }
        public BrandEntity Brand { get; set; }
        public TagEntity Tag { get; set; }
    }

    public class CreatedProductViewModel : BaseViewModel
    {
        public string Name { get; set; }
        public int Brand_Id { get; set; }
        public string Description { get; set; }

        public decimal Price { get; set; }
        public string RecommendedReason { get; set; }
        public string Favorable { get; set; }
        public int RecommendUser { get; set; }

        public int Store_Id { get; set; }
        public int Tag_Id { get; set; }
    }

    public class UpdateProductViewModel : CreatedProductViewModel
    {
        public int Id { get; set; }
    }

    public class ProductCollectionViewModel : PagerInfoBaseViewModel<List<ProductViewModel>>
    {
        public ProductCollectionViewModel(PagerRequest request)
            : base(request)
        {
        }

        public ProductCollectionViewModel(PagerRequest request, int totalCount)
            : base(request, totalCount)
        {
        }
    }
}
