using System;

namespace OneGovernment.Models
{
    public class ServiceCategory : BaseEntity
    {
        public string CategoryKey { get; set; }
        public string CategoryName { get; set; }
        public string Description { get; set; }
        public string PageUrl { get; set; }
        public bool IsActive { get; set; } = true;

        public override string GetSummary()
        {
            return $"Service: {CategoryName} ({CategoryKey})";
        }
    }
}
