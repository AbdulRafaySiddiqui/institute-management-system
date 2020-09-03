using Domain;
using Microsoft.AspNetCore.Http;
using Persistences;
using System.Linq;

namespace Services
{
    public class ClassService : BaseService<Class>, IClassService
    {
        public ClassService(ImsContext _context, IHttpContextAccessor httpContextAccessor)
        : base(_context, httpContextAccessor) { }
    }
}