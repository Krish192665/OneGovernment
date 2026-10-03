<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OneGovernment.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Login | One Government</title>
    <link href="Styles/site.css" rel="stylesheet" />
</head>
<body class="auth-page-wrapper">
    <form id="loginForm" runat="server" defaultbutton="SignInButton">
        <asp:ScriptManager runat="server" />
        <!-- Brand Header -->
        <header class="auth-header">
            <a class="portal-brand" href="Login.aspx">
                <div class="portal-brand-logo">
                    <svg viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 1L2 6v2h20V6L12 1zm0 3.2L18.4 6H5.6L12 4.2zM4 10v9h3v-9H4zm6 0v9h4v-9h-4zm7 0v9h3v-9h-3zM2 21v2h20v-2H2z"/>
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
                <h1 class="auth-title">Login</h1>
                <p class="auth-subtitle">Access all government services in one place</p>

                <asp:Label ID="StatusLabel" runat="server" EnableViewState="false" />

                <div class="form-group">
                    <label for="EmailTextBox">Email or Mobile</label>
                    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-input" placeholder="e.g. ramesh@gmail.com" />
                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="EmailTextBox" ErrorMessage="Email or mobile is required." CssClass="field-error" Display="Dynamic" ValidationGroup="LoginGroup" />
                </div>

                <div class="form-group">
                    <label for="PasswordTextBox">Password</label>
                    <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="form-input" TextMode="Password" placeholder="••••••••" />
                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="PasswordTextBox" ErrorMessage="Password is required." CssClass="field-error" Display="Dynamic" ValidationGroup="LoginGroup" />
                </div>

                <div class="forgot-link-wrap">
                    <a href="ForgotPassword.aspx" class="auth-link">Forgot Password?</a>
                </div>

                <asp:Button ID="SignInButton" runat="server" Text="Login" CssClass="btn-auth-submit" OnClick="SignInButton_Click" ValidationGroup="LoginGroup" />

                <div class="auth-footer-text">
                    Don't have an account? <a href="Register.aspx" class="auth-link">Register</a><br><br>
                    <a href="Register.aspx" class="auth-link">Admin Login</a>
                </div>
            </div>

            
        </div>
    </form>
</body>
</html>
