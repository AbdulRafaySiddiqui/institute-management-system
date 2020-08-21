using System.Collections.Generic;

namespace Domain
{
    public class Staff : BaseModel
    {
        public int StaffId { get; set; }
        
        public int Salary { get; set; }

        public bool HasLeft { get; set; }

        public int? PhotoId { get; set; }
        public virtual Photo Photo { get; set; }
        
        public virtual List<TeacherField> TeacherFields { get; set; }
        
        public virtual List<Phone> Phones { get; set; }
        
        public int StaffCategoryId { get; set; }
        public virtual StaffCategory Category { get; set; }
    }
}
