using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class Discount : BaseModel
    {
        public int DiscountId { get; set; }

        public int Amount { get; set; }

        [Required]
        public int? FeeTypeId { get; set; }
        public virtual FeeType FeeType { get; set; }

        [Required]
        public int? StudentId { get; set; }
        public virtual Student Student { get; set; }
    }
}
