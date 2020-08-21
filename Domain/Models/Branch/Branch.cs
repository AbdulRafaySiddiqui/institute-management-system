using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class Branch : BaseModel
    {
        public int BranchId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }
    }
}