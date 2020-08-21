using System;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class User
    {
        public int UserId { get; set; }
        [Required]
        [MaxLength(100)]
        public string Name { get; set; }
        [Required]
        public byte[] PasswordHash { get; set; }
        [Required]
        public byte[] Salt { get; set; }

        public int? PhotoId { get; set; }
        public virtual Photo Photo { get; set; }

        public int UserTypeId { get; set; }
        public virtual UserType UserType { get; set; }

        public int BranchId { get; set; }
        public virtual Branch Branch { get; set; }
    }
}