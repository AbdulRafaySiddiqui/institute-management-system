using System;
using System.Linq.Expressions;
using Domain;
using Persistence;

namespace API
{
    public class BatchesController : BaseController<Batch, IBatchService>
    {
        public BatchesController(IBatchService service)
        : base(service: service, filterProp: e => e.ClassId ?? 0) { }
    }
}