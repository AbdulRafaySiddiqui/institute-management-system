using Domain;
using Microsoft.AspNetCore.Http;
using Persistences;

namespace Services
{
    public class CourseService : BaseService<Course>, ICourseService
    {
        public CourseService(ImsContext _context, IHttpContextAccessor httpContextAccessor)
        : base(_context, httpContextAccessor) { }
    }
}