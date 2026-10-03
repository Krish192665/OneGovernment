using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OneGovernment
{
    public partial class Profile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                TextBox nameBox = FindProfileControl<TextBox>("txtProfileName");
                TextBox emailBox = FindProfileControl<TextBox>("txtProfileEmail");
                TextBox ageBox = FindProfileControl<TextBox>("txtProfileAge");
                DropDownList categoryList = FindProfileControl<DropDownList>("ddlProfileCategory");

                if (nameBox != null)
                    nameBox.Text = Session["ProfileName"] as string ?? Session["DisplayName"] as string ?? "Ramjibhai Pandey";

                if (emailBox != null)
                {
                    string email = Session["ProfileEmail"] as string ?? Session["Email"] as string;
                    emailBox.Text = !string.IsNullOrEmpty(email) && email.Contains("@") ? email : "ram@gmail.com";
                }

                if (ageBox != null)
                    ageBox.Text = Session["ProfileAge"] as string ?? "57";

                if (categoryList != null)
                {
                    string category = Session["ProfileCategory"] as string ?? "RTO";
                    ListItem selectedCategory = categoryList.Items.FindByValue(category);
                    if (selectedCategory != null)
                        categoryList.SelectedValue = category;
                }
            }
        }

        private T FindProfileControl<T>(string controlId) where T : Control
        {
            ContentPlaceHolder content = Master.FindControl("MainContent") as ContentPlaceHolder;
            return content == null ? null : content.FindControl(controlId) as T;
        }
    }
}
