namespace Domain
{
    public class StudentGuardian : BaseModel
    {
        public int? GuardianId { get; set; }
        public virtual Guardian Guardian { get; set; }

        public int? StudentId { get; set; }
        public virtual Student Student { get; set; }
    }
}
