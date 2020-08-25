using Domain;
using Persistences;

namespace Services
{
    public class CourseService : BaseService<Course>, ICourseService
    {
        public CourseService(ImsContext _context) : base(_context) { }
    }
}