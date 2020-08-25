using Domain;

namespace Services
{
    public interface IJwtGenerator
    {
        string CreateToken(User user);
    }
}
