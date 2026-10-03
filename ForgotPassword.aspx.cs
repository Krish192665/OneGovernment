using System;
using System.Web.UI;

namespace OneGovernment
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        // ─── STEP 1: Send OTP ─────────────────────────────────────────────
        protected void btnSendOTP_Click(object sender, EventArgs e)
        {
            Page.Validate("FPGroup1");
            if (!Page.IsValid) return;

            string email = txtEmail.Text.Trim();

            // Generate a 6-digit OTP
            var rnd = new Random();
            string otp = rnd.Next(100000, 999999).ToString();

            // Store OTP and email in Session
            Session["FP_OTP"]      = otp;
            Session["FP_Email"]    = email;
            Session["FP_OTPTime"]  = DateTime.Now;

            // In production: send otp via email/SMS here.
            // For demo: display it in the banner.

            lblOtpEmail.Text  = Server.HtmlEncode(email);
            lblDemoOTP.Text   = otp;

            ShowStep(2);
        }

        // ─── STEP 2: Verify OTP ───────────────────────────────────────────
        protected void btnVerifyOTP_Click(object sender, EventArgs e)
        {
            string enteredOTP = hdnOTPValue.Value.Trim();
            string storedOTP  = Session["FP_OTP"]  as string;
            DateTime? otpTime = Session["FP_OTPTime"] as DateTime?;

            // Restore display for step 2 in case of validation failure
            string email = Session["FP_Email"] as string ?? "";
            lblOtpEmail.Text = Server.HtmlEncode(email);
            lblDemoOTP.Text  = storedOTP;

            if (string.IsNullOrEmpty(enteredOTP) || enteredOTP.Length != 6)
            {
                lblOtpError.Text = "&#9888; Please enter the complete 6-digit OTP.";
                ShowStep(2);
                return;
            }

            // Check expiry (5 minutes)
            if (otpTime.HasValue && (DateTime.Now - otpTime.Value).TotalMinutes > 5)
            {
                lblOtpError.Text = "&#9888; OTP has expired. Please request a new one.";
                ShowStep(2);
                return;
            }

            if (enteredOTP != storedOTP)
            {
                lblOtpError.Text = "&#10008; Incorrect OTP. Please try again.";
                ShowStep(2);
                return;
            }

            // OTP verified — clear it so it can't be reused
            Session["FP_OTPVerified"] = true;
            Session["FP_OTP"]         = null;

            ShowStep(3);
        }

        // ─── STEP 2: Resend OTP ──────────────────────────────────────────
        protected void btnResendOTP_Click(object sender, EventArgs e)
        {
            string email = Session["FP_Email"] as string;
            if (string.IsNullOrEmpty(email))
            {
                Response.Redirect("ForgotPassword.aspx", false);
                return;
            }

            var rnd = new Random();
            string otp = rnd.Next(100000, 999999).ToString();
            Session["FP_OTP"]     = otp;
            Session["FP_OTPTime"] = DateTime.Now;

            lblOtpEmail.Text = Server.HtmlEncode(email);
            lblDemoOTP.Text  = otp;
            lblOtpError.Text = "&#10003; A new OTP has been sent.";

            ShowStep(2);
        }

        // ─── STEP 3: Reset Password ──────────────────────────────────────
        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            Page.Validate("FPGroup3");
            if (!Page.IsValid) return;

            bool verified = Session["FP_OTPVerified"] as bool? == true;
            if (!verified)
            {
                lblStep3Error.Text = "Session expired. Please start again.";
                ShowStep(1);
                return;
            }

            // In production: update the user's password in the database here.

            // Cleanup session flags
            Session.Remove("FP_OTPVerified");
            Session.Remove("FP_Email");

            ShowStep(4);
        }

        // ─── Helper: show only one step panel ────────────────────────────
        private void ShowStep(int step)
        {
            pnlStep1.Visible = (step == 1);
            pnlStep2.Visible = (step == 2);
            pnlStep3.Visible = (step == 3);
            pnlStep4.Visible = (step == 4);

            // Update step progress dots
            dot1.CssClass = step == 1 ? "step-dot active" : (step > 1 ? "step-dot done" : "step-dot");
            dot2.CssClass = step == 2 ? "step-dot active" : (step > 2 ? "step-dot done" : "step-dot");
            dot3.CssClass = step == 3 ? "step-dot active" : (step > 3 ? "step-dot done" : "step-dot");
            dot4.CssClass = step == 4 ? "step-dot active done" : "step-dot";
        }
    }
}
