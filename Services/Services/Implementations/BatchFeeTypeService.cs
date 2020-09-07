using Domain;
using Microsoft.AspNetCore.Http;
using Persistences;

namespace Services
{
    public class BatchFeeTypeService : BaseService<BatchFeeType>, IBatchFeeTypeService
    {
        public BatchFeeTypeService(ImsContext _context, IHttpContextAccessor httpContextAccessor)
        : base(_context, httpContextAccessor) { }
    }
}