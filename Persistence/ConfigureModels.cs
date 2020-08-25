using Domain;
using Microsoft.EntityFrameworkCore;

namespace Persistences
{
    public static class  ConfigureModels
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
            modelBuilder.Entity<StudentGuardian>()
                .HasOne(sg => sg.Student)
                .WithMany(s => s.StudentGuardians)
                .HasForeignKey(sg => sg.StudentId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<BatchFeeType>()
                .HasOne(sg => sg.FeeType)
                .WithMany(s => s.BatchFeeTypes)
                .HasForeignKey(sg => sg.FeeTypeId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<TeacherCourse>()
                .HasOne(sg => sg.Teacher)
                .WithMany(s => s.TeacherCourses)
                .HasForeignKey(sg => sg.TeacherId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<TeacherCourse>()
              .HasOne(sg => sg.Course)
              .WithMany(c => c.TeacherCourses)
              .HasForeignKey(tc => tc.CourseId)
              .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<StudentBatch>()
                .HasOne(sg => sg.Student)
                .WithMany(s => s.StudentBatches)
                .HasForeignKey(sg => sg.StudentId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<StudentBatch>()
               .HasOne(sg => sg.Batch)
               .WithMany(s => s.StudentBatches)
               .HasForeignKey(sg => sg.BatchId)
               .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<StudentSubgroup>()
                .HasOne(sg => sg.Student)
                .WithMany(s => s.StudentSubgroups)
                .HasForeignKey(sg => sg.StudentId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<StudentSubgroup>()
               .HasOne(sg => sg.Subgroup)
               .WithMany(s => s.StudentSubgroups)
               .HasForeignKey(sg => sg.SubgroupId)
               .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Exam>()
                .HasOne(sg => sg.ExamType)
                .WithMany()
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<StudentIdType>()
                .HasOne(sg => sg.Branch)
                .WithMany()
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<FeeCollection>()
                .HasOne(a => a.Guardian)
                .WithMany()
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<ExamGradeType>()
                .HasOne(a => a.Course)
                .WithMany()
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Subgroup>()
              .HasOne(sg => sg.Group)
              .WithMany(s => s.Subgroups)
              .HasForeignKey(sg => sg.GroupId)
              .OnDelete(DeleteBehavior.NoAction);

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
