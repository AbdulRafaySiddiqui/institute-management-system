using System;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class TeacherAttendanceRecord : BaseModel
    {
        public int RecordId { get; set; }
        public AttendanceStatus AttendanceStatus { get; set; }
        public DateTime DateAndTimeMarked { get; set; }

        public int TeacherAttendanceTypeId { get; set; }
        public virtual TeacherAttendanceType TeacherAttendanceType { get; set; }

        [Required]
        public int TeacherId { get; set; }
        public virtual Teacher Teacher { get; set; }
    }
}
