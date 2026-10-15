using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OneGovernment
{
    public partial class Profile : Page
    {
        public OneGovernment.Models.User CurrentUser { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            string email = Session["Email"] as string ?? "ram@gmail.com";
            try
            {
                CurrentUser = OneGovernment.Models.DbHelper.GetUserByEmail(email);
            }
            catch { }

            if (CurrentUser == null)
            {
                CurrentUser = new OneGovernment.Models.User
                {
                    FullName = Session["DisplayName"] as string ?? "Ramjibhai Pandey",
                    Email = email,
                    Age = Session["Age"] is int a ? a : 57,
                    PhoneNumber = Session["PhoneNumber"] as string ?? "9876543210",
                    Role = Session["Role"] as string ?? "Citizen"
                };
            }
        }
    }
}
