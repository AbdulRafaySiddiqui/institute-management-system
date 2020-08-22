using System.Collections.Generic;
using System.Threading.Tasks;
using Domain;
using Microsoft.AspNetCore.Mvc;
using Persistence;

namespace API
{
    public class BranchesController : BaseController<Branch, IBranchService>
    {
        public BranchesController(IBranchService service) : base(service) { }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Branch>>> Get()
        {
            return Ok(await _service.GetAllAsync());
        }
    }
}