using Domain;

namespace Persistence
{
    public class BatchService : BaseService<Batch>, IBatchService
    {
        public BatchService(ImsContext _context) : base(_context)
        {
        }
    }
}