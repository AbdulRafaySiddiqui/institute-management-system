using System;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class StudentAttendanceRecord : BaseModel
    {
        public int RecordId { get; set; }
        public AttendanceStatus AttendanceStatus { get; set; }
        public DateTime DateAndTimeMarked { get; set; }

        public int StudentAttendanceTypeId { get; set; }
        public virtual StudentAttendanceType StudentAttendanceType { get; set; }

        [Required]
        public int StudentId { get; set; }
        public virtual Student Student { get; set; }
    }
}
