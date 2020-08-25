using Domain;
using Persistences;

namespace Services
{
    public class BranchService : BaseService<Branch>, IBranchService
    {
        public BranchService(ImsContext _context) : base(_context)
        {
        }
    }
}