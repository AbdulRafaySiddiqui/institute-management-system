using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class Batch : BaseModel
    {
        public int BatchId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public bool IsActive { get; set; } = true;

        public int ClassId { get; set; }
        public virtual Class Class { get; set; }

        public virtual List<TeacherCourse> TeacherCourses { get; set; }

        public virtual List<StudentBatch> StudentBatches { get; set; }
    }
}
