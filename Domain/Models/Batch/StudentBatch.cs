namespace Domain
{
    public class StudentBatch : BaseModel
    {
        public int StudentId { get; set; }
        public virtual Student Student { get; set; }

        public int BatchId { get; set; }
        public virtual Batch Batch { get; set; }
    }
}
