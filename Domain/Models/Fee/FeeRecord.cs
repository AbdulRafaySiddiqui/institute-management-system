
namespace Domain
{
    public class FeeRecord : BaseModel
    {
        public int FeeRecordId { get; set; }
     
        public int Month { get; set; }
        
        public int Year { get; set; }

        public int Discount { get; set; } = 0;
        
        public bool IsLateFeeApplicable { get; set; }
        
        public int StudentId { get; set; }
        public virtual Student Student { get; set; }

        public int BatchFeeTypeId { get; set; }
        public virtual BatchFeeType BatchFeeType { get; set; }
    }
}