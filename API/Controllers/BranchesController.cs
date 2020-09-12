using Domain;
using Microsoft.AspNetCore.Mvc;
using Services;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API
{
    public class BranchesController : BaseController<Branch, IBranchService>
    {
        public BranchesController(IBranchService service) : base(service) { }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Branch>>> Get()
        {
            return Ok(await _service.GetAllAsync(null,0,null));
        }
    }
}