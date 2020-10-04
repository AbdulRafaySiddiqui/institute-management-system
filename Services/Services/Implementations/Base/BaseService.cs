using Domain;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Persistence;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Security.Claims;
using System.Threading.Tasks;

namespace Services
{
    public class BaseService<T> : IBaseService<T> where T : BaseModel
    {
        protected ImsContext _context = null;
        protected readonly IHttpContextAccessor _httpContextAccessor;
        protected DbSet<T> _entity = null;

        public BaseService(ImsContext context, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _httpContextAccessor = httpContextAccessor;
            _entity = _context.Set<T>();
        }

        public virtual async Task<T> GetByIdAsync(
            int id,
            Expression<Func<T, object>>[] includeFuncs)
        {
            var item = await _entity.FindAsync(id);
            if (includeFuncs != null)
            {
                if (item == null)
                {
                    return null;
                }

                foreach (var include in includeFuncs)
                {
                    var propertyName = ((MemberExpression)include.Body).Member.Name;
                    await _context.Entry(item).Navigation(propertyName).LoadAsync();

                    //if (typeof(IEnumerable).IsAssignableFrom(include.Body.Type))
                    //{
                    //    var inc = (Expression<Func<T, IEnumerable<object>>>)include;
                    //    if (inc != null)
                    //    {
                    //        await _context.Entry(item).Collection(inc).LoadAsync();
                    //    }
                    //}
                    //else
                    //    await _context.Entry(item).Reference(include).LoadAsync();
                }
            }
            return item;
        }

        public virtual async Task<IEnumerable<T>> GetAllAsync<TValue>(
           TValue predicateValue,
            Expression<Func<T, TValue>> wherePredicate,
            Expression<Func<T, object>>[] includeFuncs)
        {
            var query = _entity.AsQueryable();

            //returns all record if where predicate is null
            if (wherePredicate != null)
            {
                var predicate =
                    Expression.Lambda<Func<T, bool>>(
                        Expression.Equal(wherePredicate.Body, Expression.Constant(predicateValue)),
                        wherePredicate.Parameters.Single());

                query = query.Where(predicate);
            }

            //won't include any nested fields if includeFunds are null
            if (includeFuncs != null)
            {
                foreach (var include in includeFuncs)
                {
                    query = query.Include(include);
                }
            }
            return await query.ToListAsync();
        }

        public async Task<T> AddAsync(T obj)
        {
            if (obj == null)
            {
                throw new ArgumentNullException(nameof(obj));
            }
            obj.DateTimeCreated = DateTime.Now;
            var userId = _httpContextAccessor.HttpContext.User.FindFirstValue(ClaimTypes.NameIdentifier);
            obj.CreatedBy = userId;

            await _entity.AddAsync(obj);
            return obj;
        }

        public virtual void Update(T obj)
        {
            obj.DateTimeModified = DateTime.Now;
            var userId = _httpContextAccessor.HttpContext.User.FindFirstValue(ClaimTypes.NameIdentifier);
            obj.ModifiedBy = userId;
            _entity.Update(obj);
        }

        public virtual void Delete(int id)
        {
            T existing = _entity.Find(id);
            _entity.Remove(existing);
        }

        public async Task SaveAsync()
        {
            await _context.SaveChangesAsync();
        }

        public int GetKey(T obj)
        {
            var keyName = _context.Model.FindEntityType(typeof(T)).FindPrimaryKey().Properties
                .Select(x => x.Name).Single();

            return (int)obj.GetType().GetProperty(keyName).GetValue(obj, null);
        }
    }
}
