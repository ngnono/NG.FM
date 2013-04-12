using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using NGnono.FinancialManagement.Data.Models;

namespace NGnono.FinancialManagement.WebSiteCore.Models.Vo
{
    [DataContract]
    public class StoreViewModel
    {
        public StoreViewModel()
        {
        }

        [DataMember(Name = "id")]
        public int Id { get; set; }

        [DataMember(Name = "name")]
        public string Name { get; set; }
        [DataMember(Name = "desc")]
        public string Description { get; set; }

        [DataMember(Name = "location")]
        public string Location { get; set; }
        [DataMember(Name = "tel")]
        public string Tel { get; set; }

        public int CreatedUser { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public System.DateTime UpdatedDate { get; set; }
        public int UpdatedUser { get; set; }

        [DataMember(Name = "lng")]
        public decimal Longitude { get; set; }

        [DataMember(Name = "lat")]
        public decimal Latitude { get; set; }

        public int Status { get; set; }

        public int StoreLevel { get; set; }
        public Nullable<double> GpsAlt { get; set; }
        public Nullable<decimal> GpsLat { get; set; }
        public Nullable<decimal> GpsLng { get; set; }
    }

    public class CreateStoreViewModel
    {

        public string Name { get; set; }

        public string Description { get; set; }


        public string Location { get; set; }

        public string Tel { get; set; }

        public decimal Longitude { get; set; }

        public decimal Latitude { get; set; }

        public Nullable<double> GpsAlt { get; set; }
        public Nullable<decimal> GpsLat { get; set; }
        public Nullable<decimal> GpsLng { get; set; }
    }

    public class UpdateStoreViewModel : CreateStoreViewModel
    {
        public int Id { get; set; }
    }
}
