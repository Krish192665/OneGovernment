<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="OneGovernment.Profile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* ============================================================
           Profile Page Layout
           ============================================================ */
        .profile-layout {
            max-width: 780px;
            width: 100%;
            margin: 15px 0 40px 10px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        /* ---- Profile Hero Card ---- */
        .profile-hero-card {
            background: #ffffff;
            border: 1px solid #e9ecef;
            border-radius: 14px;
            padding: 28px 28px 24px 28px;
            display: flex;
            align-items: center;
            gap: 24px;
            box-shadow: 0 1px 6px rgba(15, 23, 42, 0.04);
        }

        /* Avatar */
        .profile-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: #dbeafe;
            color: #1e6fd8;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            box-shadow: 0 2px 8px rgba(30, 111, 216, 0.15);
        }

        .profile-avatar svg { width: 40px; height: 40px; }

        /* Name & meta */
        .profile-hero-info { flex: 1; min-width: 0; }

        .profile-name {
            font-size: 1.5rem;
            font-weight: 800;
            color: #0f172a;
            margin: 0 0 4px 0;
            letter-spacing: -0.02em;
        }

        .profile-email {
            font-size: 0.9rem;
            color: #64748b;
            margin: 0 0 10px 0;
        }

        /* Status badge */
        .profile-status-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 0.78rem;
            font-weight: 700;
            color: #16a34a;
            background: #dcfce7;
            border: 1px solid #bbf7d0;
            padding: 3px 11px;
            border-radius: 999px;
        }

        .profile-status-dot {
            width: 6px;
            height: 6px;
            background: #16a34a;
            border-radius: 50%;
        }

        /* Edit profile button */
        .profile-edit-btn {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 9px 18px;
            background: #eff6ff;
            color: #1e6fd8;
            border: 1px solid #bfdbfe;
            border-radius: 9px;
            font-size: 0.88rem;
            font-weight: 700;
            cursor: pointer;
            text-decoration: none;
            flex-shrink: 0;
            transition: all 0.15s ease;
            font-family: inherit;
        }

        .profile-edit-btn:hover {
            background: #dbeafe;
            border-color: #93c5fd;
            transform: translateY(-1px);
        }

        /* ---- Info Section Card ---- */
        .profile-section-card {
            background: #ffffff;
            border: 1px solid #e9ecef;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 1px 4px rgba(15, 23, 42, 0.03);
        }

        .profile-section-header {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 16px 22px;
            border-bottom: 1px solid #f1f5f9;
            background: #fafbfc;
        }

        .profile-section-icon {
            width: 34px;
            height: 34px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .icon-info     { background: #eff6ff; color: #1e6fd8; }
        .icon-activity { background: #f0fdf4; color: #16a34a; }

        .profile-section-title {
            font-size: 0.98rem;
            font-weight: 700;
            color: #0f172a;
            margin: 0;
        }

        /* Info rows */
        .profile-info-row {
            display: flex;
            align-items: center;
            padding: 14px 22px;
            border-bottom: 1px solid #f8fafc;
            gap: 12px;
        }

        .profile-info-row:last-child { border-bottom: none; }

        .profile-info-icon {
            width: 32px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            color: #94a3b8;
        }

        .profile-info-label {
            font-size: 0.8rem;
            font-weight: 700;
            color: #94a3b8;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            margin: 0 0 2px 0;
        }

        .profile-info-value {
            font-size: 0.92rem;
            font-weight: 600;
            color: #1e293b;
            margin: 0;
        }

        /* Activity list */
        .profile-activity-item {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 13px 22px;
            border-bottom: 1px solid #f8fafc;
        }

        .profile-activity-item:last-child { border-bottom: none; }

        .activity-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            flex-shrink: 0;
        }

        .activity-dot.green  { background: #22c55e; }
        .activity-dot.blue   { background: #3b82f6; }
        .activity-dot.amber  { background: #f59e0b; }

        .activity-text {
            flex: 1;
            font-size: 0.88rem;
            font-weight: 600;
            color: #1e293b;
            margin: 0;
        }

        .activity-time {
            font-size: 0.78rem;
            color: #94a3b8;
            white-space: nowrap;
            flex-shrink: 0;
        }

        /* ---- Quick Links row ---- */
        .profile-quick-links {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
        }

        .profile-quick-card {
            background: #ffffff;
            border: 1px solid #e9ecef;
            border-radius: 12px;
            padding: 18px 20px;
            display: flex;
            align-items: center;
            gap: 14px;
            cursor: pointer;
            text-decoration: none;
            color: inherit;
            box-shadow: 0 1px 4px rgba(15, 23, 42, 0.03);
            transition: all 0.16s ease;
        }

        .profile-quick-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(15, 23, 42, 0.06);
            border-color: #cbd5e1;
        }

        .quick-icon {
            width: 40px;
            height: 40px;
            border-radius: 9px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .quick-icon.settings-ic { background: #f5f3ff; color: #7c3aed; }
        .quick-icon.help-ic     { background: #fff7ed; color: #ea580c; }

        .quick-label {
            font-size: 0.9rem;
            font-weight: 700;
            color: #0f172a;
            margin: 0 0 2px 0;
        }

        .quick-sub {
            font-size: 0.78rem;
            color: #94a3b8;
            margin: 0;
        }

        @media (max-width: 640px) {
            .profile-layout  { margin: 10px 0 30px 0; }
            .profile-hero-card { flex-direction: column; align-items: flex-start; }
            .profile-quick-links { grid-template-columns: 1fr; }
            .profile-name { font-size: 1.3rem; }
        }
    </style>

    <div class="profile-layout" aria-labelledby="profileTitle">

        <!-- ====================================================
             Hero Card — Avatar + Name + Status
             ==================================================== -->
        <div class="profile-hero-card">
            <!-- Avatar -->
            <div class="profile-avatar" aria-hidden="true">
                <svg viewBox="0 0 24 24" fill="currentColor">
                    <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                </svg>
            </div>

            <!-- Name & details -->
            <div class="profile-hero-info">
                <h1 id="profileTitle" class="profile-name">Ramesh Pandey</h1>
                <p class="profile-email">ramesh.pandey@gov.in</p>
               <%-- <span class="profile-status-badge">
                    <span class="profile-status-dot"></span>
                    Verified Citizen Account
                </span>--%>
            </div>

            <!-- Edit button -->
            <a href="Setting.aspx" class="profile-edit-btn" aria-label="Edit profile in Settings">
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                     stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                </svg>
                Edit Profile
            </a>
        </div>

        <!-- ====================================================
             Personal Information Card
             ==================================================== -->
        <div class="profile-section-card">
            <div class="profile-section-header">
                <div class="profile-section-icon icon-info">
                    <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"></circle>
                        <line x1="12" y1="16" x2="12" y2="12"></line>
                        <line x1="12" y1="8" x2="12.01" y2="8"></line>
                    </svg>
                </div>
                <p class="profile-section-title">Personal Information</p>
            </div>

            <!-- Full Name -->
            <div class="profile-info-row">
                <div class="profile-info-icon">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                        <circle cx="12" cy="7" r="4"></circle>
                    </svg>
                </div>
                <div>
                    <p class="profile-info-label">Full Name</p>
                    <p class="profile-info-value">Ramesh Pandey</p>
                </div>
            </div>

            <!-- Email -->
            <div class="profile-info-row">
                <div class="profile-info-icon">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                        <polyline points="22,6 12,13 2,6"></polyline>
                    </svg>
                </div>
                <div>
                    <p class="profile-info-label">Email Address</p>
                    <p class="profile-info-value">ramesh.pandey@gov.in</p>
                </div>
            </div>

            <!-- Mobile -->
            <div class="profile-info-row">
                <div class="profile-info-icon">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="5" y="2" width="14" height="20" rx="2" ry="2"></rect>
                        <line x1="12" y1="18" x2="12.01" y2="18"></line>
                    </svg>
                </div>
                <div>
                    <p class="profile-info-label">Mobile Number</p>
                    <p class="profile-info-value">+91 98765 43210</p>
                </div>
            </div>

            <!-- Date of Birth -->
            <div class="profile-info-row">
                <div class="profile-info-icon">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                        <line x1="16" y1="2" x2="16" y2="6"></line>
                        <line x1="8" y1="2" x2="8" y2="6"></line>
                        <line x1="3" y1="10" x2="21" y2="10"></line>
                    </svg>
                </div>
                <div>
                    <p class="profile-info-label">Date of Birth</p>
                    <p class="profile-info-value">15 April 1990</p>
                </div>
            </div>

            <!-- Gender -->
            <div class="profile-info-row">
                <div class="profile-info-icon">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="4"></circle>
                        <line x1="12" y1="2" x2="12" y2="8"></line>
                        <line x1="12" y1="16" x2="12" y2="22"></line>
                        <line x1="4.93" y1="4.93" x2="7.76" y2="7.76"></line>
                    </svg>
                </div>
                <div>
                    <p class="profile-info-label">Gender</p>
                    <p class="profile-info-value">Male</p>
                </div>
            </div>

            <!-- Citizen ID -->
            <%--<div class="profile-info-row">
                <div class="profile-info-icon">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="2" y="5" width="20" height="14" rx="2"></rect>
                        <line x1="2" y1="10" x2="22" y2="10"></line>
                    </svg>
                </div>
                <div>
                    <p class="profile-info-label">Citizen ID</p>
                    <p class="profile-info-value">OGV-2024-100432</p>
                </div>
            </div>

            <!-- Member Since -->
            <div class="profile-info-row">
                <div class="profile-info-icon">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"></circle>
                        <polyline points="12 6 12 12 16 14"></polyline>
                    </svg>
                </div>
                <div>
                    <p class="profile-info-label">Member Since</p>
                    <p class="profile-info-value">January 2024</p>
                </div>
            </div>--%>
        </div>

        <!-- ====================================================
             Recent Activity Card
             ==================================================== -->
       <%-- <div class="profile-section-card">
            <div class="profile-section-header">
                <div class="profile-section-icon icon-activity">
                    <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"></polyline>
                    </svg>
                </div>
                <p class="profile-section-title">Recent Activity</p>
            </div>

            <div class="profile-activity-item">
                <span class="activity-dot green"></span>
                <p class="activity-text">Logged in successfully</p>
                <span class="activity-time">Today, 10:14 AM</span>
            </div>
            <div class="profile-activity-item">
                <span class="activity-dot blue"></span>
                <p class="activity-text">Submitted RTO Driving Licence application</p>
                <span class="activity-time">Yesterday, 3:45 PM</span>
            </div>
            <div class="profile-activity-item">
                <span class="activity-dot amber"></span>
                <p class="activity-text">Viewed Passport Seva service guide</p>
                <span class="activity-time">2 days ago</span>
            </div>
            <div class="profile-activity-item">
                <span class="activity-dot blue"></span>
                <p class="activity-text">Updated profile information</p>
                <span class="activity-time">5 days ago</span>
            </div>
            <div class="profile-activity-item">
                <span class="activity-dot green"></span>
                <p class="activity-text">Account verified successfully</p>
                <span class="activity-time">Jan 2024</span>
            </div>
        </div>--%>

        <!-- ====================================================
             Quick Links Row
             ==================================================== -->
        <div class="profile-quick-links">
            <a href="Setting.aspx" class="profile-quick-card">
                <div class="quick-icon settings-ic">
                    <svg width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="3"></circle>
                        <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83
                                 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33
                                 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-4 0v-.09
                                 A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06
                                 a2 2 0 0 1-2.83-2.83l.06-.06A1.65 1.65 0 0 0 4.6 15
                                 a1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1 0-4h.09
                                 A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06
                                 a2 2 0 0 1 2.83-2.83l.06.06A1.65 1.65 0 0 0 9 4.6
                                 a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 4 0v.09
                                 a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06
                                 a2 2 0 0 1 2.83 2.83l-.06.06A1.65 1.65 0 0 0 19.4 9
                                 a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 0 4h-.09
                                 a1.65 1.65 0 0 0-1.51 1z"></path>
                    </svg>
                </div>
                <div>
                    <p class="quick-label">Settings</p>
                    <p class="quick-sub">Edit profile &amp; change password</p>
                </div>
            </a>

            <a href="HelpSupport.aspx" class="profile-quick-card">
                <div class="quick-icon help-ic">
                    <svg width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"></circle>
                        <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                        <line x1="12" y1="17" x2="12.01" y2="17"></line>
                    </svg>
                </div>
                <div>
                    <p class="quick-label">Help &amp; Support</p>
                    <p class="quick-sub">FAQs, guides &amp; contact support</p>
                </div>
            </a>
        </div>

    </div>

</asp:Content>
