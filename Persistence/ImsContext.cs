using Domain;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Persistence
{
    public class ImsContext : IdentityDbContext<User>
    {
        public ImsContext(DbContextOptions<ImsContext> options) : base(options) { }

        public DbSet<Branch> Branches { get; set; }

        public DbSet<Field> Fields { get; set; }
        public DbSet<FieldValue> FieldValues { get; set; }
        public DbSet<StudentField> StudentFields { get; set; }
        public DbSet<GuardianField> GuardianFields { get; set; }
        public DbSet<TeacherField> TeacherFields { get; set; }
        public DbSet<StaffField> StaffFields { get; set; }

        public DbSet<Photo> Photos { get; set; }

        public DbSet<Phone> Phones { get; set; }

        public DbSet<Class> Classes { get; set; }
        public DbSet<Batch> Batches { get; set; }
        public DbSet<Course> Courses { get; set; }

        public DbSet<Student> Students { get; set; }
        public DbSet<StudentIdType> StudentIdTypes { get; set; }
        public DbSet<Group> Groups { get; set; }
        public DbSet<Subgroup> Subgroups { get; set; }

        public DbSet<Guardian> Guardians { get; set; }
        public DbSet<GuardianType> GuardianTypes { get; set; }

        public DbSet<Teacher> Teachers { get; set; }

        public DbSet<Staff> Staffs { get; set; }

        public DbSet<ExamType> ExamTypes { get; set; }
        public DbSet<ExamGradeType> ExamGradeTypes { get; set; }
        public DbSet<Exam> Exams { get; set; }
        public DbSet<ExamRecord> ExamRecords { get; set; }

        public DbSet<FeeType> FeeTypes { get; set; }
        public DbSet<BatchFeeType> BatchFeeTypes { get; set; }
        public DbSet<FeeCollection> FeeCollections { get; set; }
        public DbSet<FeeRecord> FeeRecords { get; set; }

        public DbSet<StudentAttendanceType> StudentAttendanceTypes { get; set; }
        public DbSet<TeacherAttendanceType> TeacherAttendanceTypes { get; set; }
        public DbSet<StaffAttendanceType> StaffAttendanceTypes { get; set; }

        public DbSet<Expanse> Expanses { get; set; }
        public DbSet<ExpanseType> ExpanseTypes { get; set; }

        public DbSet<UserType> UserTypes { get; set; }

        public DbSet<Setting> Settings { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder
            .UseConfigureModels()
            .Seed());
        }
    }
}
