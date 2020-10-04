using Domain;
using Services;

namespace API
{
    public class BranchesController : BaseController<Branch, IBranchService>
    {
        public BranchesController(IBranchService service) : base(service) { }
    }
}