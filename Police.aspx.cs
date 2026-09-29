using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OneGovernment
{
    public partial class Police : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string displayName = Convert.ToString(Session["DisplayName"]);

                if (string.IsNullOrWhiteSpace(displayName))
                {
                    string email = Convert.ToString(Session["Email"]);
                    if (!string.IsNullOrEmpty(email) && email.Contains("@"))
                    {
                        string prefix = email.Split('@')[0];
                        displayName = char.ToUpper(prefix[0]) + prefix.Substring(1);
                    }
                    else
                    {
                        displayName = "Ramesh Pande";
                    }
                }

                UserNameLabel.Text = Server.HtmlEncode(displayName);
                UserGreetingLiteral.Text = Server.HtmlEncode(displayName);
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}