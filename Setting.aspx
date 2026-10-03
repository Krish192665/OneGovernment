<%@ Page Title="Settings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Setting.aspx.cs" Inherits="OneGovernment.Setting" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* ============================================================
           Settings Layout — same as HelpSupport.aspx
           ============================================================ */
        .settings-layout {
            max-width: 860px;
            width: 100%;
            margin: 15px 0 40px 10px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        /* Page Header */
        .settings-page-header { margin-bottom: 6px; }

        .settings-page-title {
            font-size: 1.65rem;
            font-weight: 800;
            color: #0f172a;
            margin: 0 0 6px 0;
            letter-spacing: -0.02em;
        }

        .settings-page-desc {
            font-size: 0.95rem;
            color: #64748b;
            margin: 0;
            line-height: 1.5;
        }

        /* ---- Action Card (identical to help-action-card) ---- */
        .setting-card {
            background: #ffffff;
            border: 1px solid #e9ecef;
            border-radius: 12px;
            padding: 22px 28px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            cursor: pointer;
            box-shadow: 0 1px 4px rgba(15, 23, 42, 0.03);
            transition: all 0.18s ease;
            gap: 16px;
            text-decoration: none;
            color: inherit;
        }

        .setting-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 22px rgba(15, 23, 42, 0.07);
            border-color: #cbd5e1;
        }

        .setting-card-left {
            display: flex;
            align-items: center;
            gap: 22px;
        }

        .setting-card-icon {
            width: 46px;
            height: 46px;
            border-radius: 11px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .icon-profile  { background: #eff6ff; color: #1e6fd8; }
        .icon-password { background: #fef2f2; color: #dc2626; }

        .setting-card-text { display: flex; flex-direction: column; gap: 4px; }

        .setting-card-title {
            font-size: 1.1rem;
            font-weight: 700;
            color: #0f172a;
            margin: 0;
            letter-spacing: -0.01em;
        }

        .setting-card-desc {
            font-size: 0.88rem;
            color: #64748b;
            margin: 0;
            line-height: 1.45;
        }

        .setting-card-chevron {
            color: #0f172a;
            display: flex;
            align-items: center;
            flex-shrink: 0;
            transition: transform 0.15s ease;
        }

        .setting-card:hover .setting-card-chevron {
            transform: translateX(4px);
            color: #1e6fd8;
        }

        /* ---- Modal (same pattern as HelpSupport.aspx) ---- */
        .sm-overlay {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(15, 23, 42, 0.45);
            backdrop-filter: blur(3px);
            z-index: 10000;
            align-items: center;
            justify-content: center;
            padding: 20px;
            box-sizing: border-box;
        }

        .sm-box {
            background: #ffffff;
            border-radius: 14px;
            max-width: 500px;
            width: 100%;
            max-height: 90vh;
            overflow-y: auto;
            box-shadow: 0 20px 40px rgba(15, 23, 42, 0.18);
            display: flex;
            flex-direction: column;
            animation: smIn 0.2s ease-out;
        }

        .sm-profile-box { max-width: 480px; max-height: calc(100vh - 32px); }
        .sm-profile-box .sm-header { padding: 15px 20px; }
        .sm-profile-box .sm-body { gap: 13px; padding: 16px 20px; overflow-y: auto; }
        .sm-profile-box .sm-footer { padding: 12px 20px; }
        .sm-profile-box .sm-avatar-row { gap: 12px; padding: 11px 13px; }
        .sm-profile-box .sm-avatar-circle { width: 50px; height: 50px; }
        .sm-profile-box .sm-avatar-name { font-size: .93rem; }
        .sm-profile-box .sm-avatar-hint { font-size: .72rem; }

        .sm-profile-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 10px 13px;
        }

        .sm-profile-grid .sm-form-group { min-width: 0; gap: 4px; }
        .sm-profile-grid .sm-profile-wide { grid-column: 1 / -1; }
        .sm-profile-grid .sm-label { font-size: .78rem; }
        .sm-profile-grid .sm-input { min-width: 0; padding: 9px 11px; font-size: .84rem; }

        @keyframes smIn {
            from { opacity: 0; transform: scale(0.96); }
            to   { opacity: 1; transform: scale(1); }
        }

        .sm-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 24px;
            border-bottom: 1px solid #e2e8f0;
        }

        .sm-header h3 {
            margin: 0;
            font-size: 1.15rem;
            font-weight: 700;
            color: #0f172a;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .sm-close {
            background: transparent;
            border: none;
            font-size: 1.5rem;
            line-height: 1;
            color: #64748b;
            cursor: pointer;
            padding: 4px 8px;
            border-radius: 6px;
        }
        .sm-close:hover { background: #f1f5f9; color: #0f172a; }

        .sm-body {
            padding: 24px;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        /* Avatar row */
        .sm-avatar-row {
            display: flex;
            align-items: center;
            gap: 18px;
            padding: 16px;
            background: #f8fafc;
            border: 1px solid #e9ecef;
            border-radius: 10px;
        }

        .sm-avatar-circle {
            position: relative;
            width: 58px;
            height: 58px;
            background: #dbeafe;
            color: #1e6fd8;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .sm-avatar-circle svg { width: 28px; height: 28px; }

        .sm-avatar-photo,
        .sm-avatar-initials {
            position: absolute;
            inset: 0;
            width: 100%;
            height: 100%;
            border-radius: 50%;
        }

        .sm-avatar-photo { object-fit: cover; }
        .sm-avatar-photo[hidden] { display: none; }

        .sm-avatar-initials {
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 17px;
            font-weight: 750;
        }

        .sm-avatar-upload {
            position: absolute;
            right: -4px;
            bottom: -3px;
            display: flex;
            width: 25px;
            height: 25px;
            align-items: center;
            justify-content: center;
            border: 2px solid #ffffff;
            border-radius: 50%;
            background: #1e6fd8;
            color: #ffffff;
            cursor: pointer;
        }

        .sm-avatar-upload svg { width: 13px; height: 13px; }
        .sm-avatar-upload:focus-visible { outline: 3px solid #93c5fd; outline-offset: 2px; }
        .sm-avatar-file { display: none; }
        .sm-avatar-hint { margin: 4px 0 0; color: #64748b; font-size: 0.76rem; }

        .sm-avatar-info { display: flex; flex-direction: column; gap: 2px; }

        .sm-avatar-name {
            font-size: 1rem;
            font-weight: 700;
            color: #0f172a;
            margin: 0;
        }

        .sm-avatar-sub {
            font-size: 0.82rem;
            color: #94a3b8;
            margin: 0;
        }

        /* Form group */
        .sm-form-group { display: flex; flex-direction: column; gap: 6px; }

        .sm-label {
            font-size: 0.85rem;
            font-weight: 700;
            color: #334155;
        }

        .sm-input {
            width: 100%;
            padding: 11px 14px;
            border: 1px solid #e2e8f0;
            border-radius: 9px;
            font-size: 0.92rem;
            color: #0f172a;
            background: #ffffff;
            box-sizing: border-box;
            outline: none;
            transition: border-color 0.15s ease, box-shadow 0.15s ease;
            font-family: inherit;
        }

        .sm-input:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }

        .sm-input::placeholder { color: #94a3b8; }

        /* Divider label */
        .sm-divider-label {
            font-size: 0.76rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.07em;
            color: #94a3b8;
            margin: 4px 0 0 0;
        }

        /* Strength bar (password) */
        .sm-strength-bar {
            height: 4px;
            border-radius: 4px;
            background: #e2e8f0;
            margin-top: 6px;
            overflow: hidden;
        }

        .sm-strength-fill {
            height: 100%;
            border-radius: 4px;
            width: 0%;
            transition: width 0.3s ease, background 0.3s ease;
        }

        .sm-strength-text {
            font-size: 0.78rem;
            font-weight: 600;
            color: #94a3b8;
            margin: 4px 0 0 0;
        }

        /* Footer */
        .sm-footer {
            padding: 14px 24px;
            border-top: 1px solid #e2e8f0;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            background: #f8fafc;
            border-radius: 0 0 14px 14px;
        }

        .sm-btn-cancel {
            background: #ffffff;
            color: #475569;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 10px 20px;
            font-size: 0.9rem;
            font-weight: 700;
            cursor: pointer;
            font-family: inherit;
        }
        .sm-btn-cancel:hover { background: #f8fafc; border-color: #cbd5e1; }

        .sm-btn-save {
            background: #1e6fd8;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            padding: 10px 22px;
            font-size: 0.9rem;
            font-weight: 700;
            cursor: pointer;
            font-family: inherit;
        }
        .sm-btn-save:hover { background: #155ab0; }

        .sm-btn-save.danger { background: #dc2626; }
        .sm-btn-save.danger:hover { background: #b91c1c; }

        /* Error hint */
        .sm-error {
            font-size: 0.82rem;
            color: #dc2626;
            font-weight: 600;
            display: none;
            margin-top: 2px;
        }

        /* Toast */
        .sm-toast {
            position: fixed;
            bottom: 28px;
            right: 28px;
            background: #0f172a;
            color: #ffffff;
            border-radius: 10px;
            padding: 13px 20px;
            font-size: 0.9rem;
            font-weight: 600;
            box-shadow: 0 8px 24px rgba(15, 23, 42, 0.22);
            z-index: 99999;
            display: flex;
            align-items: center;
            gap: 10px;
            opacity: 0;
            transform: translateY(16px);
            transition: opacity 0.25s ease, transform 0.25s ease;
            pointer-events: none;
        }
        .sm-toast.show { opacity: 1; transform: translateY(0); }

        @media (max-width: 640px) {
            .settings-layout { margin: 10px 0 30px 0; }
            .setting-card { padding: 16px 18px; }
            .setting-card-left { gap: 14px; }
            .sm-body { padding: 18px 16px; }
            .sm-header, .sm-footer { padding: 16px; }
            .sm-profile-box { max-height: calc(100vh - 20px); }
            .sm-profile-box .sm-header { padding: 13px 16px; }
            .sm-profile-box .sm-body { padding: 13px 16px; }
            .sm-profile-box .sm-footer { padding: 11px 16px; }
        }

        @media (max-width: 420px) {
            .sm-profile-grid { grid-template-columns: minmax(0, 1fr); }
            .sm-profile-grid .sm-profile-wide { grid-column: auto; }
        }
    </style>

    <!-- ============================================================
         Page Content
         ============================================================ -->
    <div class="settings-layout" aria-labelledby="settingsTitle">

        <!-- Page Header -->
        <div class="settings-page-header">
            <h1 id="settingsTitle" class="settings-page-title">Settings</h1>
            <p class="settings-page-desc">
                Update your profile information and manage your account password.
            </p>
        </div>

        <!-- Card 1: Edit Profile -->
        <div class="setting-card" onclick="openModal('profileModal')" role="button" tabindex="0"
             aria-haspopup="dialog" aria-label="Edit Profile">
            <div class="setting-card-left">
                <div class="setting-card-icon icon-profile">
                    <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                        <circle cx="12" cy="7" r="4"></circle>
                    </svg>
                </div>
                <div class="setting-card-text">
                    <h2 class="setting-card-title">Edit Profile</h2>
                    <p class="setting-card-desc">Update your name, email address, and mobile number</p>
                </div>
            </div>
            <div class="setting-card-chevron">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                     stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                    <polyline points="9 18 15 12 9 6"></polyline>
                </svg>
            </div>
        </div>

        <!-- Card 2: Change Password -->
        <div class="setting-card" onclick="openModal('passwordModal')" role="button" tabindex="0"
             aria-haspopup="dialog" aria-label="Change Password">
            <div class="setting-card-left">
                <div class="setting-card-icon icon-password">
                    <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                        <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                    </svg>
                </div>
                <div class="setting-card-text">
                    <h2 class="setting-card-title">Change Password</h2>
                    <p class="setting-card-desc">Update your login password to keep your account secure</p>
                </div>
            </div>
            <div class="setting-card-chevron">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                     stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                    <polyline points="9 18 15 12 9 6"></polyline>
                </svg>
            </div>
        </div>

    </div>

    <!-- ============================================================
         Modal 1: Edit Profile
         ============================================================ -->
    <div id="profileModal" class="sm-overlay" role="dialog" aria-modal="true"
         aria-labelledby="profileModalTitle" onclick="closeBg(event,'profileModal')">
        <div class="sm-box sm-profile-box">

            <div class="sm-header">
                <h3 id="profileModalTitle">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#1e6fd8"
                         stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                        <circle cx="12" cy="7" r="4"></circle>
                    </svg>
                    Edit Profile
                </h3>
                <button type="button" class="sm-close" onclick="closeModal('profileModal')"
                        aria-label="Close">&times;</button>
            </div>

            <div class="sm-body">
                <!-- Avatar preview row -->
                <div class="sm-avatar-row">
                    <div class="sm-avatar-circle">
                        <span class="sm-avatar-initials" id="avatarInitials" aria-hidden="true">RP</span>
                        <img class="sm-avatar-photo" id="profilePhotoPreview" alt="" hidden>
                        <button type="button" class="sm-avatar-upload" aria-label="Choose profile photo" title="Choose profile photo" onclick="document.getElementById('profilePhotoInput').click()">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M14 4h-4L8 7H5a2 2 0 0 0-2 2v9a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2h-3z" /><circle cx="12" cy="13" r="3" /></svg>
                        </button>
                    </div>
                    <div class="sm-avatar-info">
                        <p class="sm-avatar-name" id="avatarName">Ramjibhai Pandey</p>
                        <p class="sm-avatar-sub">One Government Citizen Account</p>
                        <p class="sm-avatar-hint">Choose a photo to update your Profile.</p>
                    </div>
                </div>
                <input type="file" class="sm-avatar-file" id="profilePhotoInput" accept="image/*" onchange="handleSettingsPhoto(event)">

                <div class="sm-profile-grid">
                    <!-- Full Name -->
                    <div class="sm-form-group sm-profile-wide">
                        <label class="sm-label" for="profileName">Full Name</label>
                        <input type="text" id="profileName" class="sm-input"
                               placeholder="Enter your full name" value="Ramjibhai Pandey"
                               oninput="clearErr('profileNameErr')">
                        <span class="sm-error" id="profileNameErr">Full name is required.</span>
                    </div>

                <!-- Email -->
                <div class="sm-form-group">
                    <label class="sm-label" for="profileEmail">Email Address</label>
                    <input type="email" id="profileEmail" class="sm-input"
                              placeholder="e.g. citizen@gov.in" value="ram@gmail.com"
                           oninput="clearErr('profileEmailErr')">
                    <span class="sm-error" id="profileEmailErr">Enter a valid email address.</span>
                </div>

                <!-- Mobile -->
                <div class="sm-form-group">
                    <label class="sm-label" for="profileMobile">Mobile Number</label>
                    <input type="tel" id="profileMobile" class="sm-input"
                              placeholder="10-digit mobile number" value="9876543210"
                           maxlength="10" oninput="clearErr('profileMobileErr')">
                    <span class="sm-error" id="profileMobileErr">Enter a valid 10-digit mobile number.</span>
                </div>

                <!-- Date of Birth -->
                <div class="sm-form-group">
                    <label class="sm-label" for="profileDob">Date of Birth</label>
                    <input type="date" id="profileDob" class="sm-input" value="1969-04-15">
                </div>

                <!-- Gender -->
                <div class="sm-form-group">
                    <label class="sm-label" for="profileGender">Gender</label>
                    <select id="profileGender" class="sm-input">
                        <option value="">Select gender</option>
                        <option value="male" selected>Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                        <option value="prefer-not">Prefer not to say</option>
                    </select>
                </div>

                <div class="sm-form-group">
                    <label class="sm-label" for="profileAge">Age</label>
                    <input type="number" id="profileAge" class="sm-input" min="1" max="120" value="57" oninput="clearErr('profileAgeErr')">
                    <span class="sm-error" id="profileAgeErr">Enter an age from 1 to 120.</span>
                </div>

                <div class="sm-form-group">
                    <label class="sm-label" for="profileCategory">Category</label>
                    <select id="profileCategory" class="sm-input">
                        <option value="RTO" selected>RTO</option>
                        <option value="Aadhaar">Aadhaar</option>
                        <option value="Agriculture">Agriculture</option>
                        <option value="Banking">Banking</option>
                        <option value="Education">Education</option>
                        <option value="Health">Health</option>
                        <option value="Passport">Passport</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                </div>
            </div>

            <div class="sm-footer">
                <button type="button" class="sm-btn-cancel" onclick="closeModal('profileModal')">Cancel</button>
                <button type="button" class="sm-btn-save" onclick="saveProfile()">Save Changes</button>
            </div>

        </div>
    </div>

    <!-- ============================================================
         Modal 2: Change Password
         ============================================================ -->
    <div id="passwordModal" class="sm-overlay" role="dialog" aria-modal="true"
         aria-labelledby="passwordModalTitle" onclick="closeBg(event,'passwordModal')">
        <div class="sm-box">

            <div class="sm-header">
                <h3 id="passwordModalTitle">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#dc2626"
                         stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                        <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                    </svg>
                    Change Password
                </h3>
                <button type="button" class="sm-close" onclick="closeModal('passwordModal')"
                        aria-label="Close">&times;</button>
            </div>

            <div class="sm-body">

                <!-- Current Password -->
                <div class="sm-form-group">
                    <label class="sm-label" for="currentPwd">Current Password</label>
                    <input type="password" id="currentPwd" class="sm-input"
                           placeholder="Enter your current password"
                           autocomplete="current-password"
                           oninput="clearErr('currentPwdErr')">
                    <span class="sm-error" id="currentPwdErr">Current password is required.</span>
                </div>

                <!-- Divider -->
                <p class="sm-divider-label">New Password</p>

                <!-- New Password -->
                <div class="sm-form-group">
                    <label class="sm-label" for="newPwd">New Password</label>
                    <input type="password" id="newPwd" class="sm-input"
                           placeholder="Minimum 8 characters"
                           autocomplete="new-password"
                           oninput="checkStrength(); clearErr('newPwdErr')">
                    <span class="sm-error" id="newPwdErr">Password must be at least 8 characters.</span>
                    <!-- Strength bar -->
                    <div class="sm-strength-bar">
                        <div class="sm-strength-fill" id="strengthFill"></div>
                    </div>
                    <p class="sm-strength-text" id="strengthLabel">Strength: </p>
                </div>

                <!-- Confirm Password -->
                <div class="sm-form-group">
                    <label class="sm-label" for="confirmPwd">Confirm New Password</label>
                    <input type="password" id="confirmPwd" class="sm-input"
                           placeholder="Repeat new password"
                           autocomplete="new-password"
                           oninput="clearErr('confirmPwdErr')">
                    <span class="sm-error" id="confirmPwdErr">Passwords do not match.</span>
                </div>

                <!-- Tip -->
                <%--<div style="background:#f0fdf4;border:1px solid #bbf7d0;border-radius:8px;padding:10px 14px;font-size:0.83rem;color:#166534;line-height:1.5;">
                     Use a mix of uppercase, lowercase, numbers, and symbols for a strong password.
                </div>--%>

            </div>

            <div class="sm-footer">
                <button type="button" class="sm-btn-cancel" onclick="closeModal('passwordModal')">Cancel</button>
                <button type="button" class="sm-btn-save danger" onclick="savePassword()">Update Password</button>
            </div>

        </div>
    </div>

    <!-- Toast -->
    <div id="smToast" class="sm-toast" role="status" aria-live="polite">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#4ade80"
             stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
            <polyline points="20 6 9 17 4 12"></polyline>
        </svg>
        <span id="smToastMsg">Saved</span>
    </div>

    <!-- ============================================================
         Scripts
         ============================================================ -->
    <script type="text/javascript">

        var _profilePhotoData = "";

        /* ---- Modal helpers ---- */
        function openModal(id) {
            if (id === "profileModal") loadProfileDetails();
            document.getElementById(id).style.display = "flex";
        }

        function closeModal(id) {
            document.getElementById(id).style.display = "none";
        }

        function closeBg(e, id) {
            if (e.target.id === id) closeModal(id);
        }

        /* ---- Toast ---- */
        var _tt;
        function showToast(msg) {
            var t = document.getElementById("smToast");
            document.getElementById("smToastMsg").textContent = msg;
            t.classList.add("show");
            clearTimeout(_tt);
            _tt = setTimeout(function () { t.classList.remove("show"); }, 3000);
        }

        /* ---- Error helpers ---- */
        function showErr(id, msg) {
            var el = document.getElementById(id);
            el.textContent = msg;
            el.style.display = "block";
        }

        function clearErr(id) {
            document.getElementById(id).style.display = "none";
        }

        function loadProfileDetails() {
            try {
                var details = JSON.parse(localStorage.getItem("oneGovernmentProfile") || "null");
                if (!details) {
                    _profilePhotoData = "";
                    setSettingsAvatar("", document.getElementById("profileName").value);
                    return;
                }
                if (details.name) document.getElementById("profileName").value = details.name;
                if (details.email) document.getElementById("profileEmail").value = details.email;
                if (details.mobile) document.getElementById("profileMobile").value = details.mobile;
                if (details.dob) document.getElementById("profileDob").value = details.dob;
                if (details.gender) document.getElementById("profileGender").value = details.gender;
                if (details.age) document.getElementById("profileAge").value = details.age;
                if (details.category) document.getElementById("profileCategory").value = details.category;
                document.getElementById("avatarName").textContent = details.name || "Ramjibhai Pandey";
                _profilePhotoData = details.photo || "";
                setSettingsAvatar(_profilePhotoData, details.name || "Ramjibhai Pandey");
            } catch (error) {
            }
        }

        function setSettingsAvatar(photo, name) {
            var initialsElement = document.getElementById("avatarInitials");
            var photoElement = document.getElementById("profilePhotoPreview");
            name = (name || "Guest User").trim() || "Guest User";
            var words = name.split(/\s+/).filter(Boolean);
            var initials = words.length > 1
                ? words[0].charAt(0) + words[words.length - 1].charAt(0)
                : words[0].substring(0, 2);
            var palette = [
                ["#dbeafe", "#1e40af"], ["#dcfce7", "#166534"], ["#fef3c7", "#92400e"],
                ["#fce7f3", "#9d174d"], ["#e0e7ff", "#3730a3"]
            ];
            var colorIndex = 0;
            for (var index = 0; index < name.length; index++)
                colorIndex = (colorIndex + name.charCodeAt(index)) % palette.length;

            initialsElement.textContent = initials.toUpperCase();
            initialsElement.style.backgroundColor = palette[colorIndex][0];
            initialsElement.style.color = palette[colorIndex][1];
            photoElement.hidden = !photo;
            initialsElement.hidden = !!photo;
            if (photo) photoElement.src = photo;
        }

        function handleSettingsPhoto(event) {
            var file = event.target.files && event.target.files[0];
            if (!file) return;
            if (!file.type || file.type.indexOf("image/") !== 0 || file.size > 8 * 1024 * 1024) {
                showToast("Choose an image smaller than 8 MB.");
                event.target.value = "";
                return;
            }

            var reader = new FileReader();
            reader.onload = function () {
                var sourceImage = new Image();
                sourceImage.onload = function () {
                    var cropSize = Math.min(sourceImage.naturalWidth, sourceImage.naturalHeight);
                    var cropX = (sourceImage.naturalWidth - cropSize) / 2;
                    var cropY = (sourceImage.naturalHeight - cropSize) / 2;
                    var canvas = document.createElement("canvas");
                    canvas.width = 256;
                    canvas.height = 256;
                    canvas.getContext("2d").drawImage(sourceImage, cropX, cropY, cropSize, cropSize, 0, 0, 256, 256);
                    _profilePhotoData = canvas.toDataURL("image/jpeg", 0.82);
                    setSettingsAvatar(_profilePhotoData, document.getElementById("profileName").value);
                    event.target.value = "";
                };
                sourceImage.onerror = function () {
                    showToast("This image could not be opened.");
                    event.target.value = "";
                };
                sourceImage.src = reader.result;
            };
            reader.onerror = function () {
                showToast("This image could not be read.");
                event.target.value = "";
            };
            reader.readAsDataURL(file);
        }

        /* ---- Save Profile ---- */
        function saveProfile() {
            var name   = document.getElementById("profileName").value.trim();
            var email  = document.getElementById("profileEmail").value.trim();
            var mobile = document.getElementById("profileMobile").value.trim();
            var age    = Number(document.getElementById("profileAge").value);
            var valid  = true;

            if (!name) {
                showErr("profileNameErr", "Full name is required."); valid = false;
            }
            if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                showErr("profileEmailErr", "Enter a valid email address."); valid = false;
            }
            if (!mobile || !/^\d{10}$/.test(mobile)) {
                showErr("profileMobileErr", "Enter a valid 10-digit mobile number."); valid = false;
            }
            if (!Number.isInteger(age) || age < 1 || age > 120) {
                showErr("profileAgeErr", "Enter an age from 1 to 120."); valid = false;
            }
            if (!valid) return;

            var previousDetails = {};
            try {
                previousDetails = JSON.parse(localStorage.getItem("oneGovernmentProfile") || "{}") || {};
            } catch (error) {
            }

            var details = {
                name: name,
                email: email,
                mobile: mobile,
                dob: document.getElementById("profileDob").value,
                gender: document.getElementById("profileGender").value,
                age: String(age),
                category: document.getElementById("profileCategory").value,
                photo: _profilePhotoData || previousDetails.photo || ""
            };

            try {
                localStorage.setItem("oneGovernmentProfile", JSON.stringify(details));
            } catch (error) {
                showToast("Unable to save profile in this browser.");
                return;
            }

            // Update avatar name preview
            document.getElementById("avatarName").textContent = name;
            setSettingsAvatar(details.photo, name);

            closeModal("profileModal");
            showToast("Profile updated successfully ✓");
        }

        /* ---- Password strength ---- */
        function checkStrength() {
            var pwd  = document.getElementById("newPwd").value;
            var fill = document.getElementById("strengthFill");
            var lbl  = document.getElementById("strengthLabel");

            if (!pwd) {
                fill.style.width = "0%";
                lbl.textContent = "Strength: —";
                lbl.style.color = "#94a3b8";
                return;
            }

            var score = 0;
            if (pwd.length >= 8)  score++;
            if (pwd.length >= 12) score++;
            if (/[A-Z]/.test(pwd)) score++;
            if (/[0-9]/.test(pwd)) score++;
            if (/[^A-Za-z0-9]/.test(pwd)) score++;

            var levels = [
                { w: "20%", color: "#ef4444", text: "Weak" },
                { w: "40%", color: "#f97316", text: "Fair" },
                { w: "60%", color: "#eab308", text: "Good" },
                { w: "80%", color: "#22c55e", text: "Strong" },
                { w: "100%",color: "#16a34a", text: "Very Strong" }
            ];

            var lvl = levels[Math.min(score - 1, 4)];
            if (score === 0) lvl = levels[0];

            fill.style.width  = lvl.w;
            fill.style.background = lvl.color;
            lbl.textContent = "Strength: " + lvl.text;
            lbl.style.color = lvl.color;
        }

        /* ---- Save Password ---- */
        function savePassword() {
            var curr    = document.getElementById("currentPwd").value.trim();
            var newPwd  = document.getElementById("newPwd").value;
            var confirm = document.getElementById("confirmPwd").value;
            var valid   = true;

            if (!curr) {
                showErr("currentPwdErr", "Current password is required."); valid = false;
            }
            if (!newPwd || newPwd.length < 8) {
                showErr("newPwdErr", "Password must be at least 8 characters."); valid = false;
            }
            if (newPwd !== confirm) {
                showErr("confirmPwdErr", "Passwords do not match."); valid = false;
            }
            if (!valid) return;

            // Reset fields
            document.getElementById("currentPwd").value = "";
            document.getElementById("newPwd").value     = "";
            document.getElementById("confirmPwd").value = "";
            document.getElementById("strengthFill").style.width = "0%";
            document.getElementById("strengthLabel").textContent = "Strength: —";

            closeModal("passwordModal");
            showToast("Password updated successfully ✓");
        }

        /* ---- Keyboard accessibility for cards ---- */
        document.querySelectorAll(".setting-card[tabindex]").forEach(function (card) {
            card.addEventListener("keydown", function (e) {
                if (e.key === "Enter" || e.key === " ") {
                    e.preventDefault();
                    card.click();
                }
            });
        });
    </script>
</asp:Content>
