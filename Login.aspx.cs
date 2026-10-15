using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OneGovernment
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Disables unobtrusive JavaScript mode so ASP.NET Web Forms validation runs smoothly
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                EmailTextBox.Focus();
            }
        }

        protected void SignInButton_Click(object sender, EventArgs e)
        {
            // Run validation specifically for the LoginGroup controls
            Page.Validate("LoginGroup");

            // If any field is empty or invalid, stop processing
            if (!Page.IsValid)
            {
                return;
            }

            string emailOrMobile = EmailTextBox.Text.Trim();
            string password = PasswordTextBox.Text.Trim();

            try
            {
                OneGovernment.Models.User user = OneGovernment.Models.DbHelper.AuthenticateUser(emailOrMobile, password);

                if (user != null)
                {
                    Session["UserId"] = user.Id;
                    Session["DisplayName"] = user.FullName;
                    Session["Email"] = user.Email;
                    Session["Role"] = user.Role;
                    Session["Age"] = user.Age;
                    Session["PhoneNumber"] = user.PhoneNumber;

                    Response.Redirect("Home.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
                else
                {
                    StatusLabel.Text = "<div style='color: #dc2626; background: #fee2e2; border: 1px solid #f87171; padding: 10px; border-radius: 6px; margin-bottom: 15px; font-size: 14px;'>Invalid email/mobile or password. Please try again.</div>";
                }
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "<div style='color: #dc2626; background: #fee2e2; border: 1px solid #f87171; padding: 10px; border-radius: 6px; margin-bottom: 15px; font-size: 14px;'>Database error: " + Server.HtmlEncode(ex.Message) + "</div>";
            }
        }
    }
}