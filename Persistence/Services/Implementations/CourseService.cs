using Domain;

namespace Persistence
{
    public class CourseService : BaseService<Course>, ICourseService
    {
        public CourseService(ImsContext _context) : base(_context) { }
    }
}