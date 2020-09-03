using Domain;
using Microsoft.AspNetCore.Http;
using Persistences;

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