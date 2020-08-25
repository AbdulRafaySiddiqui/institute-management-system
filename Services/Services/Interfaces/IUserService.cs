using System.Threading.Tasks;
using Domain;

namespace Services
{
    public interface IUserService
    {
        Task<UserDto> Login(User user, string password);
        Task<UserDto> Register(UserLoginModel email, string password);
        Task<User> GetUserByEmail(string email);
    }
}
