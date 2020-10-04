using Domain;
using Microsoft.AspNetCore.Mvc;
using Services;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API.Controllers
{
    public class StudentsController : BaseController<Student, IStudentService>
    {
        public StudentsController(IStudentService service)
        : base(service: service) { }

        public override async Task<ActionResult<IEnumerable<Branch>>> Get()
        {
            return BadRequest("Method Not Allowed. Use the '/filter/<filterId>' endpoint");
        }

        public override async Task<ActionResult<IEnumerable<Student>>> Get(int id)
        {
            return Ok(await _service.GetAllAsync(id));
        }
    }
}
