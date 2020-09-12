using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class ExamGroup : BaseModel
    {
        public int ExamGroupId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        [Required]
        public int BatchId { get; set; }
        public virtual Batch Batch { get; set; }

        public int? ExamGradeTypeId { get; set; }
        public virtual ExamGradeType ExamGradeType { get; set; }
    }
}
