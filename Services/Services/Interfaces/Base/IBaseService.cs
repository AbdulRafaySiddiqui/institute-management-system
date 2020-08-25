using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Services
{
    public interface IBaseService<T> where T : class
    {
        Task<IEnumerable<T>> GetAllAsync();
        Task<IEnumerable<T>> GetAllAsync<TValue>(Expression<Func<T, TValue>> func, TValue value, Expression<Func<T, object>>[] includeFuncs);
        Task<T> GetByIdAsync(int id);
        Task<T> AddAsync(T obj);
        void Update(T obj);
        void Delete(int id);
        Task SaveAsync();
        int GetKey(T obj);
    }
}
