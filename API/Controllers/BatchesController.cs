using Domain;
using Services;
using System;
using System.Linq.Expressions;

namespace API
{
    public class BatchesController : BaseController<Batch, IBatchService>
    {
        public BatchesController(IBatchService service)
        : base(service: service, filterProp: e => e.ClassId,includeFuncs: new Expression<Func<Batch, object>>[] { e=> e.Groups }) { }
    }
}