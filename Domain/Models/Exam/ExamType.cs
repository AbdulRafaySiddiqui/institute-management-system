using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class ExamType : BaseModel
    {
        public int ExamTypeId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        public int BatchId { get; set; }
        public Batch Batch { get; set; }
    }
}
