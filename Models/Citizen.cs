using System;

namespace OneGovernment.Models
{
    /// <summary>
    /// Demonstrates OOP Inheritance: Citizen is a specialized User.
    /// </summary>
    public class Citizen : User
    {
        public string AadhaarNumber { get; set; }
        public string City { get; set; }
        public string State { get; set; } = "Gujarat";

        public override string GetSummary()
        {
            return $"Citizen: {FullName}, City: {City}, Age: {Age}, Aadhaar: {AadhaarNumber}";
        }
    }
}
