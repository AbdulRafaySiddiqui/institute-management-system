using Microsoft.EntityFrameworkCore.Migrations;

namespace Persistence.Migrations
{
    public partial class cascade3 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Phones_Guardians_GuardianId",
                table: "Phones");

            migrationBuilder.DropForeignKey(
                name: "FK_Phones_Staffs_StaffId",
                table: "Phones");

            migrationBuilder.AddForeignKey(
                name: "FK_Phones_Guardians_GuardianId",
                table: "Phones",
                column: "GuardianId",
                principalTable: "Guardians",
                principalColumn: "GuardianId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Phones_Staffs_StaffId",
                table: "Phones",
                column: "StaffId",
                principalTable: "Staffs",
                principalColumn: "StaffId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Phones_Guardians_GuardianId",
                table: "Phones");

            migrationBuilder.DropForeignKey(
                name: "FK_Phones_Staffs_StaffId",
                table: "Phones");

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
        }
    }
}
