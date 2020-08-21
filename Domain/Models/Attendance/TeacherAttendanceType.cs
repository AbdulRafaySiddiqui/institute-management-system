using System;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class TeacherAttendanceType : BaseModel
    {
        public int TeacherAttendanceTypeId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        public bool IsScheduled { get; set; } = true;

        public bool IsActive { get; set; } = true;

        public DateTime StartTime { get; set; }

        public DateTime EndTime { get; set; }

        public DateTime MaxMarkTime { get; set; }

        public DateTime MinMarkTime { get; set; }

        public DateTime LateMarkTime { get; set; }

        public int? TeacherId { get; set; }
        public virtual Teacher Teacher { get; set; }

        public int? TeacherRankId { get; set; }
        public virtual TeacherRank TeacherRank { get; set; }
    }
}