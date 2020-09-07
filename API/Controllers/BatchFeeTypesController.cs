using Domain;
using Services;

namespace API
{
    public class BatchFeeTypesController : BaseController<BatchFeeType, IBatchFeeTypeService>
    {
        public BatchFeeTypesController(IBatchFeeTypeService service)
        : base(
            service: service,
            filterProp: e => e.BatchId
          )
        { }
    }
}