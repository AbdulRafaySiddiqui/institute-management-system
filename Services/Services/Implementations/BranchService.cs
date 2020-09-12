using Domain;
using Microsoft.AspNetCore.Http;
using Persistence;

namespace Services
{
    public class BranchService : BaseService<Branch>, IBranchService
    {
        public BranchService(ImsContext _context, IHttpContextAccessor httpContextAccessor)
         : base(_context, httpContextAccessor)
        {
        }
    }
}