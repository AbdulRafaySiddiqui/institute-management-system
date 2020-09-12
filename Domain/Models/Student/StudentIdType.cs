using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class StudentIdType : BaseModel
    {
        public int StudentIdTypeId { get; set; }

        [Required]
        [MaxLength(100)]
        public string CodeName { get; set; }

        public int NoOfDigits { get; set; }

        public string Seperator { get; set; }

        public int BranchId { get; set; }
        public virtual Branch Branch { get; set; }
    }
}
