using Domain;
using Microsoft.AspNetCore.Identity;
using Persistence;
using System.Threading.Tasks;

namespace Services
{
    public class UserService : IUserService
    {
        private readonly ImsContext _context;
        private readonly SignInManager<User> _signInManager;
        private readonly UserManager<User> _userManager;
        private readonly IJwtGenerator _jwtGenerator;

        public UserService(ImsContext context, UserManager<User> userManager, SignInManager<User> signInManager, IJwtGenerator jwtGenerator)
        {
            _context = context;
            _signInManager = signInManager;
            _userManager = userManager;
            _jwtGenerator = jwtGenerator;
        }

        public async Task<UserDto> Login(User user, string password)
        {
            var result = await _signInManager.CheckPasswordSignInAsync(user, password, false);
            if (result.Succeeded)
            {
                return new UserDto
                {
                    Name = user.Name,
                    Email = user.Email,
                    Token = _jwtGenerator.CreateToken(user)
                };
            }

            return null;
        }

        public async Task<UserDto> Register(UserLoginModel userLoginModel, string password)
        {
            var user = new User
            {
                UserName = userLoginModel.UserName,
                Email = userLoginModel.Email,
            };

            var result = await _userManager.CreateAsync(user, password);

            if (result.Succeeded)
            {
                return new UserDto
                {
                    UserName = user.UserName,
                    Email = user.Email,
                    Token = _jwtGenerator.CreateToken(user),
                };
            }
            return null;
        }

        public async Task<User> GetUserByEmail(string email)
        {
            return await _userManager.FindByEmailAsync(email);
        }
    }
}