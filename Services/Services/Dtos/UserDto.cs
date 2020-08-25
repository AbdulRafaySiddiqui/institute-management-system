using Domain;

namespace Services
{
    public class UserDto
    {
        public string UserName { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Token { get; set; }

        public int? PhotoId { get; set; }
        public virtual Photo Photo { get; set; }

        public int? UserTypeId { get; set; }
        public virtual UserType UserType { get; set; }

        public int? BranchId { get; set; }
        public virtual Branch Branch { get; set; }
    }
}
