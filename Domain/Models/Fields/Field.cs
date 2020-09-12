using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class Field : BaseModel
    {
        public int FieldId { get; set; }

        [Required]
        public PersonType PersonType { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        public bool IsRequired { get; set; }

        [Required]
        public int OrderIndex { get; set; }

        [Required]
        public InputMethod InputMethod { get; set; }

        [Required]
        public ValidationType ValidationType { get; set; }

        public virtual List<FieldValue> DefaultValues { get; set; }
    }
}