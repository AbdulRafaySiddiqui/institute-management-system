using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class ExpanseType : BaseModel
    {
        public int ExpanseTypeId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        public virtual Branch Branch { get; set; }
    }
}
