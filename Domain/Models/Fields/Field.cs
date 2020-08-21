using System.Collections.ObjectModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace Domain
{
    public class Field : BaseModel
    {
        public int FieldId { get; set; }

        public PersonType PersonType { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        public bool IsRequired { get; set; }

        [Required]
        public int OrderIndex { get; set; }

        public InputMethod InputMethod { get; set; }

        public ValidationType ValidationType { get; set; }

        public virtual ObservableCollection<FieldValue> DefaultValues { get; set; }
    }
}