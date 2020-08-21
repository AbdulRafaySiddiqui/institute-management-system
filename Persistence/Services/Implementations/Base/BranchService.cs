using System.Collections.Generic;
using Domain;

namespace Persistence
{
    public class BranchService : BaseService<Branch>, IBranchService
    {
        public BranchService(ImsContext _context) : base(_context)
        {
        }
    }
}