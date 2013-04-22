
namespace NGnono.FinancialManagement.Data.Models.Mapping
{
    public partial class StoreEntityMap
    {
        partial void Init()
        {
            this.Property(t => t.Longitude).HasPrecision(11, 8);
            this.Property(t => t.Latitude).HasPrecision(11, 8);

            this.Property(t => t.GpsLat).HasPrecision(11, 8);
            this.Property(t => t.GpsLng).HasPrecision(11, 8);
        }
    }
}
