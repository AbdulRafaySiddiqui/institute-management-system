using Domain;
using Microsoft.AspNetCore.Http;
using Persistence;

namespace Services
{
    public class BatchService : BaseService<Batch>, IBatchService
    {
        public BatchService(ImsContext _context, IHttpContextAccessor httpContextAccessor)
        : base(_context, httpContextAccessor)
        {
        }
    }
}