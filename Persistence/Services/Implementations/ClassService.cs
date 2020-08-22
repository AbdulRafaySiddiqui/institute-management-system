using Domain;
using System.Linq;

namespace Persistence
{
    public class ClassService : BaseService<Class>, IClassService
    {
        public ClassService(ImsContext _context) : base(_context) { }
    }
}