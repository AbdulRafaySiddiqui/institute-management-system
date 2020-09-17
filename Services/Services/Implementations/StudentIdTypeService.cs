using Domain;
using Microsoft.AspNetCore.Http;
using Persistence;

namespace Services
{
    public class StudentIdTypeService : BaseService<StudentIdType>, IStudentIdTypeService
    {
        public StudentIdTypeService(ImsContext _context, IHttpContextAccessor httpContextAccessor)
        : base(_context, httpContextAccessor) { }
    }
}