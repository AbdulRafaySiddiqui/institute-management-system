using Microsoft.Extensions.DependencyInjection;
using Services;

namespace API
{
    public static class ConfigureServices
    {
        public static IServiceCollection UseModelServices(this IServiceCollection services)
        {
            services.AddScoped<IBranchService, BranchService>();
            services.AddScoped<IClassService, ClassService>();
            services.AddScoped<IBatchService, BatchService>();
            services.AddScoped<ICourseService, CourseService>();
            services.AddScoped<IUserService, UserService>();
            return services;
        }
    }
}