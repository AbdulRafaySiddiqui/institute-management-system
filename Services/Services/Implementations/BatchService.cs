using Domain;
using Persistences;

namespace Services
{
    public class BatchService : BaseService<Batch>, IBatchService
    {
        public BatchService(ImsContext _context) : base(_context)
        {
        }
    }
}