﻿using System;

namespace Domain
{
    public class BaseModel
    {
        //this field represents a user id in users table
        public int? CreatedBy { get; set; }
        public DateTime? DateTimeCreated { get; set; }

        //this field represents a user id in users table
        public int? ModifiedBy { get; set; }
        public DateTime? DateTimeModified { get; set; }
    }
}