using System;

namespace OneGovernment.Models
{
    /// <summary>
    /// Demonstrates OOP Inheritance (extends BaseEntity) and Encapsulation.
    /// </summary>
    public class User : BaseEntity
    {
        private string _fullName;
        private string _email;

        public string FullName
        {
            get => _fullName;
            set => _fullName = value?.Trim();
        }

        public string Email
        {
            get => _email;
            set => _email = value?.Trim().ToLower();
        }

        public string PhoneNumber { get; set; }
        public int Age { get; set; }
        public string Role { get; set; } = "Citizen";
        public string Password { get; set; }

        public override string GetSummary()
        {
            return $"User: {FullName} ({Email}) - Role: {Role}";
        }
    }
}
