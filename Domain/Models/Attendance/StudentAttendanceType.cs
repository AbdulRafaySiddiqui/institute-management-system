using System;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class StudentAttendanceType : BaseModel
    {
        public int StudentAttendanceTypeId { get; set; }

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

        public int? SubgroupId { get; set; }
        public virtual Subgroup Subgroup { get; set; }

        public int? BatchId { get; set; }
        public virtual Batch Batch { get; set; }
    }
}
