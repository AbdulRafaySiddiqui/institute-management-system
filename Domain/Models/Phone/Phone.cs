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

        public int? StudentId { get; set; }
        public virtual Student Student { get; set; }

        public int? StaffId { get; set; }
        public virtual Staff Staff { get; set; }

        public int? GuardianId { get; set; }
        public virtual Guardian Guardian { get; set; }

        public int? TeacherId { get; set; }
        public virtual Teacher Teacher { get; set; }
    }
}