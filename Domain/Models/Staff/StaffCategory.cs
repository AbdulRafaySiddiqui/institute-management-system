using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class StaffCategory : BaseModel
    {
        public int StaffCategoryId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        [MaxLength(100)]
        public string Prefix { get; set; }

        [Required]
        public int BranchId { get; set; }
        public Branch Branch { get; set; }
    }
}