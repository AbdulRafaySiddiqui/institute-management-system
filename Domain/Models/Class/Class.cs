using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class Class : BaseModel
    {
        public int ClassId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        public virtual List<Batch> Batches { get; set; }

        public int BranchId { get; set; }
        public virtual Branch Branch { get; set; }
    }
}