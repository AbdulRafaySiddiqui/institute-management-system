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

        [Route("filter")]
        [HttpGet("filter/{id}")]
        public async Task<ActionResult<IEnumerable<T>>> Get(int id)
        {
            if (_filterProp == null)
            {
                return BadRequest("Not allowed");
            }
            return Ok(await _service.GetAllAsync(_filterProp, id, _includeFuncs));
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<T>> GetById(int id)
        {
            var entity = await _service.GetByIdAsync(id,_includeFuncs);
            if (entity == null)
            {
                return NotFound();
            }
            return Ok(entity);
        }

        [HttpPost]
        public async Task<ActionResult<T>> Add([FromBody] T entity)
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
        public async Task<ActionResult<T>> Update([FromBody] T entity)
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
                var _updatedEntity = await _service.GetByIdAsync(id,_includeFuncs);
                return Ok(_updatedEntity);
            }
            return ValidationProblem(ModelState);
        }

        [HttpPatch("{id}")]
        public async Task<ActionResult> Update(int id, [FromBody] JsonPatchDocument<T> patchDoc)
        {
            var _entity = await _service.GetByIdAsync(id,_includeFuncs);
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
        public async Task<ActionResult> Delete(int id)
        {
            var _entity = await _service.GetByIdAsync(id,_includeFuncs);
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
