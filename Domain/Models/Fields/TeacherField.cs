﻿using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class TeacherField : BaseModel
    {
        public int TeacherFieldId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Value { get; set; }

        [Required]
        public int FieldId { get; set; }
        public virtual Field Field { get; set; }

        [Required]
        public int TeacherId { get; set; }
    }
}
