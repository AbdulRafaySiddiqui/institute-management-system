using Domain;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using Services;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace API
{
    [Authorize]
    [Route("api/[controller]")]
    public class BaseController<T, TService> : ControllerBase
    where T : BaseModel
    where TService : IBaseService<T>
    {
        protected readonly TService _service;
        protected readonly Expression<Func<T, int>> _filterProp;
        protected readonly Expression<Func<T, object>>[] _includeFuncs;

        public BaseController(
            TService service,
            Expression<Func<T, int>> filterProp = null,
            Expression<Func<T, object>>[] includeFuncs = null
        )
        {
            _service = service;
            _filterProp = filterProp;
            _includeFuncs = includeFuncs;
        }


        [HttpGet]
        public virtual async Task<ActionResult<IEnumerable<Branch>>> Get()
        {
            if (_filterProp == null)
            {
                return Ok(await _service.GetAllAsync(0, null, _includeFuncs));
            }
            return BadRequest("Method Not Allowed. Use the '/filter/<filterId>' endpoint");
        }

        [Route("filter")]
        [HttpGet("filter/{id}")]
        public virtual async Task<ActionResult<IEnumerable<T>>> Get(int id)
        {
            if (_filterProp != null)
            {
                return Ok(await _service.GetAllAsync(id, _filterProp, _includeFuncs));
            }
            return BadRequest("Method Not allowed. Use endpoint without /filter");
        }

        [HttpGet("{id}")]
        public virtual async Task<ActionResult<T>> GetById(int id)
        {
            var entity = await _service.GetByIdAsync(id, _includeFuncs);
            if (entity == null)
            {
                return NotFound();
            }
            return Ok(entity);
        }

        [HttpPost]
        public virtual async Task<ActionResult<T>> Add([FromBody] T entity)
        {
            if (ModelState.IsValid)
            {
                var _entity = await _service.AddAsync(entity);
                await _service.SaveAsync();
                var _id = _service.GetKey(_entity);
                var _newEntity = await _service.GetByIdAsync(_id, _includeFuncs);
                return CreatedAtAction(nameof(GetById), new { id = _id }, _newEntity);
            }
            return ValidationProblem(ModelState);
        }

        [HttpPut]
        public virtual async Task<ActionResult<T>> Update([FromBody] T entity)
        {
            var id = _service.GetKey(entity);
            if (id == 0)
            {
                return NotFound();
            }
            if (ModelState.IsValid)
            {
                _service.Update(entity);
                await _service.SaveAsync();
                var _updatedEntity = await _service.GetByIdAsync(id, _includeFuncs);
                return Ok(_updatedEntity);
            }
            return ValidationProblem(ModelState);
        }

        [HttpPatch("{id}")]
        public virtual async Task<ActionResult> Update(int id, [FromBody] JsonPatchDocument<T> patchDoc)
        {
            var _entity = await _service.GetByIdAsync(id, _includeFuncs);
            if (_entity == null)
            {
                return NotFound();
            }
            patchDoc.ApplyTo(_entity, ModelState);

            if (!TryValidateModel(_entity))
            {
                return ValidationProblem(ModelState);
            }

            _service.Update(_entity);
            await _service.SaveAsync();
            var _id = _service.GetKey(_entity);
            return NoContent();
        }

        [HttpDelete("{id}")]
        public virtual async Task<ActionResult> Delete(int id)
        {
            var _entity = await _service.GetByIdAsync(id, _includeFuncs);
            if (_entity == null)
            {
                return NotFound();
            }

            _service.Delete(id);
            await _service.SaveAsync();
            return Ok();
        }
    }
}
