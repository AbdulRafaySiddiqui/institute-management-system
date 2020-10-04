using Domain;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Persistence;
using System;
using System.Linq;
using System.Security.Claims;

namespace Services
{
    public class GroupService : BaseService<Group>, IGroupService
    {
        public GroupService(ImsContext _context, IHttpContextAccessor httpContextAccessor)
        : base(_context, httpContextAccessor) { }

        public override void Update(Group obj)
        {
            //https://stackoverflow.com/questions/51331850/entity-framework-core-deleting-items-from-nested-collection
            //if collection properties are passed with less items, it won't delete the left out items because they aren't marked as deleted
            //to solve this we have to remove them manually

            var subgroups = _context.Subgroups.AsNoTracking().Where(i => i.GroupId == obj.GroupId).ToList();
            var deletedSubgroups = subgroups.Where(i => !obj.Subgroups.Any(k => k.SubgroupId == i.SubgroupId)).ToList();
            _context.Subgroups.RemoveRange(deletedSubgroups);
            _context.SaveChanges();


            obj.DateTimeModified = DateTime.Now;
            var userId = _httpContextAccessor.HttpContext.User.FindFirstValue(ClaimTypes.NameIdentifier);
            obj.ModifiedBy = userId;
            _context.Groups.Update(obj);

            _context.SaveChanges();
            //base.Update(obj);
        }
    }
}