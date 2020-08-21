using System;
using System.Collections.ObjectModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace Domain
{
    public class Group : BaseModel
    {
        public int GroupId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        public virtual ObservableCollection<Subgroup> Subgroups { get; set; } = new ObservableCollection<Subgroup>();

        public int BatchId { get; set; }
        public virtual Batch Batch { get; set; }
    }
}