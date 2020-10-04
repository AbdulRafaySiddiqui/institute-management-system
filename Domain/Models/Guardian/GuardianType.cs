using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class GuardianType : BaseModel
    {
        public int GuardianTypeId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }
    }
}
