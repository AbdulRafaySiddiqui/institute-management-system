using System;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class StaffAttendanceType : BaseModel
    {
        public int StaffAttendanceTypeId { get; set; }

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

        public int? StaffId { get; set; }
        public virtual Staff Staff { get; set; }

        public int? StaffCategoryId { get; set; }
        public virtual StaffCategory StaffCategory { get; set; }
    }
}