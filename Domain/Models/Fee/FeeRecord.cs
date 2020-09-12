
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class FeeRecord : BaseModel
    {
        public int FeeRecordId { get; set; }

        public int Month { get; set; }

        public int Year { get; set; }

        public int Discount { get; set; } = 0;

        public bool IsLateFeeApplicable { get; set; }

        [Required]
        public int StudentId { get; set; }
        public virtual Student Student { get; set; }

        [Required]
        public int BatchFeeTypeId { get; set; }
        public virtual BatchFeeType BatchFeeType { get; set; }
    }
}