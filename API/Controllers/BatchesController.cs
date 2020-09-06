using Domain;
using Services;

namespace API
{
    public class BatchesController : BaseController<Batch, IBatchService>
    {
        public BatchesController(IBatchService service)
        : base(service: service, filterProp: e => e.ClassId) { }
    }
}