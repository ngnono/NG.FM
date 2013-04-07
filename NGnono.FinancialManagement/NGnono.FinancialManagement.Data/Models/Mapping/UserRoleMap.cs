using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace NGnono.FinancialManagement.Data.Models.Mapping
{
    public class UserRoleEntityMap : EntityTypeConfiguration<UserRoleEntity>
    {
        public UserRoleEntityMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            // Table & Column Mappings
            this.ToTable("UserRole");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.Role_Id).HasColumnName("Role_Id");
            this.Property(t => t.User_Id).HasColumnName("User_Id");
            this.Property(t => t.CreatedDate).HasColumnName("CreatedDate");
            this.Property(t => t.CreatedUser).HasColumnName("CreatedUser");
            this.Property(t => t.Status).HasColumnName("Status");

            // Relationships
            this.HasRequired(t => t.Role)
                .WithOptional(t => t.UserRole);
            this.HasRequired(t => t.User)
                .WithMany(t => t.UserRoles)
                .HasForeignKey(d => d.User_Id);

        }
    }
}
