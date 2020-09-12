using Domain;
using Microsoft.AspNetCore.Http;
using Persistence;

namespace Services
{
    public class FieldService : BaseService<Field>, IFieldService
    {
        public FieldService(ImsContext _context, IHttpContextAccessor httpContextAccessor)
        : base(_context, httpContextAccessor) { }
    }
}