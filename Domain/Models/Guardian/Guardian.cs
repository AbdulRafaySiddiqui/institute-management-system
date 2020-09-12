using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class Guardian : BaseModel
    {
        public int GuardianId { get; set; }

        public int? PhotoId { get; set; }
        public virtual Photo Photo { get; set; } = new Photo();

        public virtual List<GuardianField> GuardianFields { get; set; }

        public virtual ObservableCollection<Phone> Phones { get; set; } = new ObservableCollection<Phone>();

        [Required]
        public int GuardianTypeId { get; set; }
        public virtual GuardianType GuardianType { get; set; }

        public List<StudentGuardian> StudentGuardians { get; set; }
    }
}
