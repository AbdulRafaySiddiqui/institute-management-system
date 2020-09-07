using Domain;
using Services;

namespace API
{
    public class FeeTypesController : BaseController<FeeType, IFeeTypeService>
    {
        public FeeTypesController(IFeeTypeService service)
        : base(
            service: service,
            filterProp: e => e.BranchId
          )
        { }
    }
}