using Domain;
using Services;

namespace API.Controllers
{
    public class GuardianTypesController : BaseController<GuardianType, IGuardianTypeService>
    {
        public GuardianTypesController(IGuardianTypeService service)
        : base(service: service) { }
    }
}
