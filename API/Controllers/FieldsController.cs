using Domain;
using Services;
using System;
using System.Linq.Expressions;

namespace API
{
    public class FieldsController : BaseController<Field, IFieldService>
    {
        public FieldsController(IFieldService service)
        : base(
            service: service,
            includeFuncs: new Expression<Func<Field, object>>[] { e => e.DefaultValues }
          )
        { }
    }
}