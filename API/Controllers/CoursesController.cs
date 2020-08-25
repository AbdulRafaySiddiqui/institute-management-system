using Domain;
using Services;

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