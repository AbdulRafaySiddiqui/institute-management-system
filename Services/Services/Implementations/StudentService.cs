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
    public class StudentService : BaseService<Student>, IStudentService
    {
        public StudentService(ImsContext context, IHttpContextAccessor httpContextAccessor) : base(context, httpContextAccessor) { }

        public Task<List<Student>> GetAllAsync(int batchId)
        {
            return _entity
                .Where(s => s.StudentBatches.Any(i => i.BatchId == batchId))
                .Include(k => k.StudentFields)
                .Include(j => j.StudentSubgroups)
                .ToListAsync();
        }

        public override Task<Student> GetByIdAsync(int id, Expression<Func<Student, object>>[] includeFuncs)
        {
            return base.GetByIdAsync(id, new Expression<Func<Student, object>>[]
            {
                i=> i.StudentBatches,
                i=> i.StudentFields,
                i=> i.StudentGuardians,
                i=> i.StudentSubgroups,
                i=> i.StudentIdType,
                i=> i.Phones,
                i=> i.Photo,
                i=> i.Discounts,
            });
            //return _entity.
            //   Include(i => i.StudentBatches).
            //   Include(i => i.StudentFields).
            //   Include(i => i.StudentGuardians).
            //   Include(i => i.StudentSubgroups).
            //   Include(i => i.StudentIdType).
            //   Include(i => i.Phones).
            //   Include(i => i.Photo).
            //   Include(i => i.Discounts).
            //   Where(i => i.StudentId == id).
            //   SingleAsync();
        }
    }
}
