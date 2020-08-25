using Domain;
using Persistences;
using System.Linq;

namespace Services
{
    public class ClassService : BaseService<Class>, IClassService
    {
        public ClassService(ImsContext _context) : base(_context) { }
    }
}