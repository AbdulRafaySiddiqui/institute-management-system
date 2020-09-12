using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class StudentField : BaseModel
    {
        public int StudentFieldId { get; set; }

        [MaxLength(100)]
        public string Value { get; set; }

        [Required]
        public int FieldId { get; set; }
        public virtual Field Field { get; set; }

        [Required]
        public int StudentId { get; set; }
    }
}
