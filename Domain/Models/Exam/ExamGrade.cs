using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class ExamGrade : BaseModel
    {
        public int ExamGradeId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        public int MinValue { get; set; } = 0;

        public int MaxValue { get; set; } = 0;

        [Required]
        public int ExamGradeTypeId { get; set; }
        public ExamGradeType ExamGradeType { get; set; }
    }
}
