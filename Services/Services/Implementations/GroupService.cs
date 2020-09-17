using Domain;
using Microsoft.AspNetCore.Http;
using Persistence;

namespace Services
{
    public class GroupService : BaseService<Group>, IGroupService
    {
        public GroupService(ImsContext _context, IHttpContextAccessor httpContextAccessor)
        : base(_context, httpContextAccessor) { }
    }
}