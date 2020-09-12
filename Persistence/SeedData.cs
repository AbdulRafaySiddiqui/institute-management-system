using Microsoft.EntityFrameworkCore;

namespace Persistence
{
    public static class SeedData
    {
        public static ModelBuilder Seed(this ModelBuilder modelBuilder)
        {
            // modelBuilder.Entity<UserType>().HasData(
            //     new UserType
            //     {
            //         Name = "Administrator",
            //         DateTimeCreated = DateTime.Now
            //     },
            //     new UserType
            //     {
            //         Name = "CanView",
            //         DateTimeCreated = DateTime.Now
            //     },
            //     new UserType
            //     {
            //         Name = "CanEdit",
            //         DateTimeCreated = DateTime.Now
            //     },
            //     new UserType
            //     {
            //         Name = "CanDelete",
            //         DateTimeCreated = DateTime.Now
            //     }

            // );

            return modelBuilder;
        }
    }
}