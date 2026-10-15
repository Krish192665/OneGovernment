using System;

namespace OneGovernment.Models
{
    public class ServiceApplication : BaseEntity
    {
        public string ApplicationNo { get; set; }
        public int? UserId { get; set; }
        public string ApplicantName { get; set; }
        public string ApplicantEmail { get; set; }
        public string ApplicantPhone { get; set; }
        public string ServiceCategory { get; set; }
        public string ApplicationType { get; set; }
        public string Status { get; set; } = "Submitted";
        public string Address { get; set; }
        public string City { get; set; }
        public string Remarks { get; set; }

        public override string GetSummary()
        {
            return $"Application #{ApplicationNo} for {ServiceCategory} - Status: {Status}";
        }
    }
}
