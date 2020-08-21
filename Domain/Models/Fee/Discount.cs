namespace Domain
{
    public class Discount : BaseModel
    {
        public int DiscountId { get; set; }

        public int Amount { get; set; }

        public int FeeTypeId { get; set; }
        public virtual FeeType FeeType { get; set; }

        public int StudentId { get; set; }
        public virtual Student Student { get; set; }
    }
}
