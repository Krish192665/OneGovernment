using System;
using System.Collections.Generic;
using System.Web.UI;

namespace OneGovernment
{
    public partial class Category : Page
    {
        private static readonly IDictionary<string, string> CategoryNames =
            new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
            {
                { "it", "IT Services" },
                { "student", "Student Services" },
                { "colleges", "College Services" },
                { "rto", "RTO Services" },
                { "passport", "Passport Services" },
                { "taxes", "Tax Services" },
                { "health", "Health Services" },
                { "transport", "Transport Services" },
                { "agriculture", "Agriculture Services" },
                { "electricity", "Electricity Services" },
                { "arms", "Arms License Services" },
                { "cyber-crime", "Cyber Crime Services" },
                { "traffic-e-challan", "Traffic E-Challan Services" },
                { "lost-property", "Lost Property Services" },
                { "pcc", "Police Clearance Services" },
                { "more", "More Services" }
            };

        protected void Page_Load(object sender, EventArgs e)
        {
            var type = Request.QueryString["type"];
            string categoryName;

            if (string.IsNullOrWhiteSpace(type) || !CategoryNames.TryGetValue(type, out categoryName))
            {
                categoryName = "Government Services";
            }

            CategoryTitleLabel.Text = categoryName;
        }
    }
}
