using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class FieldValue : BaseModel
    {
        public int FieldValueId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Value { get; set; }
    }
}
