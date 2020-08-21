using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class Phone : BaseModel
    {
        public int PhoneId { get; set; }

        [Required]
        [MaxLength(20)]
        public string Number { get; set; }

        public bool IsSmsEnabled { get; set; }
    }
}
