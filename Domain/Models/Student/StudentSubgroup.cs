namespace Domain
{
    public class StudentSubgroup : BaseModel
    {
        public int? StudentId { get; set; }
        public virtual Student Student { get; set; }

        public int? SubgroupId { get; set; }
        public virtual Subgroup Subgroup { get; set; }
    }
}
