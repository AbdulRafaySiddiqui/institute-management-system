using Domain;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using Persistence;
using System.Collections.Generic;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API
{
    [Route("api/[controller]")]
    public class BranchesController : ControllerBase
    {
        public BranchesController(IBranchService service)
        {
            _service = service;
        }

        private readonly IBranchService _service;

        // GET: api/<controller>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Branch>>> Get()
        {
            return Ok(await _service.GetAllAsync());
        }

        // GET api/<controller>/5
        [HttpGet("{id}", Name = "GetById")]
        public async Task<ActionResult<Branch>> GetById(int id)
        {
            var branch = await _service.GetByIdAsync(id);
            if (branch == null)
            {
                return NotFound();
            }
            return Ok(branch);
        }

        // POST api/<controller>
        [HttpPost]
        public async Task<ActionResult<Branch>> Add([FromBody] Branch branch)
        {
            if (ModelState.IsValid)
            {
                var _branch = await _service.AddAsync(branch);
                await _service.SaveAsync();
                return CreatedAtRoute(nameof(GetById), new { id = _branch.BranchId }, _branch);
            }
            return ValidationProblem(ModelState);
        }

        // PUT api/<controller>/5
        [HttpPatch("{id}")]
        public async Task<ActionResult> Update(int id, [FromBody] JsonPatchDocument<Branch> patchDoc)
        {
            var _branch = await _service.GetByIdAsync(id);
            if (_branch == null)
            {
                return NotFound();
            }
            patchDoc.ApplyTo(_branch, ModelState);

            if (!TryValidateModel(_branch))
            {
                return ValidationProblem(ModelState);
            }

            _service.Update(_branch);
            await _service.SaveAsync();
            return NoContent();
        }

        // DELETE api/<controller>/5
        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            var _branch = await _service.GetByIdAsync(id);
            if (_branch == null)
            {
                return NotFound();
            }

            _service.Delete(id);
            await _service.SaveAsync();
            return Ok();
        }
    }
}
