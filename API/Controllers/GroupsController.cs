using System;
using System.Linq.Expressions;
using Domain;
using Services;

namespace API
{
    public class GroupsController : BaseController<Group, IGroupService>
    {
        public GroupsController(IGroupService service)
        : base(
            service: service,
            filterProp: e => e.BatchId,
            includeFuncs: new Expression<Func<Group, object>>[] { e => e.Subgroups }
          )
        { }
    }
}