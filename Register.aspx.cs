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

            int age = 0;
            int.TryParse(AgeTextBox?.Text, out age);
            string role = RoleDropDown?.SelectedValue ?? "Citizen";

            try
            {
                // OOP Implementation: Instantiate Model
                var user = new OneGovernment.Models.User
                {
                    FullName = name,
                    Email = emailOrMobile.Contains("@") ? emailOrMobile : emailOrMobile + "@onegovernment.local",
                    PhoneNumber = !emailOrMobile.Contains("@") ? emailOrMobile : "",
                    Age = age,
                    Role = role,
                    Password = password
                };

                string errorMessage;
                bool isSuccess = OneGovernment.Models.DbHelper.RegisterUser(user, out errorMessage);

                if (isSuccess)
                {
                    // Store user details in session
                    Session["UserId"] = user.Id;
                    Session["DisplayName"] = user.FullName;
                    Session["Email"] = user.Email;
                    Session["Age"] = user.Age;
                    Session["Role"] = user.Role;
                    Session["PhoneNumber"] = user.PhoneNumber;

                    // Redirect user to Home page
                    Response.Redirect("Home.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
                else
                {
                    StatusLabel.Text = "<div style='color: #dc2626; background: #fee2e2; border: 1px solid #f87171; padding: 10px; border-radius: 6px; margin-bottom: 15px; font-size: 14px;'>" + Server.HtmlEncode(errorMessage) + "</div>";
                }
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "<div style='color: #dc2626; background: #fee2e2; border: 1px solid #f87171; padding: 10px; border-radius: 6px; margin-bottom: 15px; font-size: 14px;'>Database error: " + Server.HtmlEncode(ex.Message) + "</div>";
            }
        }
    }
}