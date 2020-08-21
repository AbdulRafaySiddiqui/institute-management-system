using System.Collections.Generic;

namespace Domain
{
    public class Student : BaseModel
    {
        public int StudentId { get; set; }

        public int AdmissionNumber { get; set; }

        public bool HasLeft { get; set; }

        public int? PhotoId { get; set; }
        public virtual Photo Photo { get; set; } = new Photo();

        public int StudentIdTypeId { get; set; }
        public virtual StudentIdType StudentIdType { get; set; }

        public virtual List<Phone> Phones { get; set; } = new List<Phone>();

        public virtual List<StudentField> StudentFields { get; set; } = new List<StudentField>();

        public virtual List<StudentBatch> StudentBatches { get; set; } = new List<StudentBatch>();

        public virtual List<StudentSubgroup> StudentSubgroups { get; set; } = new List<StudentSubgroup>();

        public virtual List<StudentGuardian> StudentGuardians { get; set; } = new List<StudentGuardian>();

        public virtual List<Discount> Discounts { get; set; } = new List<Discount>();
    }
}