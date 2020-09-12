using Domain;
using Microsoft.AspNetCore.Http;
using Persistence;

namespace Services
{
    public class CourseService : BaseService<Course>, ICourseService
    {
        public CourseService(ImsContext _context, IHttpContextAccessor httpContextAccessor)
        : base(_context, httpContextAccessor) { }
    }
}