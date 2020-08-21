using System;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class Exam : BaseModel
    {
        public int ExamId { get; set; }

        public int TotalMarks { get; set; } = 0;

        public int PassingMarks { get; set; } = 0;

        public DateTime DateTime { get; set; }

        [MaxLength(2048)]
        public string ExamDetails { get; set; }

        public int ExamTypeId { get; set; }
        public virtual ExamType ExamType { get; set; }

        public int? ExamGradeTypeId { get; set; }
        public virtual ExamGradeType ExamGradeType { get; set; }

        public int? ExamGroupId { get; set; }
        public virtual ExamGroup Group { get; set; }

        public int CourseId { get; set; }
        public virtual Course Course { get; set; }
    }
}