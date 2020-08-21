namespace Domain
{
    public class TeacherCourse : BaseModel
    {
        public int TeacherId { get; set; }
        public virtual Teacher Teacher { get; set; }

        public int? BatchId { get; set; }
        public virtual Batch Batch { get; set; }

        public int? SubgroupId { get; set; }
        public virtual Subgroup Subgroup { get; set; }

        public int CourseId { get; set; }
        public virtual Course Course { get; set; }
    }
}