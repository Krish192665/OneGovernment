using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OneGovernment
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EmailTextBox.Focus();
            }
        }

        protected void SignInButton_Click(object sender, EventArgs e)
        {
            string emailOrMobile = EmailTextBox.Text.Trim();
            string name = "John Doe";
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
