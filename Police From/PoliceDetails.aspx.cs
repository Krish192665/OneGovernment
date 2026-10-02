using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OneGovernment.Police_From
{
    public partial class PoliceDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SwitchTab("Overview", 0);
            }
        }

        protected void Tab_Click(object sender, EventArgs e)
        {
            if (sender is Button btn)
            {
                string tab = btn.CommandArgument;

                switch (tab)
                {
                    case "Overview":
                        SwitchTab("Overview", 0);
                        break;
                    case "Links":
                        SwitchTab("Links", 1);
                        break;
                    case "Documents":
                        SwitchTab("Documents", 2);
                        break;
                    case "DemoForm":
                        SwitchTab("DemoForm", 3);
                        break;
                }
            }
        }

        private void SwitchTab(string activeTabName, int viewIndex)
        {
            if (mvDetails != null && viewIndex >= 0 && viewIndex < mvDetails.Views.Count)
            {
                mvDetails.ActiveViewIndex = viewIndex;
            }

            if (btnOverview != null)
                btnOverview.CssClass = "tab-link" + (activeTabName == "Overview" ? " active-tab" : "");

            if (btnLinks != null)
                btnLinks.CssClass = "tab-link" + (activeTabName == "Links" ? " active-tab" : "");

            if (btnDocuments != null)
                btnDocuments.CssClass = "tab-link" + (activeTabName == "Documents" ? " active-tab" : "");

            if (btnDemoForm != null)
                btnDemoForm.CssClass = "tab-link" + (activeTabName == "DemoForm" ? " active-tab" : "");
        }
    }
}