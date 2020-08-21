using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class ExamGradeType : BaseModel
    {
        public int ExamGradeTypeId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        [Required]
        public GradeCalculationMethod GradeCalculationMethod { get; set; }

        public virtual List<ExamGrade> ExamGrades { get; set; }

        public int CourseId { get; set; }
        public virtual Course Course { get; set; }

        public int BatchId { get; set; }
        public virtual Batch Batch { get; set; }
    }
}
