using Domain;
using Services;
using System;
using System.Linq.Expressions;

namespace API
{
    public class ClassesController : BaseController<Class, IClassService>
    {
        public ClassesController(IClassService service)
        : base(
            service: service,
            filterProp: e => e.BranchId ?? 0,
            includeFuncs: new Expression<Func<Class, object>>[] { e => e.Batches }
          )
        { }
    }
}