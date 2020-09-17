using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class Group : BaseModel
    {
        public int GroupId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        public virtual List<Subgroup> Subgroups { get; set; } = new List<Subgroup>();

        [Required]
        public int BatchId { get; set; }
        public virtual Batch Batch { get; set; }
    }
}