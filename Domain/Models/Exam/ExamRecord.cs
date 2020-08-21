namespace Domain
{
    public class ExamRecord : BaseModel
    {
        public int ExamRecordId { get; set; }

        public int MarksObtained { get; set; }

        public bool HasAttended { get; set; }

        public int ExamId { get; set; }
        public virtual Exam Exam { get; set; }

        public int StudentId { get; set; }
        public virtual Student Student { get; set; }

        //public int MarksObtained {
        //    get
        //    {
        //        return MarksObtained;
        //    }
        //    set
        //    {
        //        if (value == MarksObtained) return;
        //        MarksObtained = value;
        //        Update();
        //    }
        //}
        //public int Percentage { get; set; }
        //public string Grade { get; set; }

        //public void Update()
        //{
        //    //calculate grade
        //    if (MarksObtained < Exam.PassingMarks)
        //        Grade = "Failed";
        //    if (Exam.GradeType == null)
        //        Grade = "Unknown";
        //    foreach (var grade in Exam.GradeType.Grades)
        //    {
        //        //if grade should be calculated by marks
        //        if (Exam.GradeType.GradeMethod == ExamGradeMethod.ByMark)
        //        {
        //            if (MarksObtained >= grade.MinValue && MarksObtained <= grade.MaxValue)
        //                Grade = grade.Name;
        //            break;
        //        }
        //        //if grade should be calculated by percentage
        //        else
        //        {
        //            var percentage = (MarksObtained / Exam.TotalMarks) * 100;
        //            if (percentage >= grade.MinValue && percentage <= grade.MaxValue)
        //                Grade = grade.Name;
        //            break;
        //        }
        //    }
        //    Grade = "Unknown";

        //    //calculate percentage
        //    Percentage = (MarksObtained / Exam.TotalMarks) * 100;
        //}
    }
}