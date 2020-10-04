using Microsoft.EntityFrameworkCore.Migrations;

namespace Persistence.Migrations
{
    public partial class removedBranchIdFromGuardianType : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_GuardianTypes_Branches_BranchId",
                table: "GuardianTypes");

            migrationBuilder.DropIndex(
                name: "IX_GuardianTypes_BranchId",
                table: "GuardianTypes");

            migrationBuilder.DropColumn(
                name: "BranchId",
                table: "GuardianTypes");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "BranchId",
                table: "GuardianTypes",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_GuardianTypes_BranchId",
                table: "GuardianTypes",
                column: "BranchId");

            migrationBuilder.AddForeignKey(
                name: "FK_GuardianTypes_Branches_BranchId",
                table: "GuardianTypes",
                column: "BranchId",
                principalTable: "Branches",
                principalColumn: "BranchId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
