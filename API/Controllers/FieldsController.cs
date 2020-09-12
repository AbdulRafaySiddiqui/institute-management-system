using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Domain;
using Microsoft.AspNetCore.Mvc;
using Services;

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

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Field>>> Get()
        {
            return Ok(await _service.GetAllAsync(null,0, _includeFuncs));
        }
    }
}