using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace Domain
{
    public class ExamGroupRecord : BaseModel
    {
        [Required]
        public int ExamGroupId { get; set; }
        public ExamGroup Group { get; set; }
        public List<ExamRecord> ExamRecords { get; set; }
        public string Grade { get; set; }
        public bool IsFailed { get; set; }
        public int Percentage { get; set; }
        public int GrandTotalMarks { get => ExamRecords.Sum(i => i.Exam.TotalMarks); }
        public int TotalMarksObtained { get => ExamRecords.Sum(i => i.MarksObtained); }

        //public void Update()
        //{
        //    var grandTotalMarks = GrandTotalMarks;
        //    var totalMarksObtained = TotalMarksObtained;
        //    //calculate grade
        //    if (ExamRecords.Where(record => record.MarksObtained < record.Exam.PassingMarks).Count() > 0)
        //        Grade = "Failed";
        //    if (Group.GradeType == null)
        //        Grade = "Unknown";
        //    foreach (var grade in Group.GradeType.Grades)
        //    {
        //        //if grade should be calculated by marks
        //        if (Group.GradeType.GradeMethod == ExamGradeMethod.ByMark)
        //        {
        //            if (TotalMarksObtained >= grade.MinValue && TotalMarksObtained <= grade.MaxValue)
        //                Grade = grade.Name;
        //            break;
        //        }
        //        //if grade should be calculated by percentage
        //        else
        //        {
        //            var percentage = (TotalMarksObtained / GrandTotalMarks) * 100;
        //            if (percentage >= grade.MinValue && percentage <= grade.MaxValue)
        //                Grade = grade.Name;
        //            break;
        //        }
        //    }
        //    Grade = "Unknown";

        //    //calculate percentage
        //    Percentage = (totalMarksObtained / grandTotalMarks) * 100;
        //}
    }
}
