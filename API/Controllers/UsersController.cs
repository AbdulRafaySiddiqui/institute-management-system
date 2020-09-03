using Domain;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Services;
using System.Threading.Tasks;

namespace API
{
    [Route("api/[controller]")]
    public class UsersController : ControllerBase
    {
        private readonly IUserService _service;

        public UsersController(IUserService service)
        {
            _service = service;
        }

        [AllowAnonymous]
        [HttpPost("register")]
        public async Task<ActionResult<UserDto>> Register([FromBody] UserLoginModel userLoginModel)
        {
            if (await _service.GetUserByEmail(userLoginModel.Email) != null)
            {
                return BadRequest("User already exists.");
            }
            var user = await _service.Register(userLoginModel, userLoginModel.Password);
            if (user == null)
            {
                return Unauthorized();
            }
            return Ok(user);
        }

        [HttpPost("login")]
        public async Task<ActionResult<UserDto>> Login([FromBody] UserLoginModel userLoginModel)
        {
            if (userLoginModel == null)
            {
                return BadRequest();
            }
            var user = await _service.GetUserByEmail(userLoginModel.Email);
            if (user == null)
            {
                return BadRequest("Email don't Exists.");
            }
            var response = await _service.Login(user, userLoginModel.Password);
            if (response == null)
            {
                return Unauthorized();
            }
            return Ok(response);
        }
    }
}
