using Domain;
using Microsoft.EntityFrameworkCore;

namespace Persistence
{
    public static class ConfigureModels
    {
        public static ModelBuilder UseConfigureModels(this ModelBuilder modelBuilder)
        {
            //define many-to-many relationships
            modelBuilder.Entity<Setting>()
                .HasKey(s => new { s.BranchId, s.SettingName });

            modelBuilder.Entity<TeacherCourse>().
                HasKey(teacherCourse => new { teacherCourse.TeacherId, teacherCourse.CourseId, teacherCourse.BatchId, teacherCourse.SubgroupId });

            modelBuilder.Entity<StudentBatch>().
                HasKey(studentBatch => new { studentBatch.StudentId, studentBatch.BatchId });

            modelBuilder.Entity<StudentGuardian>().HasKey(sg => new { sg.GuardianId, sg.StudentId });

            modelBuilder.Entity<StudentSubgroup>().
                HasKey(studentSubgroup => new { studentSubgroup.StudentId, studentSubgroup.SubgroupId });



            //resolving cascading delete

            modelBuilder.Entity<Phone>()
                .HasOne(i => i.Student)
                .WithMany(i => i.Phones)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Phone>()
               .HasOne(i => i.Guardian)
               .WithMany(i => i.Phones)
               .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Phone>()
               .HasOne(i => i.Staff)
               .WithMany(i => i.Phones)
               .OnDelete(DeleteBehavior.Cascade);

            //TODO: Solve the Teacher Phone cascade delete problem with multiple cascade paths
            modelBuilder.Entity<Phone>()
               .HasOne(i => i.Teacher)
               .WithMany(i => i.Phones)
               .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<StudentGuardian>()
                .HasOne(sg => sg.Student)
                .WithMany(s => s.StudentGuardians)
                .HasForeignKey(sg => sg.StudentId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<BatchFeeType>()
                .HasOne(sg => sg.FeeType)
                .WithMany(s => s.BatchFeeTypes)
                .HasForeignKey(sg => sg.FeeTypeId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<TeacherCourse>()
                .HasOne(sg => sg.Teacher)
                .WithMany(s => s.TeacherCourses)
                .HasForeignKey(sg => sg.TeacherId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<TeacherCourse>()
              .HasOne(sg => sg.Course)
              .WithMany(c => c.TeacherCourses)
              .HasForeignKey(tc => tc.CourseId)
              .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<StudentBatch>()
                .HasOne(sg => sg.Student)
                .WithMany(s => s.StudentBatches)
                .HasForeignKey(sg => sg.StudentId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<StudentBatch>()
               .HasOne(sg => sg.Batch)
               .WithMany(s => s.StudentBatches)
               .HasForeignKey(sg => sg.BatchId)
               .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<StudentSubgroup>()
                .HasOne(sg => sg.Student)
                .WithMany(s => s.StudentSubgroups)
                .HasForeignKey(sg => sg.StudentId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<StudentSubgroup>()
               .HasOne(sg => sg.Subgroup)
               .WithMany(s => s.StudentSubgroups)
               .HasForeignKey(sg => sg.SubgroupId)
               .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Exam>()
                .HasOne(sg => sg.ExamType)
                .WithMany()
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<StudentIdType>()
                .HasOne(sg => sg.Branch)
                .WithMany()
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<FeeCollection>()
                .HasOne(a => a.Guardian)
                .WithMany()
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<ExamGradeType>()
                .HasOne(a => a.Course)
                .WithMany()
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Subgroup>()
              .HasOne(sg => sg.Group)
              .WithMany(s => s.Subgroups)
              .HasForeignKey(sg => sg.GroupId)
              .OnDelete(DeleteBehavior.Restrict);

            //to disable cascade delete for entire database
            //var cascadeFKs = modelBuilder.Model.GetEntityTypes()
            //    .SelectMany(t => t.GetForeignKeys())
            //    .Where(fk => !fk.IsOwnership && fk.DeleteBehavior == DeleteBehavior.Cascade);

            //foreach (var fk in cascadeFKs)
            //    fk.DeleteBehavior = DeleteBehavior.ClientCascade;

            return modelBuilder;
        }
    }
}
