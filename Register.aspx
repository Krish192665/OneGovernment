<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OneGovernment.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Register | One Government</title>
    <link href="Content/government.css" rel="stylesheet" />
    <link href="~/Styles/site.css" rel="stylesheet" />
</head>
<body class="auth-page-wrapper">
    <form id="registerForm" runat="server" defaultbutton="RegisterButton">
        <asp:ScriptManager runat="server" />
        <!-- Brand Header -->
        <header class="auth-header">
            <a class="portal-brand" href="Login.aspx">
                <div class="portal-brand-logo">
                    <svg viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 1L2 6v2h20V6L12 1zm0 3.2L18.4 6H5.6L12 4.2zM4 10v9h3v-9H4zm6 0v9h4v-9h-4zm7 0v9h3v-9h-3zM2 21v2h20v-2H2z" />
                    </svg>
                </div>
                <div class="portal-brand-text">
                    <strong>One Government</strong>
                    <small>All Government Services, One Platform</small>
                </div>
            </a>
        </header>

        <!-- Main Auth Container -->
        <div class="auth-container">
            <div class="auth-card">
                <h1 class="auth-title">Register</h1>
                <p class="auth-subtitle">Create your One Government citizen account</p>

                <asp:Label ID="StatusLabel" runat="server" EnableViewState="false" />

                <div class="form-group">
                    <label for="NameTextBox">Full Name</label>
                    <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-input" placeholder="e.g. Ramesh Pande" />
                    <asp:RequiredFieldValidator ID="NameRequired" runat="server" ControlToValidate="NameTextBox" ErrorMessage="Full name is required." CssClass="field-error" Display="Dynamic" ValidationGroup="RegisterGroup" />
                </div>

                <div class="form-group">
                    <label for="EmailTextBox">Email or Mobile</label>
                    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-input" placeholder="e.g. ramesh.pande@gmail.com" />
                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="EmailTextBox" ErrorMessage="Email or mobile is required." CssClass="field-error" Display="Dynamic" ValidationGroup="RegisterGroup" />
                </div>

                <div class="form-group">
                    <label for="PasswordTextBox">Password</label>
                    <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="form-input" TextMode="Password" placeholder="••••••••" />
                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="PasswordTextBox" ErrorMessage="Password is required." CssClass="field-error" Display="Dynamic" ValidationGroup="RegisterGroup" />
                </div>

                <div class="form-group">
                    <label for="ConfirmPasswordTextBox">Confirm Password</label>
                    <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" CssClass="form-input" TextMode="Password" placeholder="••••••••" />
                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPasswordTextBox" ErrorMessage="Please confirm your password." CssClass="field-error" Display="Dynamic" ValidationGroup="RegisterGroup" />
                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="PasswordTextBox" ControlToValidate="ConfirmPasswordTextBox" ErrorMessage="Passwords do not match." CssClass="field-error" Display="Dynamic" Operator="Equal" Type="String" ValidationGroup="RegisterGroup" />
                </div>

                <div class="form-group">
                    <label for="AgeTextBox">Age</label>
                    <asp:TextBox ID="AgeTextBox" runat="server" CssClass="form-input" placeholder="e.g. 30" />
                    <asp:RequiredFieldValidator ID="AgeRequired" runat="server" ControlToValidate="AgeTextBox" ErrorMessage="Age is required." CssClass="field-error" Display="Dynamic" ValidationGroup="RegisterGroup" />
                    <asp:RangeValidator ID="AgeRange" runat="server" ControlToValidate="AgeTextBox" ErrorMessage="Enter a valid age between 1 and 120." CssClass="field-error" MinimumValue="1" MaximumValue="120" Type="Integer" Display="Dynamic" ValidationGroup="RegisterGroup" />
                </div>

                <div class="form-group">
                    <label for="RoleDropDown">Role</label>
                    <asp:DropDownList ID="RoleDropDown" runat="server" CssClass="form-input">
                        <asp:ListItem Value="">Select a role</asp:ListItem>
                        <asp:ListItem Value="Student">Student</asp:ListItem>
                        <asp:ListItem Value="Peopel">peopel</asp:ListItem>
                        <asp:ListItem Value="Officer">Officer</asp:ListItem>
                        <asp:ListItem Value="Other">Other</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RoleRequired" runat="server" ControlToValidate="RoleDropDown" InitialValue="" ErrorMessage="Please select a role." CssClass="field-error" Display="Dynamic" ValidationGroup="RegisterGroup" />
                </div>

                <asp:Button ID="RegisterButton" runat="server" Text="Register" CssClass="btn-auth-submit" OnClick="RegisterButton_Click" ValidationGroup="RegisterGroup" />

                <div class="auth-footer-text">
                    Already have an account? <a href="Login.aspx" class="auth-link">Login</a>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
