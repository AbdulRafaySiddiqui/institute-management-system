using Domain;
using Services;
using System;
using System.Linq.Expressions;

namespace API
{
    public class BatchFeeTypesController : BaseController<BatchFeeType, IBatchFeeTypeService>
    {
        public BatchFeeTypesController(IBatchFeeTypeService service)
        : base(
            service: service,
            filterProp: e => e.BatchId,
            includeFuncs: new Expression<Func<BatchFeeType, object>>[] { e => e.FeeType }
          )
        { }
    }
}