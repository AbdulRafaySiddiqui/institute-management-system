using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class UserType : BaseModel
    {
        public int UserTypeId { get; set; }
        [Required]
        [MaxLength(100)]
        public string Name { get; set; }
    }
}