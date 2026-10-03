<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="OneGovernment.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Forgot Password | One Government</title>
    <link href="Styles/site.css" rel="stylesheet" />
    <style>
        /* ---- Forgot Password Styles ---- */
        .fp-icon-wrap {
            display: flex; align-items: center; justify-content: center;
            width: 64px; height: 64px;
            background: linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%);
            border-radius: 50%; margin: 0 auto 20px auto;
            box-shadow: 0 4px 16px rgba(59,130,246,0.35);
        }
        .fp-icon-wrap svg { color:#fff; width:30px; height:30px; }

        .otp-icon-wrap {
            display: flex; align-items: center; justify-content: center;
            width: 64px; height: 64px;
            background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
            border-radius: 50%; margin: 0 auto 20px auto;
            box-shadow: 0 4px 16px rgba(245,158,11,0.35);
        }
        .otp-icon-wrap svg { color:#fff; width:30px; height:30px; }

        .success-icon-wrap {
            display: flex; align-items: center; justify-content: center;
            width: 64px; height: 64px;
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            border-radius: 50%; margin: 0 auto 20px auto;
            box-shadow: 0 4px 16px rgba(16,185,129,0.35);
        }
        .pw-icon-wrap {
            display: flex; align-items: center; justify-content: center;
            width: 64px; height: 64px;
            background: linear-gradient(135deg, #8b5cf6 0%, #6d28d9 100%);
            border-radius: 50%; margin: 0 auto 20px auto;
            box-shadow: 0 4px 16px rgba(139,92,246,0.35);
        }
        .pw-icon-wrap svg { color:#fff; width:30px; height:30px; }

        /* OTP digit boxes */
        .otp-boxes {
            display: flex; gap: 10px; justify-content: center;
            margin: 20px 0;
        }
        .otp-boxes input {
            width: 50px; height: 58px;
            text-align: center; font-size: 1.5rem; font-weight: 700;
            border: 2px solid #e2e8f0; border-radius: 10px;
            background: #f8fafc; color: #0f172a;
            outline: none; transition: border-color 0.2s, box-shadow 0.2s;
        }
        .otp-boxes input:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59,130,246,0.2);
        }
        .otp-boxes input.filled {
            border-color: #3b82f6; background: #eff6ff;
        }
        .otp-timer {
            text-align: center; font-size: 0.82rem;
            color: #64748b; margin-bottom: 6px;
        }
        .otp-timer span { font-weight: 700; color: #f59e0b; }

        /* Demo OTP banner */
        .demo-otp-banner {
            background: #fef3c7; border: 1px solid #fde68a;
            border-radius: 8px; padding: 10px 14px; margin-bottom: 14px;
            font-size: 0.82rem; color: #92400e; text-align: center;
            line-height: 1.5;
        }
        .demo-otp-banner strong { font-size: 1.3rem; letter-spacing: 4px; color: #b45309; }

        /* Step indicator */
        .step-indicator {
            display: flex; justify-content: center; gap: 8px;
            margin-bottom: 24px;
        }
        .step-dot {
            width: 8px; height: 8px; border-radius: 50%;
            background: #e2e8f0; transition: all 0.3s;
        }
        .step-dot.active { background: #3b82f6; width: 24px; border-radius: 4px; }
        .step-dot.done { background: #10b981; }

        .auth-success-box {
            background: #f0fdf4; border: 1px solid #bbf7d0;
            border-radius: 10px; padding: 16px 18px; margin: 16px 0;
            font-size: 0.85rem; color: #166534; line-height: 1.7;
        }
    </style>
</head>
<body class="auth-page-wrapper">
    <form id="fpForm" runat="server">
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

        <!-- Main Container -->
        <div class="auth-container">
            <div class="auth-card">

                <!-- Step Progress Dots -->
                <div class="step-indicator">
                    <asp:Panel ID="dot1" runat="server" CssClass="step-dot active" />
                    <asp:Panel ID="dot2" runat="server" CssClass="step-dot" />
                    <asp:Panel ID="dot3" runat="server" CssClass="step-dot" />
                    <asp:Panel ID="dot4" runat="server" CssClass="step-dot" />
                </div>

                <!-- ===== STEP 1: Enter Email ===== -->
                <asp:Panel ID="pnlStep1" runat="server">
                    <div class="fp-icon-wrap">
                        <svg fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                        </svg>
                    </div>
                    <h1 class="auth-title" style="text-align:center;">Forgot Password?</h1>
                    <p class="auth-subtitle" style="text-align:center;">Enter your registered email. We'll send a 6-digit OTP to verify your identity.</p>

                    <asp:Label ID="lblStep1Error" runat="server" CssClass="field-error" EnableViewState="false" style="display:block; margin-bottom:10px;" />

                    <div class="form-group">
                        <label for="txtEmail">Registered Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" placeholder="e.g. ramesh@gmail.com" TextMode="Email" />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Please enter your email address."
                            CssClass="field-error" Display="Dynamic"
                            ValidationGroup="FPGroup1" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Please enter a valid email address."
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            CssClass="field-error" Display="Dynamic"
                            ValidationGroup="FPGroup1" />
                    </div>

                    <asp:Button ID="btnSendOTP" runat="server" Text="Send OTP"
                        CssClass="btn-auth-submit" OnClick="btnSendOTP_Click"
                        ValidationGroup="FPGroup1" />

                    <div class="auth-footer-text" style="margin-top:18px;">
                        <a href="Login.aspx" class="auth-link">&#8592; Back to Login</a>
                    </div>
                </asp:Panel>

                <!-- ===== STEP 2: OTP Verification ===== -->
                <asp:Panel ID="pnlStep2" runat="server" Visible="false">
                    <div class="otp-icon-wrap">
                        <svg fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" />
                        </svg>
                    </div>
                    <h1 class="auth-title" style="text-align:center;">Verify OTP</h1>
                    <p class="auth-subtitle" style="text-align:center;">
                        A 6-digit OTP has been sent to<br />
                        <strong><asp:Label ID="lblOtpEmail" runat="server" /></strong>
                    </p>

                    <!-- Demo OTP display (in production, remove this) -->
                    <div class="demo-otp-banner">
                        &#128274; Demo OTP (for testing):<br />
                        <strong><asp:Label ID="lblDemoOTP" runat="server" /></strong>
                    </div>

                    <asp:Label ID="lblOtpError" runat="server" CssClass="field-error" EnableViewState="false" style="display:block; text-align:center; margin-bottom:8px;" />

                    <!-- 6-digit OTP input boxes -->
                    <div class="otp-boxes" id="otpBoxes">
                        <input type="text" id="otp1" maxlength="1" class="otp-single" inputmode="numeric" pattern="[0-9]" autocomplete="off" />
                        <input type="text" id="otp2" maxlength="1" class="otp-single" inputmode="numeric" pattern="[0-9]" autocomplete="off" />
                        <input type="text" id="otp3" maxlength="1" class="otp-single" inputmode="numeric" pattern="[0-9]" autocomplete="off" />
                        <input type="text" id="otp4" maxlength="1" class="otp-single" inputmode="numeric" pattern="[0-9]" autocomplete="off" />
                        <input type="text" id="otp5" maxlength="1" class="otp-single" inputmode="numeric" pattern="[0-9]" autocomplete="off" />
                        <input type="text" id="otp6" maxlength="1" class="otp-single" inputmode="numeric" pattern="[0-9]" autocomplete="off" />
                    </div>

                    <!-- Hidden field to collect combined OTP -->
                    <asp:HiddenField ID="hdnOTPValue" runat="server" />

                    <div class="otp-timer">
                        OTP expires in: <span id="timerDisplay">05:00</span>
                    </div>

                    <asp:Button ID="btnVerifyOTP" runat="server" Text="Verify OTP"
                        CssClass="btn-auth-submit" OnClick="btnVerifyOTP_Click"
                        OnClientClick="collectOTP();" />

                    <div style="text-align:center; margin-top:14px;">
                        <asp:Button ID="btnResendOTP" runat="server" Text="Resend OTP"
                            CssClass="auth-link" OnClick="btnResendOTP_Click"
                            style="background:none; border:none; cursor:pointer; font-size:0.875rem;" />
                    </div>

                    <div class="auth-footer-text" style="margin-top:10px;">
                        <a href="ForgotPassword.aspx" class="auth-link">&#8592; Change Email</a>
                    </div>
                </asp:Panel>

                <!-- ===== STEP 3: Set New Password ===== -->
                <asp:Panel ID="pnlStep3" runat="server" Visible="false">
                    <div class="pw-icon-wrap">
                        <svg fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                        </svg>
                    </div>
                    <h1 class="auth-title" style="text-align:center;">Set New Password</h1>
                    <p class="auth-subtitle" style="text-align:center;">OTP verified! Choose a strong new password.</p>

                    <asp:Label ID="lblStep3Error" runat="server" CssClass="field-error" EnableViewState="false" style="display:block; margin-bottom:10px;" />

                    <div class="form-group">
                        <label for="txtNewPassword">New Password</label>
                        <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-input"
                            TextMode="Password" placeholder="Min. 8 characters" />
                        <asp:RequiredFieldValidator ID="rfvNewPw" runat="server"
                            ControlToValidate="txtNewPassword"
                            ErrorMessage="Please enter a new password."
                            CssClass="field-error" Display="Dynamic"
                            ValidationGroup="FPGroup3" />
                    </div>

                    <div class="form-group">
                        <label for="txtConfirmPassword">Confirm New Password</label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-input"
                            TextMode="Password" placeholder="Re-enter password" />
                        <asp:RequiredFieldValidator ID="rfvConfirmPw" runat="server"
                            ControlToValidate="txtConfirmPassword"
                            ErrorMessage="Please confirm your password."
                            CssClass="field-error" Display="Dynamic"
                            ValidationGroup="FPGroup3" />
                        <asp:CompareValidator ID="cvPasswords" runat="server"
                            ControlToValidate="txtConfirmPassword"
                            ControlToCompare="txtNewPassword"
                            ErrorMessage="Passwords do not match."
                            CssClass="field-error" Display="Dynamic"
                            ValidationGroup="FPGroup3" />
                    </div>

                    <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password"
                        CssClass="btn-auth-submit" OnClick="btnResetPassword_Click"
                        ValidationGroup="FPGroup3" />

                    <div class="auth-footer-text" style="margin-top:18px;">
                        <a href="Login.aspx" class="auth-link">&#8592; Back to Login</a>
                    </div>
                </asp:Panel>

                <!-- ===== STEP 4: Success ===== -->
                <asp:Panel ID="pnlStep4" runat="server" Visible="false">
                    <div class="success-icon-wrap">
                        <svg fill="none" viewBox="0 0 24 24" stroke="white" stroke-width="2.5" width="30" height="30">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                    </div>
                    <h1 class="auth-title" style="text-align:center;">Password Reset!</h1>
                    <p class="auth-subtitle" style="text-align:center;">Your password has been reset successfully.</p>

                    <div class="auth-success-box">
                        &#10003; Your new password is active.<br />
                        &#10003; You can now login with your new password.<br />
                        &#10003; Keep your password safe and do not share it.
                    </div>

                    <a href="Login.aspx" class="btn-auth-submit" style="display:block; text-align:center; text-decoration:none; padding:14px;">
                        Go to Login &#8594;
                    </a>
                </asp:Panel>

            </div>
        </div>
    </form>

    <script type="text/javascript">
        // ---- OTP box navigation ----
        var otpIds = ['otp1','otp2','otp3','otp4','otp5','otp6'];

        window.onload = function () {
            otpIds.forEach(function (id, i) {
                var el = document.getElementById(id);
                if (!el) return;
                el.addEventListener('input', function () {
                    this.value = this.value.replace(/[^0-9]/g, '');
                    if (this.value.length === 1 && i < 5) {
                        document.getElementById(otpIds[i + 1]).focus();
                    }
                    if (this.value) this.classList.add('filled');
                    else this.classList.remove('filled');
                });
                el.addEventListener('keydown', function (e) {
                    if (e.key === 'Backspace' && !this.value && i > 0) {
                        document.getElementById(otpIds[i - 1]).focus();
                    }
                });
            });
            startTimer();
        };

        function collectOTP() {
            var otp = '';
            otpIds.forEach(function (id) {
                var el = document.getElementById(id);
                if (el) otp += el.value;
            });
            var hdn = document.getElementById('<%= hdnOTPValue.ClientID %>');
            if (hdn) hdn.value = otp;
        }

        // ---- Countdown timer ----
        var timerInterval;
        function startTimer() {
            var timerEl = document.getElementById('timerDisplay');
            if (!timerEl) return;
            var seconds = 300; // 5 minutes
            clearInterval(timerInterval);
            timerInterval = setInterval(function () {
                seconds--;
                if (seconds <= 0) {
                    clearInterval(timerInterval);
                    timerEl.textContent = '00:00';
                    timerEl.style.color = '#ef4444';
                    return;
                }
                var m = Math.floor(seconds / 60);
                var s = seconds % 60;
                timerEl.textContent = (m < 10 ? '0' : '') + m + ':' + (s < 10 ? '0' : '') + s;
            }, 1000);
        }

    </script>
</body>
</html>
