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
            services.AddScoped<IFeeTypeService, FeeTypeService>();
            services.AddScoped<IBatchFeeTypeService, BatchFeeTypeService>();
            services.AddScoped<IFieldService, FieldService>();
            services.AddScoped<IStudentIdTypeService, StudentIdTypeService>();
            services.AddScoped<IGroupService, GroupService>();
            services.AddScoped<IStudentService, StudentService>();
            services.AddScoped<IGuardianTypeService, GuardianTypeService>();
            return services;
        }
    }
}