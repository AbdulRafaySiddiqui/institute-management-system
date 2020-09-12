using System.Collections.ObjectModel;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class Group : BaseModel
    {
        public int GroupId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        public virtual ObservableCollection<Subgroup> Subgroups { get; set; } = new ObservableCollection<Subgroup>();

        [Required]
        public int BatchId { get; set; }
        public virtual Batch Batch { get; set; }
    }
}