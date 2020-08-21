using Microsoft.Extensions.DependencyInjection;
using Persistence;

namespace API
{
    public static class ConfigureServices
    {
        public static IServiceCollection UseModelServices(this IServiceCollection services)
        {
            services.AddScoped<IBranchService,BranchService>();
            return services;
        }
    }
}