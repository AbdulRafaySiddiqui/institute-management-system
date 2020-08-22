using Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Persistence
{
    public class BaseService<T> : IBaseService<T> where T : BaseModel
    {
        protected ImsContext _context = null;
        protected DbSet<T> _entity = null;

        public BaseService(ImsContext context)
        {
            _context = context;
            _entity = _context.Set<T>();
        }

        public async Task<IEnumerable<T>> GetAllAsync()
        {
            return await _entity.ToListAsync();
        }

        public async Task<T> GetByIdAsync(int id)
        {
            return await _entity.FindAsync(id);
        }

        public async Task<IEnumerable<T>> GetAllAsync<TValue>(
            Expression<Func<T, TValue>> func,
            TValue value,
            Expression<Func<T, object>>[] includeFuncs)
        {
            var predicate =
                Expression.Lambda<Func<T, bool>>(
                    Expression.Equal(func.Body, Expression.Constant(value)),
                    func.Parameters.Single());

            var query = _entity.Where(predicate);
            foreach (var include in includeFuncs)
            {
                query = query.Include(include);
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
            await _entity.AddAsync(obj);
            return obj;
        }

        public void Update(T obj)
        {
            obj.DateTimeModified = DateTime.Now;
            _entity.Attach(obj);
            _context.Entry(obj).State = EntityState.Modified;
        }

        public void Delete(int id)
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
