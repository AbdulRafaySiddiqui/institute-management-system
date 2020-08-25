using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Persistence.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AspNetRoles",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    Name = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedName = table.Column<string>(maxLength: 256, nullable: true),
                    ConcurrencyStamp = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Branches",
                columns: table => new
                {
                    BranchId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Branches", x => x.BranchId);
                });

            migrationBuilder.CreateTable(
                name: "Expanses",
                columns: table => new
                {
                    ExpanseId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Description = table.Column<string>(maxLength: 256, nullable: false),
                    Amount = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Expanses", x => x.ExpanseId);
                });

            migrationBuilder.CreateTable(
                name: "Fields",
                columns: table => new
                {
                    FieldId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    PersonType = table.Column<int>(nullable: false),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    IsRequired = table.Column<bool>(nullable: false),
                    OrderIndex = table.Column<int>(nullable: false),
                    InputMethod = table.Column<int>(nullable: false),
                    ValidationType = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Fields", x => x.FieldId);
                });

            migrationBuilder.CreateTable(
                name: "Photo",
                columns: table => new
                {
                    PhotoId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Data = table.Column<byte[]>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Photo", x => x.PhotoId);
                });

            migrationBuilder.CreateTable(
                name: "UserTypes",
                columns: table => new
                {
                    UserTypeId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserTypes", x => x.UserTypeId);
                });

            migrationBuilder.CreateTable(
                name: "AspNetRoleClaims",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleId = table.Column<string>(nullable: false),
                    ClaimType = table.Column<string>(nullable: true),
                    ClaimValue = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoleClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetRoleClaims_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Classes",
                columns: table => new
                {
                    ClassId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    BranchId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Classes", x => x.ClassId);
                    table.ForeignKey(
                        name: "FK_Classes_Branches_BranchId",
                        column: x => x.BranchId,
                        principalTable: "Branches",
                        principalColumn: "BranchId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ExpanseTypes",
                columns: table => new
                {
                    ExpanseTypeId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    BranchId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ExpanseTypes", x => x.ExpanseTypeId);
                    table.ForeignKey(
                        name: "FK_ExpanseTypes_Branches_BranchId",
                        column: x => x.BranchId,
                        principalTable: "Branches",
                        principalColumn: "BranchId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "FeeTypes",
                columns: table => new
                {
                    FeeTypeId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    IsIndividual = table.Column<bool>(nullable: false),
                    BranchId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FeeTypes", x => x.FeeTypeId);
                    table.ForeignKey(
                        name: "FK_FeeTypes_Branches_BranchId",
                        column: x => x.BranchId,
                        principalTable: "Branches",
                        principalColumn: "BranchId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "GuardianTypes",
                columns: table => new
                {
                    GuardianTypeId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    BranchId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_GuardianTypes", x => x.GuardianTypeId);
                    table.ForeignKey(
                        name: "FK_GuardianTypes_Branches_BranchId",
                        column: x => x.BranchId,
                        principalTable: "Branches",
                        principalColumn: "BranchId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Settings",
                columns: table => new
                {
                    SettingName = table.Column<string>(maxLength: 256, nullable: false),
                    BranchId = table.Column<int>(nullable: false),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Value = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Settings", x => new { x.BranchId, x.SettingName });
                    table.ForeignKey(
                        name: "FK_Settings_Branches_BranchId",
                        column: x => x.BranchId,
                        principalTable: "Branches",
                        principalColumn: "BranchId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "StaffCategory",
                columns: table => new
                {
                    StaffCategoryId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    Prefix = table.Column<string>(maxLength: 100, nullable: true),
                    BranchId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StaffCategory", x => x.StaffCategoryId);
                    table.ForeignKey(
                        name: "FK_StaffCategory_Branches_BranchId",
                        column: x => x.BranchId,
                        principalTable: "Branches",
                        principalColumn: "BranchId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "StudentIdTypes",
                columns: table => new
                {
                    StudentIdTypeId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    CodeName = table.Column<string>(maxLength: 100, nullable: false),
                    NoOfDigits = table.Column<int>(nullable: true),
                    Seperator = table.Column<string>(nullable: true),
                    BranchId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StudentIdTypes", x => x.StudentIdTypeId);
                    table.ForeignKey(
                        name: "FK_StudentIdTypes_Branches_BranchId",
                        column: x => x.BranchId,
                        principalTable: "Branches",
                        principalColumn: "BranchId");
                });

            migrationBuilder.CreateTable(
                name: "TeacherRank",
                columns: table => new
                {
                    TeacherRankId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    Prefix = table.Column<string>(maxLength: 50, nullable: false),
                    BranchId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TeacherRank", x => x.TeacherRankId);
                    table.ForeignKey(
                        name: "FK_TeacherRank_Branches_BranchId",
                        column: x => x.BranchId,
                        principalTable: "Branches",
                        principalColumn: "BranchId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "FieldValues",
                columns: table => new
                {
                    FieldValueId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Value = table.Column<string>(maxLength: 100, nullable: false),
                    FieldId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FieldValues", x => x.FieldValueId);
                    table.ForeignKey(
                        name: "FK_FieldValues_Fields_FieldId",
                        column: x => x.FieldId,
                        principalTable: "Fields",
                        principalColumn: "FieldId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "StaffFields",
                columns: table => new
                {
                    StaffFieldId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Value = table.Column<string>(maxLength: 100, nullable: false),
                    FieldId = table.Column<int>(nullable: false),
                    StaffId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StaffFields", x => x.StaffFieldId);
                    table.ForeignKey(
                        name: "FK_StaffFields_Fields_FieldId",
                        column: x => x.FieldId,
                        principalTable: "Fields",
                        principalColumn: "FieldId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUsers",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    UserName = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedUserName = table.Column<string>(maxLength: 256, nullable: true),
                    Email = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedEmail = table.Column<string>(maxLength: 256, nullable: true),
                    EmailConfirmed = table.Column<bool>(nullable: false),
                    PasswordHash = table.Column<string>(nullable: true),
                    SecurityStamp = table.Column<string>(nullable: true),
                    ConcurrencyStamp = table.Column<string>(nullable: true),
                    PhoneNumber = table.Column<string>(nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(nullable: false),
                    TwoFactorEnabled = table.Column<bool>(nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(nullable: true),
                    LockoutEnabled = table.Column<bool>(nullable: false),
                    AccessFailedCount = table.Column<int>(nullable: false),
                    Name = table.Column<string>(maxLength: 100, nullable: true),
                    PhotoId = table.Column<int>(nullable: true),
                    UserTypeId = table.Column<int>(nullable: true),
                    BranchId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUsers", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetUsers_Branches_BranchId",
                        column: x => x.BranchId,
                        principalTable: "Branches",
                        principalColumn: "BranchId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_AspNetUsers_Photo_PhotoId",
                        column: x => x.PhotoId,
                        principalTable: "Photo",
                        principalColumn: "PhotoId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_AspNetUsers_UserTypes_UserTypeId",
                        column: x => x.UserTypeId,
                        principalTable: "UserTypes",
                        principalColumn: "UserTypeId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Batches",
                columns: table => new
                {
                    BatchId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    StartDate = table.Column<DateTime>(nullable: false),
                    EndDate = table.Column<DateTime>(nullable: false),
                    IsActive = table.Column<bool>(nullable: false),
                    ClassId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Batches", x => x.BatchId);
                    table.ForeignKey(
                        name: "FK_Batches_Classes_ClassId",
                        column: x => x.ClassId,
                        principalTable: "Classes",
                        principalColumn: "ClassId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Courses",
                columns: table => new
                {
                    CourseId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    ClassId = table.Column<int>(nullable: false),
                    ShortName = table.Column<string>(maxLength: 50, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Courses", x => x.CourseId);
                    table.ForeignKey(
                        name: "FK_Courses_Classes_ClassId",
                        column: x => x.ClassId,
                        principalTable: "Classes",
                        principalColumn: "ClassId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Guardians",
                columns: table => new
                {
                    GuardianId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    PhotoId = table.Column<int>(nullable: true),
                    GuardianTypeId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Guardians", x => x.GuardianId);
                    table.ForeignKey(
                        name: "FK_Guardians_GuardianTypes_GuardianTypeId",
                        column: x => x.GuardianTypeId,
                        principalTable: "GuardianTypes",
                        principalColumn: "GuardianTypeId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Guardians_Photo_PhotoId",
                        column: x => x.PhotoId,
                        principalTable: "Photo",
                        principalColumn: "PhotoId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Staffs",
                columns: table => new
                {
                    StaffId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Salary = table.Column<int>(nullable: false),
                    HasLeft = table.Column<bool>(nullable: false),
                    PhotoId = table.Column<int>(nullable: true),
                    StaffCategoryId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Staffs", x => x.StaffId);
                    table.ForeignKey(
                        name: "FK_Staffs_Photo_PhotoId",
                        column: x => x.PhotoId,
                        principalTable: "Photo",
                        principalColumn: "PhotoId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Staffs_StaffCategory_StaffCategoryId",
                        column: x => x.StaffCategoryId,
                        principalTable: "StaffCategory",
                        principalColumn: "StaffCategoryId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Students",
                columns: table => new
                {
                    StudentId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    AdmissionNumber = table.Column<int>(nullable: false),
                    HasLeft = table.Column<bool>(nullable: false),
                    PhotoId = table.Column<int>(nullable: true),
                    StudentIdTypeId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Students", x => x.StudentId);
                    table.ForeignKey(
                        name: "FK_Students_Photo_PhotoId",
                        column: x => x.PhotoId,
                        principalTable: "Photo",
                        principalColumn: "PhotoId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Students_StudentIdTypes_StudentIdTypeId",
                        column: x => x.StudentIdTypeId,
                        principalTable: "StudentIdTypes",
                        principalColumn: "StudentIdTypeId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Teachers",
                columns: table => new
                {
                    TeacherId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Salary = table.Column<int>(nullable: false),
                    HasLeft = table.Column<bool>(nullable: false),
                    PhotoId = table.Column<int>(nullable: true),
                    TeacherRankId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Teachers", x => x.TeacherId);
                    table.ForeignKey(
                        name: "FK_Teachers_Photo_PhotoId",
                        column: x => x.PhotoId,
                        principalTable: "Photo",
                        principalColumn: "PhotoId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Teachers_TeacherRank_TeacherRankId",
                        column: x => x.TeacherRankId,
                        principalTable: "TeacherRank",
                        principalColumn: "TeacherRankId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserClaims",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<string>(nullable: false),
                    ClaimType = table.Column<string>(nullable: true),
                    ClaimValue = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetUserClaims_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserLogins",
                columns: table => new
                {
                    LoginProvider = table.Column<string>(nullable: false),
                    ProviderKey = table.Column<string>(nullable: false),
                    ProviderDisplayName = table.Column<string>(nullable: true),
                    UserId = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserLogins", x => new { x.LoginProvider, x.ProviderKey });
                    table.ForeignKey(
                        name: "FK_AspNetUserLogins_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserRoles",
                columns: table => new
                {
                    UserId = table.Column<string>(nullable: false),
                    RoleId = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserRoles", x => new { x.UserId, x.RoleId });
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserTokens",
                columns: table => new
                {
                    UserId = table.Column<string>(nullable: false),
                    LoginProvider = table.Column<string>(nullable: false),
                    Name = table.Column<string>(nullable: false),
                    Value = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserTokens", x => new { x.UserId, x.LoginProvider, x.Name });
                    table.ForeignKey(
                        name: "FK_AspNetUserTokens_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "BatchFeeTypes",
                columns: table => new
                {
                    BatchFeeTypeId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Amount = table.Column<int>(nullable: false),
                    LateFee = table.Column<int>(nullable: false),
                    Discount = table.Column<int>(nullable: false),
                    DueDay = table.Column<int>(nullable: false),
                    FeeTypeId = table.Column<int>(nullable: false),
                    BatchId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BatchFeeTypes", x => x.BatchFeeTypeId);
                    table.ForeignKey(
                        name: "FK_BatchFeeTypes_Batches_BatchId",
                        column: x => x.BatchId,
                        principalTable: "Batches",
                        principalColumn: "BatchId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_BatchFeeTypes_FeeTypes_FeeTypeId",
                        column: x => x.FeeTypeId,
                        principalTable: "FeeTypes",
                        principalColumn: "FeeTypeId");
                });

            migrationBuilder.CreateTable(
                name: "ExamTypes",
                columns: table => new
                {
                    ExamTypeId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    BatchId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ExamTypes", x => x.ExamTypeId);
                    table.ForeignKey(
                        name: "FK_ExamTypes_Batches_BatchId",
                        column: x => x.BatchId,
                        principalTable: "Batches",
                        principalColumn: "BatchId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Groups",
                columns: table => new
                {
                    GroupId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    BatchId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Groups", x => x.GroupId);
                    table.ForeignKey(
                        name: "FK_Groups_Batches_BatchId",
                        column: x => x.BatchId,
                        principalTable: "Batches",
                        principalColumn: "BatchId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ExamGradeTypes",
                columns: table => new
                {
                    ExamGradeTypeId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    GradeCalculationMethod = table.Column<int>(nullable: false),
                    CourseId = table.Column<int>(nullable: false),
                    BatchId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ExamGradeTypes", x => x.ExamGradeTypeId);
                    table.ForeignKey(
                        name: "FK_ExamGradeTypes_Batches_BatchId",
                        column: x => x.BatchId,
                        principalTable: "Batches",
                        principalColumn: "BatchId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ExamGradeTypes_Courses_CourseId",
                        column: x => x.CourseId,
                        principalTable: "Courses",
                        principalColumn: "CourseId");
                });

            migrationBuilder.CreateTable(
                name: "GuardianFields",
                columns: table => new
                {
                    GuardianFieldId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Value = table.Column<string>(maxLength: 100, nullable: false),
                    FieldId = table.Column<int>(nullable: false),
                    GuardianId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_GuardianFields", x => x.GuardianFieldId);
                    table.ForeignKey(
                        name: "FK_GuardianFields_Fields_FieldId",
                        column: x => x.FieldId,
                        principalTable: "Fields",
                        principalColumn: "FieldId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_GuardianFields_Guardians_GuardianId",
                        column: x => x.GuardianId,
                        principalTable: "Guardians",
                        principalColumn: "GuardianId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "StaffAttendanceTypes",
                columns: table => new
                {
                    StaffAttendanceTypeId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    IsScheduled = table.Column<bool>(nullable: false),
                    IsActive = table.Column<bool>(nullable: false),
                    StartTime = table.Column<DateTime>(nullable: false),
                    EndTime = table.Column<DateTime>(nullable: false),
                    MaxMarkTime = table.Column<DateTime>(nullable: false),
                    MinMarkTime = table.Column<DateTime>(nullable: false),
                    LateMarkTime = table.Column<DateTime>(nullable: false),
                    StaffId = table.Column<int>(nullable: true),
                    StaffCategoryId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StaffAttendanceTypes", x => x.StaffAttendanceTypeId);
                    table.ForeignKey(
                        name: "FK_StaffAttendanceTypes_StaffCategory_StaffCategoryId",
                        column: x => x.StaffCategoryId,
                        principalTable: "StaffCategory",
                        principalColumn: "StaffCategoryId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_StaffAttendanceTypes_Staffs_StaffId",
                        column: x => x.StaffId,
                        principalTable: "Staffs",
                        principalColumn: "StaffId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Discount",
                columns: table => new
                {
                    DiscountId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Amount = table.Column<int>(nullable: false),
                    FeeTypeId = table.Column<int>(nullable: false),
                    StudentId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Discount", x => x.DiscountId);
                    table.ForeignKey(
                        name: "FK_Discount_FeeTypes_FeeTypeId",
                        column: x => x.FeeTypeId,
                        principalTable: "FeeTypes",
                        principalColumn: "FeeTypeId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Discount_Students_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Students",
                        principalColumn: "StudentId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "StudentBatch",
                columns: table => new
                {
                    StudentId = table.Column<int>(nullable: false),
                    BatchId = table.Column<int>(nullable: false),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StudentBatch", x => new { x.StudentId, x.BatchId });
                    table.ForeignKey(
                        name: "FK_StudentBatch_Batches_BatchId",
                        column: x => x.BatchId,
                        principalTable: "Batches",
                        principalColumn: "BatchId");
                    table.ForeignKey(
                        name: "FK_StudentBatch_Students_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Students",
                        principalColumn: "StudentId");
                });

            migrationBuilder.CreateTable(
                name: "StudentFields",
                columns: table => new
                {
                    StudentFieldId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Value = table.Column<string>(maxLength: 100, nullable: true),
                    FieldId = table.Column<int>(nullable: false),
                    StudentId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StudentFields", x => x.StudentFieldId);
                    table.ForeignKey(
                        name: "FK_StudentFields_Fields_FieldId",
                        column: x => x.FieldId,
                        principalTable: "Fields",
                        principalColumn: "FieldId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_StudentFields_Students_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Students",
                        principalColumn: "StudentId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "StudentGuardian",
                columns: table => new
                {
                    GuardianId = table.Column<int>(nullable: false),
                    StudentId = table.Column<int>(nullable: false),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StudentGuardian", x => new { x.GuardianId, x.StudentId });
                    table.ForeignKey(
                        name: "FK_StudentGuardian_Guardians_GuardianId",
                        column: x => x.GuardianId,
                        principalTable: "Guardians",
                        principalColumn: "GuardianId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_StudentGuardian_Students_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Students",
                        principalColumn: "StudentId");
                });

            migrationBuilder.CreateTable(
                name: "Phone",
                columns: table => new
                {
                    PhoneId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Number = table.Column<string>(maxLength: 20, nullable: false),
                    IsSmsEnabled = table.Column<bool>(nullable: false),
                    GuardianId = table.Column<int>(nullable: true),
                    StaffId = table.Column<int>(nullable: true),
                    StudentId = table.Column<int>(nullable: true),
                    TeacherId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Phone", x => x.PhoneId);
                    table.ForeignKey(
                        name: "FK_Phone_Guardians_GuardianId",
                        column: x => x.GuardianId,
                        principalTable: "Guardians",
                        principalColumn: "GuardianId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Phone_Staffs_StaffId",
                        column: x => x.StaffId,
                        principalTable: "Staffs",
                        principalColumn: "StaffId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Phone_Students_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Students",
                        principalColumn: "StudentId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Phone_Teachers_TeacherId",
                        column: x => x.TeacherId,
                        principalTable: "Teachers",
                        principalColumn: "TeacherId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "TeacherAttendanceTypes",
                columns: table => new
                {
                    TeacherAttendanceTypeId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    IsScheduled = table.Column<bool>(nullable: false),
                    IsActive = table.Column<bool>(nullable: false),
                    StartTime = table.Column<DateTime>(nullable: false),
                    EndTime = table.Column<DateTime>(nullable: false),
                    MaxMarkTime = table.Column<DateTime>(nullable: false),
                    MinMarkTime = table.Column<DateTime>(nullable: false),
                    LateMarkTime = table.Column<DateTime>(nullable: false),
                    TeacherId = table.Column<int>(nullable: true),
                    TeacherRankId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TeacherAttendanceTypes", x => x.TeacherAttendanceTypeId);
                    table.ForeignKey(
                        name: "FK_TeacherAttendanceTypes_Teachers_TeacherId",
                        column: x => x.TeacherId,
                        principalTable: "Teachers",
                        principalColumn: "TeacherId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_TeacherAttendanceTypes_TeacherRank_TeacherRankId",
                        column: x => x.TeacherRankId,
                        principalTable: "TeacherRank",
                        principalColumn: "TeacherRankId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "TeacherFields",
                columns: table => new
                {
                    TeacherFieldId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Value = table.Column<string>(maxLength: 100, nullable: false),
                    FieldId = table.Column<int>(nullable: false),
                    TeacherId = table.Column<int>(nullable: false),
                    StaffId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TeacherFields", x => x.TeacherFieldId);
                    table.ForeignKey(
                        name: "FK_TeacherFields_Fields_FieldId",
                        column: x => x.FieldId,
                        principalTable: "Fields",
                        principalColumn: "FieldId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_TeacherFields_Staffs_StaffId",
                        column: x => x.StaffId,
                        principalTable: "Staffs",
                        principalColumn: "StaffId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_TeacherFields_Teachers_TeacherId",
                        column: x => x.TeacherId,
                        principalTable: "Teachers",
                        principalColumn: "TeacherId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "FeeRecords",
                columns: table => new
                {
                    FeeRecordId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Month = table.Column<int>(nullable: false),
                    Year = table.Column<int>(nullable: false),
                    Discount = table.Column<int>(nullable: false),
                    IsLateFeeApplicable = table.Column<bool>(nullable: false),
                    StudentId = table.Column<int>(nullable: false),
                    BatchFeeTypeId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FeeRecords", x => x.FeeRecordId);
                    table.ForeignKey(
                        name: "FK_FeeRecords_BatchFeeTypes_BatchFeeTypeId",
                        column: x => x.BatchFeeTypeId,
                        principalTable: "BatchFeeTypes",
                        principalColumn: "BatchFeeTypeId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_FeeRecords_Students_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Students",
                        principalColumn: "StudentId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Subgroups",
                columns: table => new
                {
                    SubgroupId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    GroupId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Subgroups", x => x.SubgroupId);
                    table.ForeignKey(
                        name: "FK_Subgroups_Groups_GroupId",
                        column: x => x.GroupId,
                        principalTable: "Groups",
                        principalColumn: "GroupId");
                });

            migrationBuilder.CreateTable(
                name: "ExamGrade",
                columns: table => new
                {
                    ExamGradeId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    MinValue = table.Column<int>(nullable: false),
                    MaxValue = table.Column<int>(nullable: false),
                    ExamGradeTypeId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ExamGrade", x => x.ExamGradeId);
                    table.ForeignKey(
                        name: "FK_ExamGrade_ExamGradeTypes_ExamGradeTypeId",
                        column: x => x.ExamGradeTypeId,
                        principalTable: "ExamGradeTypes",
                        principalColumn: "ExamGradeTypeId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ExamGroup",
                columns: table => new
                {
                    ExamGroupId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    BatchId = table.Column<int>(nullable: false),
                    ExamGradeTypeId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ExamGroup", x => x.ExamGroupId);
                    table.ForeignKey(
                        name: "FK_ExamGroup_Batches_BatchId",
                        column: x => x.BatchId,
                        principalTable: "Batches",
                        principalColumn: "BatchId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ExamGroup_ExamGradeTypes_ExamGradeTypeId",
                        column: x => x.ExamGradeTypeId,
                        principalTable: "ExamGradeTypes",
                        principalColumn: "ExamGradeTypeId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "FeeCollections",
                columns: table => new
                {
                    FeeCollectionId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    ReceivedAmount = table.Column<int>(nullable: false),
                    CollectedAmount = table.Column<int>(nullable: false),
                    ReturnedAmount = table.Column<int>(nullable: false),
                    DateTimeReceived = table.Column<DateTime>(nullable: false),
                    IsReverted = table.Column<bool>(nullable: false),
                    FeeRecordId = table.Column<int>(nullable: false),
                    GuardianId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FeeCollections", x => x.FeeCollectionId);
                    table.ForeignKey(
                        name: "FK_FeeCollections_FeeRecords_FeeRecordId",
                        column: x => x.FeeRecordId,
                        principalTable: "FeeRecords",
                        principalColumn: "FeeRecordId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_FeeCollections_Guardians_GuardianId",
                        column: x => x.GuardianId,
                        principalTable: "Guardians",
                        principalColumn: "GuardianId");
                });

            migrationBuilder.CreateTable(
                name: "StudentAttendanceTypes",
                columns: table => new
                {
                    StudentAttendanceTypeId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    Name = table.Column<string>(maxLength: 100, nullable: false),
                    IsScheduled = table.Column<bool>(nullable: false),
                    IsActive = table.Column<bool>(nullable: false),
                    StartTime = table.Column<DateTime>(nullable: false),
                    EndTime = table.Column<DateTime>(nullable: false),
                    MaxMarkTime = table.Column<DateTime>(nullable: false),
                    MinMarkTime = table.Column<DateTime>(nullable: false),
                    LateMarkTime = table.Column<DateTime>(nullable: false),
                    SubgroupId = table.Column<int>(nullable: true),
                    BatchId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StudentAttendanceTypes", x => x.StudentAttendanceTypeId);
                    table.ForeignKey(
                        name: "FK_StudentAttendanceTypes_Batches_BatchId",
                        column: x => x.BatchId,
                        principalTable: "Batches",
                        principalColumn: "BatchId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_StudentAttendanceTypes_Subgroups_SubgroupId",
                        column: x => x.SubgroupId,
                        principalTable: "Subgroups",
                        principalColumn: "SubgroupId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "StudentSubgroup",
                columns: table => new
                {
                    StudentId = table.Column<int>(nullable: false),
                    SubgroupId = table.Column<int>(nullable: false),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StudentSubgroup", x => new { x.StudentId, x.SubgroupId });
                    table.ForeignKey(
                        name: "FK_StudentSubgroup_Students_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Students",
                        principalColumn: "StudentId");
                    table.ForeignKey(
                        name: "FK_StudentSubgroup_Subgroups_SubgroupId",
                        column: x => x.SubgroupId,
                        principalTable: "Subgroups",
                        principalColumn: "SubgroupId");
                });

            migrationBuilder.CreateTable(
                name: "TeacherCourse",
                columns: table => new
                {
                    TeacherId = table.Column<int>(nullable: false),
                    BatchId = table.Column<int>(nullable: false),
                    SubgroupId = table.Column<int>(nullable: false),
                    CourseId = table.Column<int>(nullable: false),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TeacherCourse", x => new { x.TeacherId, x.CourseId, x.BatchId, x.SubgroupId });
                    table.ForeignKey(
                        name: "FK_TeacherCourse_Batches_BatchId",
                        column: x => x.BatchId,
                        principalTable: "Batches",
                        principalColumn: "BatchId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_TeacherCourse_Courses_CourseId",
                        column: x => x.CourseId,
                        principalTable: "Courses",
                        principalColumn: "CourseId");
                    table.ForeignKey(
                        name: "FK_TeacherCourse_Subgroups_SubgroupId",
                        column: x => x.SubgroupId,
                        principalTable: "Subgroups",
                        principalColumn: "SubgroupId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_TeacherCourse_Teachers_TeacherId",
                        column: x => x.TeacherId,
                        principalTable: "Teachers",
                        principalColumn: "TeacherId");
                });

            migrationBuilder.CreateTable(
                name: "Exams",
                columns: table => new
                {
                    ExamId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    TotalMarks = table.Column<int>(nullable: false),
                    PassingMarks = table.Column<int>(nullable: false),
                    DateTime = table.Column<DateTime>(nullable: false),
                    ExamDetails = table.Column<string>(maxLength: 2048, nullable: true),
                    ExamTypeId = table.Column<int>(nullable: false),
                    ExamGradeTypeId = table.Column<int>(nullable: true),
                    ExamGroupId = table.Column<int>(nullable: true),
                    CourseId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Exams", x => x.ExamId);
                    table.ForeignKey(
                        name: "FK_Exams_Courses_CourseId",
                        column: x => x.CourseId,
                        principalTable: "Courses",
                        principalColumn: "CourseId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Exams_ExamGradeTypes_ExamGradeTypeId",
                        column: x => x.ExamGradeTypeId,
                        principalTable: "ExamGradeTypes",
                        principalColumn: "ExamGradeTypeId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Exams_ExamGroup_ExamGroupId",
                        column: x => x.ExamGroupId,
                        principalTable: "ExamGroup",
                        principalColumn: "ExamGroupId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Exams_ExamTypes_ExamTypeId",
                        column: x => x.ExamTypeId,
                        principalTable: "ExamTypes",
                        principalColumn: "ExamTypeId");
                });

            migrationBuilder.CreateTable(
                name: "ExamRecords",
                columns: table => new
                {
                    ExamRecordId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<string>(nullable: true),
                    DateTimeCreated = table.Column<DateTime>(nullable: true),
                    ModifiedBy = table.Column<string>(nullable: true),
                    DateTimeModified = table.Column<DateTime>(nullable: true),
                    MarksObtained = table.Column<int>(nullable: false),
                    HasAttended = table.Column<bool>(nullable: false),
                    ExamId = table.Column<int>(nullable: false),
                    StudentId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ExamRecords", x => x.ExamRecordId);
                    table.ForeignKey(
                        name: "FK_ExamRecords_Exams_ExamId",
                        column: x => x.ExamId,
                        principalTable: "Exams",
                        principalColumn: "ExamId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ExamRecords_Students_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Students",
                        principalColumn: "StudentId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_AspNetRoleClaims_RoleId",
                table: "AspNetRoleClaims",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "RoleNameIndex",
                table: "AspNetRoles",
                column: "NormalizedName",
                unique: true,
                filter: "[NormalizedName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserClaims_UserId",
                table: "AspNetUserClaims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserLogins_UserId",
                table: "AspNetUserLogins",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserRoles_RoleId",
                table: "AspNetUserRoles",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_BranchId",
                table: "AspNetUsers",
                column: "BranchId");

            migrationBuilder.CreateIndex(
                name: "EmailIndex",
                table: "AspNetUsers",
                column: "NormalizedEmail");

            migrationBuilder.CreateIndex(
                name: "UserNameIndex",
                table: "AspNetUsers",
                column: "NormalizedUserName",
                unique: true,
                filter: "[NormalizedUserName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_PhotoId",
                table: "AspNetUsers",
                column: "PhotoId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_UserTypeId",
                table: "AspNetUsers",
                column: "UserTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_Batches_ClassId",
                table: "Batches",
                column: "ClassId");

            migrationBuilder.CreateIndex(
                name: "IX_BatchFeeTypes_BatchId",
                table: "BatchFeeTypes",
                column: "BatchId");

            migrationBuilder.CreateIndex(
                name: "IX_BatchFeeTypes_FeeTypeId",
                table: "BatchFeeTypes",
                column: "FeeTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_Classes_BranchId",
                table: "Classes",
                column: "BranchId");

            migrationBuilder.CreateIndex(
                name: "IX_Courses_ClassId",
                table: "Courses",
                column: "ClassId");

            migrationBuilder.CreateIndex(
                name: "IX_Discount_FeeTypeId",
                table: "Discount",
                column: "FeeTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_Discount_StudentId",
                table: "Discount",
                column: "StudentId");

            migrationBuilder.CreateIndex(
                name: "IX_ExamGrade_ExamGradeTypeId",
                table: "ExamGrade",
                column: "ExamGradeTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_ExamGradeTypes_BatchId",
                table: "ExamGradeTypes",
                column: "BatchId");

            migrationBuilder.CreateIndex(
                name: "IX_ExamGradeTypes_CourseId",
                table: "ExamGradeTypes",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_ExamGroup_BatchId",
                table: "ExamGroup",
                column: "BatchId");

            migrationBuilder.CreateIndex(
                name: "IX_ExamGroup_ExamGradeTypeId",
                table: "ExamGroup",
                column: "ExamGradeTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_ExamRecords_ExamId",
                table: "ExamRecords",
                column: "ExamId");

            migrationBuilder.CreateIndex(
                name: "IX_ExamRecords_StudentId",
                table: "ExamRecords",
                column: "StudentId");

            migrationBuilder.CreateIndex(
                name: "IX_Exams_CourseId",
                table: "Exams",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_Exams_ExamGradeTypeId",
                table: "Exams",
                column: "ExamGradeTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_Exams_ExamGroupId",
                table: "Exams",
                column: "ExamGroupId");

            migrationBuilder.CreateIndex(
                name: "IX_Exams_ExamTypeId",
                table: "Exams",
                column: "ExamTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_ExamTypes_BatchId",
                table: "ExamTypes",
                column: "BatchId");

            migrationBuilder.CreateIndex(
                name: "IX_ExpanseTypes_BranchId",
                table: "ExpanseTypes",
                column: "BranchId");

            migrationBuilder.CreateIndex(
                name: "IX_FeeCollections_FeeRecordId",
                table: "FeeCollections",
                column: "FeeRecordId");

            migrationBuilder.CreateIndex(
                name: "IX_FeeCollections_GuardianId",
                table: "FeeCollections",
                column: "GuardianId");

            migrationBuilder.CreateIndex(
                name: "IX_FeeRecords_BatchFeeTypeId",
                table: "FeeRecords",
                column: "BatchFeeTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_FeeRecords_StudentId",
                table: "FeeRecords",
                column: "StudentId");

            migrationBuilder.CreateIndex(
                name: "IX_FeeTypes_BranchId",
                table: "FeeTypes",
                column: "BranchId");

            migrationBuilder.CreateIndex(
                name: "IX_FieldValues_FieldId",
                table: "FieldValues",
                column: "FieldId");

            migrationBuilder.CreateIndex(
                name: "IX_Groups_BatchId",
                table: "Groups",
                column: "BatchId");

            migrationBuilder.CreateIndex(
                name: "IX_GuardianFields_FieldId",
                table: "GuardianFields",
                column: "FieldId");

            migrationBuilder.CreateIndex(
                name: "IX_GuardianFields_GuardianId",
                table: "GuardianFields",
                column: "GuardianId");

            migrationBuilder.CreateIndex(
                name: "IX_Guardians_GuardianTypeId",
                table: "Guardians",
                column: "GuardianTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_Guardians_PhotoId",
                table: "Guardians",
                column: "PhotoId");

            migrationBuilder.CreateIndex(
                name: "IX_GuardianTypes_BranchId",
                table: "GuardianTypes",
                column: "BranchId");

            migrationBuilder.CreateIndex(
                name: "IX_Phone_GuardianId",
                table: "Phone",
                column: "GuardianId");

            migrationBuilder.CreateIndex(
                name: "IX_Phone_StaffId",
                table: "Phone",
                column: "StaffId");

            migrationBuilder.CreateIndex(
                name: "IX_Phone_StudentId",
                table: "Phone",
                column: "StudentId");

            migrationBuilder.CreateIndex(
                name: "IX_Phone_TeacherId",
                table: "Phone",
                column: "TeacherId");

            migrationBuilder.CreateIndex(
                name: "IX_StaffAttendanceTypes_StaffCategoryId",
                table: "StaffAttendanceTypes",
                column: "StaffCategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_StaffAttendanceTypes_StaffId",
                table: "StaffAttendanceTypes",
                column: "StaffId");

            migrationBuilder.CreateIndex(
                name: "IX_StaffCategory_BranchId",
                table: "StaffCategory",
                column: "BranchId");

            migrationBuilder.CreateIndex(
                name: "IX_StaffFields_FieldId",
                table: "StaffFields",
                column: "FieldId");

            migrationBuilder.CreateIndex(
                name: "IX_Staffs_PhotoId",
                table: "Staffs",
                column: "PhotoId");

            migrationBuilder.CreateIndex(
                name: "IX_Staffs_StaffCategoryId",
                table: "Staffs",
                column: "StaffCategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_StudentAttendanceTypes_BatchId",
                table: "StudentAttendanceTypes",
                column: "BatchId");

            migrationBuilder.CreateIndex(
                name: "IX_StudentAttendanceTypes_SubgroupId",
                table: "StudentAttendanceTypes",
                column: "SubgroupId");

            migrationBuilder.CreateIndex(
                name: "IX_StudentBatch_BatchId",
                table: "StudentBatch",
                column: "BatchId");

            migrationBuilder.CreateIndex(
                name: "IX_StudentFields_FieldId",
                table: "StudentFields",
                column: "FieldId");

            migrationBuilder.CreateIndex(
                name: "IX_StudentFields_StudentId",
                table: "StudentFields",
                column: "StudentId");

            migrationBuilder.CreateIndex(
                name: "IX_StudentGuardian_StudentId",
                table: "StudentGuardian",
                column: "StudentId");

            migrationBuilder.CreateIndex(
                name: "IX_StudentIdTypes_BranchId",
                table: "StudentIdTypes",
                column: "BranchId");

            migrationBuilder.CreateIndex(
                name: "IX_Students_PhotoId",
                table: "Students",
                column: "PhotoId");

            migrationBuilder.CreateIndex(
                name: "IX_Students_StudentIdTypeId",
                table: "Students",
                column: "StudentIdTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_StudentSubgroup_SubgroupId",
                table: "StudentSubgroup",
                column: "SubgroupId");

            migrationBuilder.CreateIndex(
                name: "IX_Subgroups_GroupId",
                table: "Subgroups",
                column: "GroupId");

            migrationBuilder.CreateIndex(
                name: "IX_TeacherAttendanceTypes_TeacherId",
                table: "TeacherAttendanceTypes",
                column: "TeacherId");

            migrationBuilder.CreateIndex(
                name: "IX_TeacherAttendanceTypes_TeacherRankId",
                table: "TeacherAttendanceTypes",
                column: "TeacherRankId");

            migrationBuilder.CreateIndex(
                name: "IX_TeacherCourse_BatchId",
                table: "TeacherCourse",
                column: "BatchId");

            migrationBuilder.CreateIndex(
                name: "IX_TeacherCourse_CourseId",
                table: "TeacherCourse",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_TeacherCourse_SubgroupId",
                table: "TeacherCourse",
                column: "SubgroupId");

            migrationBuilder.CreateIndex(
                name: "IX_TeacherFields_FieldId",
                table: "TeacherFields",
                column: "FieldId");

            migrationBuilder.CreateIndex(
                name: "IX_TeacherFields_StaffId",
                table: "TeacherFields",
                column: "StaffId");

            migrationBuilder.CreateIndex(
                name: "IX_TeacherFields_TeacherId",
                table: "TeacherFields",
                column: "TeacherId");

            migrationBuilder.CreateIndex(
                name: "IX_TeacherRank_BranchId",
                table: "TeacherRank",
                column: "BranchId");

            migrationBuilder.CreateIndex(
                name: "IX_Teachers_PhotoId",
                table: "Teachers",
                column: "PhotoId");

            migrationBuilder.CreateIndex(
                name: "IX_Teachers_TeacherRankId",
                table: "Teachers",
                column: "TeacherRankId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AspNetRoleClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserLogins");

            migrationBuilder.DropTable(
                name: "AspNetUserRoles");

            migrationBuilder.DropTable(
                name: "AspNetUserTokens");

            migrationBuilder.DropTable(
                name: "Discount");

            migrationBuilder.DropTable(
                name: "ExamGrade");

            migrationBuilder.DropTable(
                name: "ExamRecords");

            migrationBuilder.DropTable(
                name: "Expanses");

            migrationBuilder.DropTable(
                name: "ExpanseTypes");

            migrationBuilder.DropTable(
                name: "FeeCollections");

            migrationBuilder.DropTable(
                name: "FieldValues");

            migrationBuilder.DropTable(
                name: "GuardianFields");

            migrationBuilder.DropTable(
                name: "Phone");

            migrationBuilder.DropTable(
                name: "Settings");

            migrationBuilder.DropTable(
                name: "StaffAttendanceTypes");

            migrationBuilder.DropTable(
                name: "StaffFields");

            migrationBuilder.DropTable(
                name: "StudentAttendanceTypes");

            migrationBuilder.DropTable(
                name: "StudentBatch");

            migrationBuilder.DropTable(
                name: "StudentFields");

            migrationBuilder.DropTable(
                name: "StudentGuardian");

            migrationBuilder.DropTable(
                name: "StudentSubgroup");

            migrationBuilder.DropTable(
                name: "TeacherAttendanceTypes");

            migrationBuilder.DropTable(
                name: "TeacherCourse");

            migrationBuilder.DropTable(
                name: "TeacherFields");

            migrationBuilder.DropTable(
                name: "AspNetRoles");

            migrationBuilder.DropTable(
                name: "AspNetUsers");

            migrationBuilder.DropTable(
                name: "Exams");

            migrationBuilder.DropTable(
                name: "FeeRecords");

            migrationBuilder.DropTable(
                name: "Guardians");

            migrationBuilder.DropTable(
                name: "Subgroups");

            migrationBuilder.DropTable(
                name: "Fields");

            migrationBuilder.DropTable(
                name: "Staffs");

            migrationBuilder.DropTable(
                name: "Teachers");

            migrationBuilder.DropTable(
                name: "UserTypes");

            migrationBuilder.DropTable(
                name: "ExamGroup");

            migrationBuilder.DropTable(
                name: "ExamTypes");

            migrationBuilder.DropTable(
                name: "BatchFeeTypes");

            migrationBuilder.DropTable(
                name: "Students");

            migrationBuilder.DropTable(
                name: "GuardianTypes");

            migrationBuilder.DropTable(
                name: "Groups");

            migrationBuilder.DropTable(
                name: "StaffCategory");

            migrationBuilder.DropTable(
                name: "TeacherRank");

            migrationBuilder.DropTable(
                name: "ExamGradeTypes");

            migrationBuilder.DropTable(
                name: "FeeTypes");

            migrationBuilder.DropTable(
                name: "Photo");

            migrationBuilder.DropTable(
                name: "StudentIdTypes");

            migrationBuilder.DropTable(
                name: "Batches");

            migrationBuilder.DropTable(
                name: "Courses");

            migrationBuilder.DropTable(
                name: "Classes");

            migrationBuilder.DropTable(
                name: "Branches");
        }
    }
}
