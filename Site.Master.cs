using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OneGovernment
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // populate the shared user name from session if available
                try
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
                            displayName = "Ramesh Pandey";
                        }
                    }

                    // if the label exists on the master page, set its text
                    if (this.FindControl("UserNameLabel") is Label lbl)
                    {
                        lbl.Text = Server.HtmlEncode(displayName);
                    }
                }
                catch
                {
                    // swallow safely; don't break page render on session read errors
                }
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            // Shared logout handler for the header logout button
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}