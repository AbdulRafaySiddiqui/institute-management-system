using Domain;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Services
{
    public  interface IStudentService : IBaseService<Student>
    {
        Task<List<Student>> GetAllAsync(int batchId);
    }
}
