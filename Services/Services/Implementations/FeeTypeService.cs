using Domain;
using Microsoft.AspNetCore.Http;
using Persistences;

namespace Services
{
    public class FeeTypeService : BaseService<FeeType>, IFeeTypeService
    {
        public FeeTypeService(ImsContext _context, IHttpContextAccessor httpContextAccessor)
        : base(_context, httpContextAccessor) { }
    }
}