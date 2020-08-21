using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class TeacherRank : BaseModel
    {
        public int TeacherRankId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        [Required]
        [MaxLength(50)]
        public string Prefix { get; set; }

        public int BranchId { get; set; }
        public Branch Branch { get; set; }
    }
}
