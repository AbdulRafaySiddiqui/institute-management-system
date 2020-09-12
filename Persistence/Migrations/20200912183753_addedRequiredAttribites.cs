using Microsoft.EntityFrameworkCore.Migrations;

namespace Persistence.Migrations
{
    public partial class addedRequiredAttribites : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ExpanseTypes_Branches_BranchId",
                table: "ExpanseTypes");

            migrationBuilder.AlterColumn<int>(
                name: "NoOfDigits",
                table: "StudentIdTypes",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "BranchId",
                table: "ExpanseTypes",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_ExpanseTypes_Branches_BranchId",
                table: "ExpanseTypes",
                column: "BranchId",
                principalTable: "Branches",
                principalColumn: "BranchId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ExpanseTypes_Branches_BranchId",
                table: "ExpanseTypes");

            migrationBuilder.AlterColumn<int>(
                name: "NoOfDigits",
                table: "StudentIdTypes",
                type: "int",
                nullable: true,
                oldClrType: typeof(int));

            migrationBuilder.AlterColumn<int>(
                name: "BranchId",
                table: "ExpanseTypes",
                type: "int",
                nullable: true,
                oldClrType: typeof(int));

            migrationBuilder.AddForeignKey(
                name: "FK_ExpanseTypes_Branches_BranchId",
                table: "ExpanseTypes",
                column: "BranchId",
                principalTable: "Branches",
                principalColumn: "BranchId",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
