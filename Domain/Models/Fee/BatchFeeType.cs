using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class BatchFeeType : BaseModel
    {
        public int BatchFeeTypeId { get; set; }

        public int Amount { get; set; }

        public int LateFee { get; set; }

        public int DueDay { get; set; }

        [Required]
        public int FeeTypeId { get; set; }
        public virtual FeeType FeeType { get; set; }

        [Required]
        public int BatchId { get; set; }
        public virtual Batch Batch { get; set; }
    }
}