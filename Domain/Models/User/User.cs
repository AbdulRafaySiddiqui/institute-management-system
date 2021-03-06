﻿using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;

namespace Domain
{
    public class User : IdentityUser
    {
        [MaxLength(100)]
        public string Name { get; set; }

        public int? PhotoId { get; set; }
        public virtual Photo Photo { get; set; }

        public int? UserTypeId { get; set; }
        public virtual UserType UserType { get; set; }

        public int? BranchId { get; set; }
        public virtual Branch Branch { get; set; }
    }
}