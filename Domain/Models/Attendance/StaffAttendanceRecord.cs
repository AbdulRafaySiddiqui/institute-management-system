using System;
using System.ComponentModel.DataAnnotations;

namespace Domain.Models.Attendance
{
    public class StaffAttendanceRecord : BaseModel
    {
        public int RecordId { get; set; }
        public AttendanceStatus AttendanceStatus { get; set; }
        public DateTime DateAndTimeMarked { get; set; }

        [Required]
        public int StaffAttendanceTypeId { get; set; }
        public virtual StaffAttendanceType StaffAttendanceType { get; set; }

        [Required]
        public int StaffId { get; set; }
        public virtual Staff Staff { get; set; }
    }
}
