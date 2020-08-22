using Domain;
using Persistence;

namespace API
{
    public class CoursesController : BaseController<Course, ICourseService>
    {
        public CoursesController(ICourseService service)
        : base(
            service: service,
            filterProp: e => e.ClassId ?? 0
          )
        { }
    }
}