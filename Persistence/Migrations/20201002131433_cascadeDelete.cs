using Microsoft.EntityFrameworkCore.Migrations;

namespace Persistence.Migrations
{
    public partial class cascadeDelete : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_BatchFeeTypes_FeeTypes_FeeTypeId",
                table: "BatchFeeTypes");

            migrationBuilder.DropForeignKey(
                name: "FK_ExamGradeTypes_Courses_CourseId",
                table: "ExamGradeTypes");

            migrationBuilder.DropForeignKey(
                name: "FK_Exams_ExamTypes_ExamTypeId",
                table: "Exams");

            migrationBuilder.DropForeignKey(
                name: "FK_FeeCollections_Guardians_GuardianId",
                table: "FeeCollections");

            migrationBuilder.DropForeignKey(
                name: "FK_StudentBatch_Batches_BatchId",
                table: "StudentBatch");

            migrationBuilder.DropForeignKey(
                name: "FK_StudentBatch_Students_StudentId",
                table: "StudentBatch");

            migrationBuilder.DropForeignKey(
                name: "FK_StudentGuardian_Students_StudentId",
                table: "StudentGuardian");

            migrationBuilder.DropForeignKey(
                name: "FK_StudentIdTypes_Branches_BranchId",
                table: "StudentIdTypes");

            migrationBuilder.DropForeignKey(
                name: "FK_StudentSubgroup_Students_StudentId",
                table: "StudentSubgroup");

            migrationBuilder.DropForeignKey(
                name: "FK_StudentSubgroup_Subgroups_SubgroupId",
                table: "StudentSubgroup");

            migrationBuilder.DropForeignKey(
                name: "FK_Subgroups_Groups_GroupId",
                table: "Subgroups");

            migrationBuilder.DropForeignKey(
                name: "FK_TeacherCourse_Courses_CourseId",
                table: "TeacherCourse");

            migrationBuilder.DropForeignKey(
                name: "FK_TeacherCourse_Teachers_TeacherId",
                table: "TeacherCourse");

            migrationBuilder.AddForeignKey(
                name: "FK_BatchFeeTypes_FeeTypes_FeeTypeId",
                table: "BatchFeeTypes",
                column: "FeeTypeId",
                principalTable: "FeeTypes",
                principalColumn: "FeeTypeId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_ExamGradeTypes_Courses_CourseId",
                table: "ExamGradeTypes",
                column: "CourseId",
                principalTable: "Courses",
                principalColumn: "CourseId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Exams_ExamTypes_ExamTypeId",
                table: "Exams",
                column: "ExamTypeId",
                principalTable: "ExamTypes",
                principalColumn: "ExamTypeId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_FeeCollections_Guardians_GuardianId",
                table: "FeeCollections",
                column: "GuardianId",
                principalTable: "Guardians",
                principalColumn: "GuardianId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_StudentBatch_Batches_BatchId",
                table: "StudentBatch",
                column: "BatchId",
                principalTable: "Batches",
                principalColumn: "BatchId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_StudentBatch_Students_StudentId",
                table: "StudentBatch",
                column: "StudentId",
                principalTable: "Students",
                principalColumn: "StudentId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_StudentGuardian_Students_StudentId",
                table: "StudentGuardian",
                column: "StudentId",
                principalTable: "Students",
                principalColumn: "StudentId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_StudentIdTypes_Branches_BranchId",
                table: "StudentIdTypes",
                column: "BranchId",
                principalTable: "Branches",
                principalColumn: "BranchId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_StudentSubgroup_Students_StudentId",
                table: "StudentSubgroup",
                column: "StudentId",
                principalTable: "Students",
                principalColumn: "StudentId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_StudentSubgroup_Subgroups_SubgroupId",
                table: "StudentSubgroup",
                column: "SubgroupId",
                principalTable: "Subgroups",
                principalColumn: "SubgroupId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Subgroups_Groups_GroupId",
                table: "Subgroups",
                column: "GroupId",
                principalTable: "Groups",
                principalColumn: "GroupId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_TeacherCourse_Courses_CourseId",
                table: "TeacherCourse",
                column: "CourseId",
                principalTable: "Courses",
                principalColumn: "CourseId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_TeacherCourse_Teachers_TeacherId",
                table: "TeacherCourse",
                column: "TeacherId",
                principalTable: "Teachers",
                principalColumn: "TeacherId",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_BatchFeeTypes_FeeTypes_FeeTypeId",
                table: "BatchFeeTypes");

            migrationBuilder.DropForeignKey(
                name: "FK_ExamGradeTypes_Courses_CourseId",
                table: "ExamGradeTypes");

            migrationBuilder.DropForeignKey(
                name: "FK_Exams_ExamTypes_ExamTypeId",
                table: "Exams");

            migrationBuilder.DropForeignKey(
                name: "FK_FeeCollections_Guardians_GuardianId",
                table: "FeeCollections");

            migrationBuilder.DropForeignKey(
                name: "FK_StudentBatch_Batches_BatchId",
                table: "StudentBatch");

            migrationBuilder.DropForeignKey(
                name: "FK_StudentBatch_Students_StudentId",
                table: "StudentBatch");

            migrationBuilder.DropForeignKey(
                name: "FK_StudentGuardian_Students_StudentId",
                table: "StudentGuardian");

            migrationBuilder.DropForeignKey(
                name: "FK_StudentIdTypes_Branches_BranchId",
                table: "StudentIdTypes");

            migrationBuilder.DropForeignKey(
                name: "FK_StudentSubgroup_Students_StudentId",
                table: "StudentSubgroup");

            migrationBuilder.DropForeignKey(
                name: "FK_StudentSubgroup_Subgroups_SubgroupId",
                table: "StudentSubgroup");

            migrationBuilder.DropForeignKey(
                name: "FK_Subgroups_Groups_GroupId",
                table: "Subgroups");

            migrationBuilder.DropForeignKey(
                name: "FK_TeacherCourse_Courses_CourseId",
                table: "TeacherCourse");

            migrationBuilder.DropForeignKey(
                name: "FK_TeacherCourse_Teachers_TeacherId",
                table: "TeacherCourse");

            migrationBuilder.AddForeignKey(
                name: "FK_BatchFeeTypes_FeeTypes_FeeTypeId",
                table: "BatchFeeTypes",
                column: "FeeTypeId",
                principalTable: "FeeTypes",
                principalColumn: "FeeTypeId");

            migrationBuilder.AddForeignKey(
                name: "FK_ExamGradeTypes_Courses_CourseId",
                table: "ExamGradeTypes",
                column: "CourseId",
                principalTable: "Courses",
                principalColumn: "CourseId");

            migrationBuilder.AddForeignKey(
                name: "FK_Exams_ExamTypes_ExamTypeId",
                table: "Exams",
                column: "ExamTypeId",
                principalTable: "ExamTypes",
                principalColumn: "ExamTypeId");

            migrationBuilder.AddForeignKey(
                name: "FK_FeeCollections_Guardians_GuardianId",
                table: "FeeCollections",
                column: "GuardianId",
                principalTable: "Guardians",
                principalColumn: "GuardianId");

            migrationBuilder.AddForeignKey(
                name: "FK_StudentBatch_Batches_BatchId",
                table: "StudentBatch",
                column: "BatchId",
                principalTable: "Batches",
                principalColumn: "BatchId");

            migrationBuilder.AddForeignKey(
                name: "FK_StudentBatch_Students_StudentId",
                table: "StudentBatch",
                column: "StudentId",
                principalTable: "Students",
                principalColumn: "StudentId");

            migrationBuilder.AddForeignKey(
                name: "FK_StudentGuardian_Students_StudentId",
                table: "StudentGuardian",
                column: "StudentId",
                principalTable: "Students",
                principalColumn: "StudentId");

            migrationBuilder.AddForeignKey(
                name: "FK_StudentIdTypes_Branches_BranchId",
                table: "StudentIdTypes",
                column: "BranchId",
                principalTable: "Branches",
                principalColumn: "BranchId");

            migrationBuilder.AddForeignKey(
                name: "FK_StudentSubgroup_Students_StudentId",
                table: "StudentSubgroup",
                column: "StudentId",
                principalTable: "Students",
                principalColumn: "StudentId");

            migrationBuilder.AddForeignKey(
                name: "FK_StudentSubgroup_Subgroups_SubgroupId",
                table: "StudentSubgroup",
                column: "SubgroupId",
                principalTable: "Subgroups",
                principalColumn: "SubgroupId");

            migrationBuilder.AddForeignKey(
                name: "FK_Subgroups_Groups_GroupId",
                table: "Subgroups",
                column: "GroupId",
                principalTable: "Groups",
                principalColumn: "GroupId");

            migrationBuilder.AddForeignKey(
                name: "FK_TeacherCourse_Courses_CourseId",
                table: "TeacherCourse",
                column: "CourseId",
                principalTable: "Courses",
                principalColumn: "CourseId");

            migrationBuilder.AddForeignKey(
                name: "FK_TeacherCourse_Teachers_TeacherId",
                table: "TeacherCourse",
                column: "TeacherId",
                principalTable: "Teachers",
                principalColumn: "TeacherId");
        }
    }
}
