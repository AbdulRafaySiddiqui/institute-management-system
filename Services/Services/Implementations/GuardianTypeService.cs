using Domain;
using Microsoft.AspNetCore.Http;
using Persistence;

namespace Services
{
    public class GuardianTypeService : BaseService<GuardianType>, IGuardianTypeService
    {
        public GuardianTypeService(ImsContext context, IHttpContextAccessor httpContextAccessor) : base(context, httpContextAccessor)
        {
        }
    }
}
