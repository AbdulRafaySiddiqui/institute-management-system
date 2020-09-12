using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class StudentField : BaseModel
    {
        public int StudentFieldId { get; set; }

        [MaxLength(100)]
        public string Value { get; set; }

        public int FieldId { get; set; }
        public virtual Field Field { get; set; }

        public int StudentId { get; set; }
    }
}
