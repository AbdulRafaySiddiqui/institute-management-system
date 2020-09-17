using Domain;
using Services;

namespace API
{
    public class StudentIdTypesController : BaseController<StudentIdType, IStudentIdTypeService>
    {
        public StudentIdTypesController(IStudentIdTypeService service)
        : base(
            service: service,
            filterProp: e => e.BranchId
          )
        { }
    }
}