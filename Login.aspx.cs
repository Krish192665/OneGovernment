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
            string name = "Citizen";

            if (!string.IsNullOrEmpty(emailOrMobile))
            {
                if (emailOrMobile.Contains("@"))
                {
                    string part = emailOrMobile.Split('@')[0];
                    if (!string.IsNullOrEmpty(part))
                    {
                        name = char.ToUpper(part[0]) + part.Substring(1);
                    }
                }
                Session["Email"] = emailOrMobile;
            }

            Session["DisplayName"] = name;
            Response.Redirect("Home.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}