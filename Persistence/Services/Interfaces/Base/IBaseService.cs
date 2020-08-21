using System.Collections.Generic;
using System.Threading.Tasks;

namespace Persistence
{
    public interface IBaseService<T> where T : class
    {
        Task<IEnumerable<T>> GetAllAsync();
        Task<T> GetByIdAsync(int id);
        Task<T> AddAsync(T obj);
        void Update(T obj);
        void Delete(int id);
        Task SaveAsync();
    }
}
