using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class Teacher : BaseModel
    {
        public int TeacherId { get; set; }

        public int Salary { get; set; }

        public bool HasLeft { get; set; }

        public int? PhotoId { get; set; }
        public virtual Photo Photo { get; set; }

        [Required]
        public int TeacherRankId { get; set; }
        public virtual TeacherRank TeacherRank { get; set; }

        public virtual List<TeacherField> TeacherFields { get; set; }

        public virtual List<Phone> Phones { get; set; }

        public virtual List<TeacherCourse> TeacherCourses { get; set; }
    }
}