using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class Subgroup : BaseModel
    {
        public int SubgroupId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        [Required]
        public int GroupId { get; set; }
        public virtual Group Group { get; set; }

        public virtual List<StudentSubgroup> StudentSubgroups { get; set; }
    }
}
