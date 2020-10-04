using Domain;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Persistence;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Services
{
    public class ClassService : BaseService<Class>, IClassService
    {
        public ClassService(ImsContext _context, IHttpContextAccessor httpContextAccessor)
        : base(_context, httpContextAccessor) { }

        public override async Task<IEnumerable<Class>> GetAllAsync<TValue>(
            TValue predicateValue, Expression<Func<Class, TValue>> wherePredicate, Expression<Func<Class, object>>[] includeFuncs)
        {
            var query = _entity.AsQueryable();

            //returns all record if where predicate is null
            if (wherePredicate != null)
            {
                var predicate =
                    Expression.Lambda<Func<Class, bool>>(
                        Expression.Equal(wherePredicate.Body, Expression.Constant(predicateValue)),
                        wherePredicate.Parameters.Single());

                query = query.Where(predicate);
            }
            return await query.Include(e => e.Batches).ThenInclude(i => i.Groups).ThenInclude(k => k.Subgroups).ToListAsync();
        }
    }
}