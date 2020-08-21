using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class Setting : BaseModel
    {
        [Required]
        [MaxLength(256)]
        public string SettingName { get; set; }

        [Required]
        public int BranchId { get; set; }
        public virtual Branch Branch { get; set; }

        [Required]
        [MaxLength(256)]
        public string Value { get; set; }
    }
}
