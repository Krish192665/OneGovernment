using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OneGovernment
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Disables jQuery unobtrusive script dependency
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                NameTextBox.Focus();
            }
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            // Validate controls belonging to RegisterGroup
            Page.Validate("RegisterGroup");

            if (!Page.IsValid)
            {
                return; // Stops execution if any validation fails
            }

            string name = NameTextBox.Text.Trim();
            string emailOrMobile = EmailTextBox.Text.Trim();
            string password = PasswordTextBox.Text.Trim();

            // Optional fields
            int age = 0;
            int.TryParse(AgeTextBox?.Text, out age);
            string role = RoleDropDown?.SelectedValue ?? string.Empty;

            // Store user details in session (or replace with database insert query)
            Session["DisplayName"] = name;
            Session["Email"] = emailOrMobile;
            Session["Age"] = age;
            Session["Role"] = role;

            // Redirect user to Login page upon completion
            Response.Redirect("Home.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}