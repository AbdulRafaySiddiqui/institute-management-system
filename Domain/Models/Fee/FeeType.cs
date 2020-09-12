using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class FeeType : BaseModel
    {
        public int FeeTypeId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        public bool IsIndividual { get; set; }

        public List<BatchFeeType> BatchFeeTypes { get; set; }

        [Required]
        public int BranchId { get; set; }
        public Branch Branch { get; set; }
    }
}
