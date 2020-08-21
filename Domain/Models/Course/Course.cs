using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class Course : BaseModel
    {
        public int CourseId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        public int ClassId { get; set; }
        public Class Class { get; set; }

        [MaxLength(50)]
        public string ShortName { get; set; }

        public virtual List<TeacherCourse> TeacherCourses { get; set; }
    }
}
