using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using OneGovernment.Models;

namespace OneGovernment
{
    public partial class Category : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var type = Request.QueryString["type"] ?? "";
            string categoryName = "Government Services";

            try
            {
                // OOP Collections & Database Connectivity
                List<ServiceCategory> categories = DbHelper.GetAllCategories();
                var found = categories.FirstOrDefault(c => c.CategoryKey.Equals(type, StringComparison.OrdinalIgnoreCase));
                if (found != null)
                {
                    categoryName = found.CategoryName;
                }
                else if (!string.IsNullOrWhiteSpace(type))
                {
                    categoryName = char.ToUpper(type[0]) + type.Substring(1) + " Services";
                }
            }
            catch
            {
                if (!string.IsNullOrWhiteSpace(type))
                    categoryName = char.ToUpper(type[0]) + type.Substring(1) + " Services";
            }

            CategoryTitleLabel.Text = categoryName;
        }
    }
}
