using Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Persistence
{
    public class BaseService<T> : IBaseService<T> where T : BaseModel
    {
        private ImsContext _context = null;
        private DbSet<T> _entity = null;

        public BaseService(ImsContext _context)
        {
            this._context = _context;
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
    }
}
