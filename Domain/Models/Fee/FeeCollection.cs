using System;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class FeeCollection : BaseModel
    {
        public int FeeCollectionId { get; set; }

        public int ReceivedAmount { get; set; }

        public int CollectedAmount { get; set; }

        public int ReturnedAmount { get; set; }

        public DateTime DateTimeReceived { get; set; }

        public bool IsReverted { get; set; }

        [Required]
        public int FeeRecordId { get; set; }
        public virtual FeeRecord FeeRecord { get; set; }

        [Required]
        public int GuardianId { get; set; }
        public virtual Guardian Guardian { get; set; }
    }
}