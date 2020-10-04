using Microsoft.EntityFrameworkCore.Migrations;

namespace Persistence.Migrations
{
    public partial class addedPhoneAndPhoto : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_Photo_PhotoId",
                table: "AspNetUsers");

            migrationBuilder.DropForeignKey(
                name: "FK_Guardians_Photo_PhotoId",
                table: "Guardians");

            migrationBuilder.DropForeignKey(
                name: "FK_Phone_Guardians_GuardianId",
                table: "Phone");

            migrationBuilder.DropForeignKey(
                name: "FK_Phone_Staffs_StaffId",
                table: "Phone");

            migrationBuilder.DropForeignKey(
                name: "FK_Phone_Students_StudentId",
                table: "Phone");

            migrationBuilder.DropForeignKey(
                name: "FK_Phone_Teachers_TeacherId",
                table: "Phone");

            migrationBuilder.DropForeignKey(
                name: "FK_Staffs_Photo_PhotoId",
                table: "Staffs");

            migrationBuilder.DropForeignKey(
                name: "FK_Students_Photo_PhotoId",
                table: "Students");

            migrationBuilder.DropForeignKey(
                name: "FK_Teachers_Photo_PhotoId",
                table: "Teachers");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Photo",
                table: "Photo");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Phone",
                table: "Phone");

            migrationBuilder.RenameTable(
                name: "Photo",
                newName: "Photos");

            migrationBuilder.RenameTable(
                name: "Phone",
                newName: "Phones");

            migrationBuilder.RenameIndex(
                name: "IX_Phone_TeacherId",
                table: "Phones",
                newName: "IX_Phones_TeacherId");

            migrationBuilder.RenameIndex(
                name: "IX_Phone_StudentId",
                table: "Phones",
                newName: "IX_Phones_StudentId");

            migrationBuilder.RenameIndex(
                name: "IX_Phone_StaffId",
                table: "Phones",
                newName: "IX_Phones_StaffId");

            migrationBuilder.RenameIndex(
                name: "IX_Phone_GuardianId",
                table: "Phones",
                newName: "IX_Phones_GuardianId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Photos",
                table: "Photos",
                column: "PhotoId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Phones",
                table: "Phones",
                column: "PhoneId");

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_Photos_PhotoId",
                table: "AspNetUsers",
                column: "PhotoId",
                principalTable: "Photos",
                principalColumn: "PhotoId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Guardians_Photos_PhotoId",
                table: "Guardians",
                column: "PhotoId",
                principalTable: "Photos",
                principalColumn: "PhotoId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Phones_Guardians_GuardianId",
                table: "Phones",
                column: "GuardianId",
                principalTable: "Guardians",
                principalColumn: "GuardianId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Phones_Staffs_StaffId",
                table: "Phones",
                column: "StaffId",
                principalTable: "Staffs",
                principalColumn: "StaffId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Phones_Students_StudentId",
                table: "Phones",
                column: "StudentId",
                principalTable: "Students",
                principalColumn: "StudentId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Phones_Teachers_TeacherId",
                table: "Phones",
                column: "TeacherId",
                principalTable: "Teachers",
                principalColumn: "TeacherId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Staffs_Photos_PhotoId",
                table: "Staffs",
                column: "PhotoId",
                principalTable: "Photos",
                principalColumn: "PhotoId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Students_Photos_PhotoId",
                table: "Students",
                column: "PhotoId",
                principalTable: "Photos",
                principalColumn: "PhotoId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Teachers_Photos_PhotoId",
                table: "Teachers",
                column: "PhotoId",
                principalTable: "Photos",
                principalColumn: "PhotoId",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_Photos_PhotoId",
                table: "AspNetUsers");

            migrationBuilder.DropForeignKey(
                name: "FK_Guardians_Photos_PhotoId",
                table: "Guardians");

            migrationBuilder.DropForeignKey(
                name: "FK_Phones_Guardians_GuardianId",
                table: "Phones");

            migrationBuilder.DropForeignKey(
                name: "FK_Phones_Staffs_StaffId",
                table: "Phones");

            migrationBuilder.DropForeignKey(
                name: "FK_Phones_Students_StudentId",
                table: "Phones");

            migrationBuilder.DropForeignKey(
                name: "FK_Phones_Teachers_TeacherId",
                table: "Phones");

            migrationBuilder.DropForeignKey(
                name: "FK_Staffs_Photos_PhotoId",
                table: "Staffs");

            migrationBuilder.DropForeignKey(
                name: "FK_Students_Photos_PhotoId",
                table: "Students");

            migrationBuilder.DropForeignKey(
                name: "FK_Teachers_Photos_PhotoId",
                table: "Teachers");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Photos",
                table: "Photos");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Phones",
                table: "Phones");

            migrationBuilder.RenameTable(
                name: "Photos",
                newName: "Photo");

            migrationBuilder.RenameTable(
                name: "Phones",
                newName: "Phone");

            migrationBuilder.RenameIndex(
                name: "IX_Phones_TeacherId",
                table: "Phone",
                newName: "IX_Phone_TeacherId");

            migrationBuilder.RenameIndex(
                name: "IX_Phones_StudentId",
                table: "Phone",
                newName: "IX_Phone_StudentId");

            migrationBuilder.RenameIndex(
                name: "IX_Phones_StaffId",
                table: "Phone",
                newName: "IX_Phone_StaffId");

            migrationBuilder.RenameIndex(
                name: "IX_Phones_GuardianId",
                table: "Phone",
                newName: "IX_Phone_GuardianId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Photo",
                table: "Photo",
                column: "PhotoId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Phone",
                table: "Phone",
                column: "PhoneId");

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_Photo_PhotoId",
                table: "AspNetUsers",
                column: "PhotoId",
                principalTable: "Photo",
                principalColumn: "PhotoId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Guardians_Photo_PhotoId",
                table: "Guardians",
                column: "PhotoId",
                principalTable: "Photo",
                principalColumn: "PhotoId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Phone_Guardians_GuardianId",
                table: "Phone",
                column: "GuardianId",
                principalTable: "Guardians",
                principalColumn: "GuardianId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Phone_Staffs_StaffId",
                table: "Phone",
                column: "StaffId",
                principalTable: "Staffs",
                principalColumn: "StaffId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Phone_Students_StudentId",
                table: "Phone",
                column: "StudentId",
                principalTable: "Students",
                principalColumn: "StudentId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Phone_Teachers_TeacherId",
                table: "Phone",
                column: "TeacherId",
                principalTable: "Teachers",
                principalColumn: "TeacherId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Staffs_Photo_PhotoId",
                table: "Staffs",
                column: "PhotoId",
                principalTable: "Photo",
                principalColumn: "PhotoId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Students_Photo_PhotoId",
                table: "Students",
                column: "PhotoId",
                principalTable: "Photo",
                principalColumn: "PhotoId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Teachers_Photo_PhotoId",
                table: "Teachers",
                column: "PhotoId",
                principalTable: "Photo",
                principalColumn: "PhotoId",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
