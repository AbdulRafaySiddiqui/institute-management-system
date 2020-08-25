using System;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class Expanse : BaseModel
    {
        public int ExpanseId { get; set; }

        [Required]
        [MaxLength(256)]
        public string Description { get; set; }

        public int Amount { get; set; } = 0;
    }
}
