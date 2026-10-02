<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="OneGovernment.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Active state styling for Contact Us link in Master Page sidebar -->
    <style>
        .portal-sidebar .nav-link[href="Home.aspx"],
        .portal-sidebar .nav-link[href="Home.aspx"].active {
            background-color: transparent !important;
            color: #475569 !important;
            font-weight: 600 !important;
        }
        .portal-sidebar .nav-link[href="Home.aspx"] svg,
        .portal-sidebar .nav-link[href="Home.aspx"].active svg {
            color: #64748b !important;
        }
        .portal-sidebar .nav-link[href="Home.aspx"]:hover {
            background-color: #f1f5f9 !important;
            color: #0f172a !important;
        }
        .portal-sidebar .nav-link[href="Home.aspx"]:hover svg {
            color: #0f172a !important;
        }
        .portal-sidebar .nav-link[href="Contact.aspx"] {
            background-color: #eff6ff !important;
            color: #1e6fd8 !important;
            font-weight: 600 !important;
        }
        .portal-sidebar .nav-link[href="Contact.aspx"] svg {
            color: #1e6fd8 !important;
        }

        /* ============================================================
           One Government Modern Contact Page Design
           ============================================================ */
        .contact-wrapper {
            max-width: 1140px;
            width: 100%;
            margin: 0;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            gap: 28px;
            padding-bottom: 40px;
        }

        /* Hero / Greeting Header */
        .contact-hero {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .contact-badge {
            align-self: flex-start;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 0.8rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: #1e6fd8;
            background: #eff6ff;
            padding: 4px 12px;
            border-radius: 999px;
            border: 1px solid #dbeafe;
        }

        .contact-heading {
            font-size: 2.35rem;
            font-weight: 800;
            color: #0f172a;
            line-height: 1.15;
            margin: 0;
            letter-spacing: -0.02em;
        }

        .contact-subheading {
            font-size: 1.18rem;
            font-weight: 700;
            color: #1e293b;
            line-height: 1.4;
            margin: 0;
        }

        .contact-lead {
            color: #64748b;
            font-size: 0.96rem;
            margin: 0;
            max-width: 720px;
            line-height: 1.55;
        }

        /* 3-Column Info Cards Grid */
        .contact-cards-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .contact-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 24px 22px;
            display: flex;
            flex-direction: column;
            gap: 14px;
            box-shadow: 0 2px 8px rgba(15, 23, 42, 0.03);
            transition: transform 0.18s ease, box-shadow 0.18s ease, border-color 0.18s ease;
        }

        .contact-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 24px rgba(15, 23, 42, 0.06);
            border-color: #cbd5e1;
        }

        .contact-card-header {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .contact-card-icon {
            width: 44px;
            height: 44px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .icon-blue-bg {
            background-color: #dbeafe;
            color: #1e6fd8;
        }

        .icon-green-bg {
            background-color: #dcfce7;
            color: #16a34a;
        }

        .icon-purple-bg {
            background-color: #ede9fe;
            color: #7c3aed;
        }

        .contact-card-title {
            font-size: 1.05rem;
            font-weight: 700;
            color: #0f172a;
            margin: 0;
        }

        .contact-card-subtitle {
            font-size: 0.82rem;
            color: #64748b;
            margin: 0;
        }

        .contact-card-body {
            font-size: 0.95rem;
            color: #334155;
            line-height: 1.6;
            flex: 1;
        }

        /* Specific Address block requirements */
        .contact-address-block {
            font-style: italic;
            color: #334155;
            line-height: 1.65;
            margin: 0;
        }

        .contact-phone-row {
            font-style: italic;
            display: block;
            margin-top: 4px;
        }

        .contact-phone-abbr {
            font-style: italic;
            text-decoration: none;
            cursor: default;
        }

        .contact-phone-link {
            color: #1e6fd8;
            font-style: italic;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.15s ease;
        }

        .contact-phone-link:hover {
            text-decoration: underline;
            color: #155ab0;
        }

        /* Support & Marketing requirements */
        .contact-channels-block {
            font-style: normal;
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin: 0;
        }

        .contact-channel-row {
            display: flex;
            align-items: baseline;
            gap: 8px;
            font-size: 0.95rem;
        }

        .contact-channel-row strong {
            font-weight: 700;
            color: #0f172a;
        }

        .contact-email-link {
            color: #1e6fd8;
            text-decoration: underline;
            font-weight: 500;
            word-break: break-all;
            transition: color 0.15s ease;
        }

        .contact-email-link:hover {
            color: #155ab0;
        }

        .card-pill-tag {
            align-self: flex-start;
            font-size: 0.76rem;
            font-weight: 600;
            padding: 3px 10px;
            border-radius: 6px;
            margin-top: auto;
        }

        .tag-active {
            background-color: #f0fdf4;
            color: #16a34a;
            border: 1px solid #bbf7d0;
        }

        .tag-info {
            background-color: #eff6ff;
            color: #2563eb;
            border: 1px solid #bfdbfe;
        }

        .tag-sla {
            background-color: #faf5ff;
            color: #7e22ce;
            border: 1px solid #e9d5ff;
        }

        /* Main Content 2-Column: Form + Quick Info */
        .contact-main-grid {
            display: grid;
            grid-template-columns: 1.6fr 1fr;
            gap: 24px;
        }

        /* Inquiry Form Container */
        .contact-form-panel {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 28px 26px;
            box-shadow: 0 2px 8px rgba(15, 23, 42, 0.03);
        }

        .panel-heading {
            font-size: 1.25rem;
            font-weight: 700;
            color: #0f172a;
            margin: 0 0 6px 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .panel-desc {
            font-size: 0.9rem;
            color: #64748b;
            margin: 0 0 22px 0;
        }

        .contact-form {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        .form-field {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .form-label {
            font-size: 0.88rem;
            font-weight: 600;
            color: #334155;
        }

        .form-control-input,
        .form-control-select,
        .form-control-textarea {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 0.93rem;
            font-family: inherit;
            color: #0f172a;
            background: #ffffff;
            box-sizing: border-box;
            transition: all 0.15s ease;
        }

        .form-control-input:focus,
        .form-control-select:focus,
        .form-control-textarea:focus {
            border-color: #3b82f6;
            outline: none;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.12);
        }

        .form-control-textarea {
            resize: vertical;
            min-height: 100px;
        }

        .form-btn-submit {
            align-self: flex-start;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background-color: #1e6fd8;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            padding: 11px 24px;
            font-size: 0.95rem;
            font-weight: 700;
            font-family: inherit;
            cursor: pointer;
            box-shadow: 0 4px 14px rgba(30, 111, 216, 0.25);
            transition: all 0.15s ease;
            margin-top: 4px;
        }

        .form-btn-submit:hover {
            background-color: #155ab0;
            transform: translateY(-1px);
            box-shadow: 0 6px 18px rgba(30, 111, 216, 0.35);
        }

        .form-btn-submit:active {
            transform: translateY(0);
        }

        /* Success Message Toast / Alert */
        .form-alert-success {
            display: none;
            background-color: #f0fdf4;
            border: 1px solid #bbf7d0;
            border-radius: 8px;
            padding: 14px 16px;
            color: #166534;
            font-size: 0.92rem;
            margin-top: 14px;
            line-height: 1.4;
        }

        /* Sidebar Info Column */
        .contact-side-info {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .info-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 22px 20px;
            box-shadow: 0 2px 8px rgba(15, 23, 42, 0.03);
        }

        .info-card-title {
            font-size: 1.05rem;
            font-weight: 700;
            color: #0f172a;
            margin: 0 0 14px 0;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .emergency-list {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .emergency-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 8px 12px;
            background: #f8fafc;
            border: 1px solid #edf2f7;
            border-radius: 8px;
            font-size: 0.9rem;
        }

        .emergency-name {
            font-weight: 600;
            color: #334155;
        }

        .emergency-number {
            font-weight: 700;
            color: #dc2626;
            background: #fee2e2;
            padding: 2px 8px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 0.88rem;
        }

        .hours-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.9rem;
        }

        .hours-table td {
            padding: 7px 0;
            border-bottom: 1px solid #f1f5f9;
            color: #475569;
        }

        .hours-table td:last-child {
            text-align: right;
            font-weight: 600;
            color: #0f172a;
        }

        .hours-table tr:last-child td {
            border-bottom: none;
        }

        /* Responsive Breakpoints */
        @media (max-width: 1024px) {
            .contact-cards-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            .contact-main-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 640px) {
            .contact-cards-grid {
                grid-template-columns: 1fr;
            }
            .form-row {
                grid-template-columns: 1fr;
            }
            .contact-heading {
                font-size: 1.95rem;
            }
            .contact-form-panel {
                padding: 20px 16px;
            }
        }
    </style>

    <div class="contact-wrapper" aria-labelledby="contactTitle">
        <!-- 1. Hero / Header Greeting -->
        <header class="contact-hero">
            <div class="contact-badge">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
                </svg>
                Citizen Assistance &amp; Help Desk
            </div>
            <h1 id="contactTitle" class="contact-heading">Contact.</h1>
            <h2 class="contact-subheading">Your contact page.</h2>
            <p class="contact-lead">
                Have questions or need assistance with government public services? Reach out directly through our regional offices, telephone helplines, or digital channels.
            </p>
        </header>

        <!-- 2. Three Featured Contact Cards -->
        <div class="contact-cards-grid">
            <!-- Card 1: Headquarters Address -->
            <div class="contact-card">
                <div class="contact-card-header">
                    <div class="contact-card-icon icon-blue-bg">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                            <circle cx="12" cy="10" r="3"></circle>
                        </svg>
                    </div>
                    <div>
                        <h3 class="contact-card-title">Headquarters</h3>
                        <p class="contact-card-subtitle">Central Government Secretariat</p>
                    </div>
                </div>

                <div class="contact-card-body">
                    <address class="contact-address-block">
                        One Microsoft Way<br />
                        Redmond, WA 98052-6399<br />
                        <span class="contact-phone-row">
                            <abbr title="Phone" class="contact-phone-abbr">P:</abbr>
                            <a href="tel:4255550100" class="contact-phone-link">425.555.0100</a>
                        </span>
                    </address>
                </div>

                <span class="card-pill-tag tag-active">Open Mon To Fri: 9am - 5pm</span>
            </div>

            <!-- Card 2: Phone Helpline -->
            <div class="contact-card">
                <div class="contact-card-header">
                    <div class="contact-card-icon icon-green-bg">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
                        </svg>
                    </div>
                    <div>
                        <h3 class="contact-card-title">Helpline Support</h3>
                        <p class="contact-card-subtitle">Direct Telephone Assistance</p>
                    </div>
                </div>

                <div class="contact-card-body">
                    <p style="margin: 0 0 8px 0; color: #475569;">Connect with an operator for urgent inquiries and application assistance:</p>
                    <div style="font-size: 1.12rem; font-weight: 700; color: #0f172a;">
                        <a href="tel:4255550100" class="contact-phone-link">425.555.0100</a>
                    </div>
                </div>

                <span class="card-pill-tag tag-info">Toll-Free 24x7 Citizen Hotline</span>
            </div>

            <!-- Card 3: Department Emails -->
            <div class="contact-card">
                <div class="contact-card-header">
                    <div class="contact-card-icon icon-purple-bg">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                            <polyline points="22,6 12,13 2,6"></polyline>
                        </svg>
                    </div>
                    <div>
                        <h3 class="contact-card-title">Email Inquiries</h3>
                        <p class="contact-card-subtitle">Official Department Desks</p>
                    </div>
                </div>

                <div class="contact-card-body">
                    <address class="contact-channels-block">
                        <div class="contact-channel-row">
                            <strong>Support:</strong>
                            <a href="mailto:Support@example.com" class="contact-email-link">Support@example.com</a>
                        </div>
                        <div class="contact-channel-row">
                            <strong>Marketing:</strong>
                            <a href="mailto:Marketing@example.com" class="contact-email-link">Marketing@example.com</a>
                        </div>
                    </address>
                </div>

                <span class="card-pill-tag tag-sla">Avg Response: Under 2 Hours</span>
            </div>
        </div>

        <!-- 3. Form and Side Information Grid -->
        <div class="contact-main-grid">
            <!-- Left: Citizen Inquiry Form -->
            <section class="contact-form-panel">
                <h3 class="panel-heading">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#1e6fd8" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
                    </svg>
                    Send Us a Message
                </h3>
                <p class="panel-desc">Submit your query or citizen feedback. Our officers review inquiries promptly.</p>

                <div class="contact-form" id="contactInquiryForm">
                    <div class="form-row">
                        <div class="form-field">
                            <label class="form-label" for="citizenName">Full Name *</label>
                            <input type="text" id="citizenName" class="form-control-input" placeholder="e.g. Ramesh Pandey" required />
                        </div>
                        <div class="form-field">
                            <label class="form-label" for="citizenEmail">Email Address *</label>
                            <input type="email" id="citizenEmail" class="form-control-input" placeholder="e.g. ramesh@example.com" required />
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-field">
                            <label class="form-label" for="departmentSelect">Target Department</label>
                            <select id="departmentSelect" class="form-control-select">
                                <option value="Support">Citizen Support Services</option>
                                <option value="Marketing">Communications &amp; Marketing</option>
                                <option value="IT">IT &amp; Digital Services Desk</option>
                                <option value="Grievance">Public Grievance Redressal</option>
                                <option value="RTO">Transport &amp; RTO Administration</option>
                            </select>
                        </div>
                        <div class="form-field">
                            <label class="form-label" for="citizenPhone">Contact Number (Optional)</label>
                            <input type="tel" id="citizenPhone" class="form-control-input" placeholder="e.g. 425-555-0100" />
                        </div>
                    </div>

                    <div class="form-field">
                        <label class="form-label" for="citizenSubject">Subject</label>
                        <input type="text" id="citizenSubject" class="form-control-input" placeholder="Brief summary of your inquiry..." />
                    </div>

                    <div class="form-field">
                        <label class="form-label" for="citizenMessage">Detailed Message *</label>
                        <textarea id="citizenMessage" class="form-control-textarea" placeholder="Explain your request, question, or reference application number..." required></textarea>
                    </div>

                    <button type="button" class="form-btn-submit" onclick="submitCitizenInquiry()">
                        <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                            <line x1="22" y1="2" x2="11" y2="13"></line>
                            <polygon points="22 2 15 22 11 13 2 9 22 2"></polygon>
                        </svg>
                        Send Message
                    </button>

                    <div id="formSuccessAlert" class="form-alert-success" role="alert">
                        <strong>Thank you!</strong> Your message has been submitted successfully to the One Government desk. A reference ticket ID has been generated: <strong>#OG-<span id="ticketNumber"></span></strong>. Our support officer will contact you shortly.
                    </div>
                </div>
            </section>

            <!-- Right: Quick Directories & Office Hours -->
            <aside class="contact-side-info">
                <!-- Emergency Directory Card -->
              <%--  <div class="info-card">
                    <h4 class="info-card-title">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#dc2626" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
                            <line x1="12" y1="9" x2="12" y2="13"></line>
                            <line x1="12" y1="17" x2="12.01" y2="17"></line>
                        </svg>
                        Emergency Hotlines
                    </h4>
                    <ul class="emergency-list">
                        <li class="emergency-item">
                            <span class="emergency-name">Police Control Room</span>
                            <a href="tel:100" class="emergency-number">100</a>
                        </li>
                        <li class="emergency-item">
                            <span class="emergency-name">Ambulance &amp; Health</span>
                            <a href="tel:108" class="emergency-number">108</a>
                        </li>
                        <li class="emergency-item">
                            <span class="emergency-name">Fire &amp; Rescue</span>
                            <a href="tel:101" class="emergency-number">101</a>
                        </li>
                        <li class="emergency-item">
                            <span class="emergency-name">Women Helpline</span>
                            <a href="tel:1091" class="emergency-number">1091</a>
                        </li>
                        <li class="emergency-item">
                            <span class="emergency-name">Disaster Management</span>
                            <a href="tel:1077" class="emergency-number">1077</a>
                        </li>
                    </ul>
                </div>

                <!-- Office Operating Hours -->
                <div class="info-card">
                    <h4 class="info-card-title">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#1e6fd8" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="12" cy="12" r="10"></circle>
                            <polyline points="12 6 12 12 16 14"></polyline>
                        </svg>
                        Working Hours
                    </h4>
                    <table class="hours-table">
                        <tbody>
                            <tr>
                                <td>Monday – Friday</td>
                                <td>9:00 AM – 6:00 PM</td>
                            </tr>
                            <tr>
                                <td>Saturday</td>
                                <td>9:00 AM – 1:00 PM</td>
                            </tr>
                            <tr>
                                <td>Sunday</td>
                                <td style="color: #64748b;">Closed</td>
                            </tr>
                            <tr>
                                <td>Digital Portal Services</td>
                                <td style="color: #16a34a;">24 / 7 Available</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </aside>
        </div>
    </div>--%>

    <!-- Interactive script for sidebar highlighting & contact inquiry submission -->
    <script type="text/javascript">
        (function () {
            function highlightActiveSidebar() {
                var sidebar = document.querySelector(".portal-sidebar");
                if (!sidebar) return;
                var links = sidebar.querySelectorAll(".nav-link");
                links.forEach(function (link) {
                    var href = link.getAttribute("href") || "";
                    if (href.indexOf("Contact.aspx") !== -1 || href === "Contact.aspx") {
                        link.classList.add("active");
                    } else {
                        link.classList.remove("active");
                    }
                });
            }

            if (document.readyState === "loading") {
                document.addEventListener("DOMContentLoaded", highlightActiveSidebar);
            } else {
                highlightActiveSidebar();
            }
        })();

        function submitCitizenInquiry() {
            var name = document.getElementById("citizenName").value.trim();
            var email = document.getElementById("citizenEmail").value.trim();
            var message = document.getElementById("citizenMessage").value.trim();
            var alertBox = document.getElementById("formSuccessAlert");
            var ticketSpan = document.getElementById("ticketNumber");

            if (!name || !email || !message) {
                alert("Please fill in your name, email address, and message.");
                return;
            }

            var randomTicket = Math.floor(100000 + Math.random() * 900000);
            ticketSpan.innerText = randomTicket;
            alertBox.style.display = "block";

            // smooth scroll into view
            alertBox.scrollIntoView({ behavior: 'smooth', block: 'nearest' });

            // Reset form fields
            document.getElementById("citizenSubject").value = "";
            document.getElementById("citizenMessage").value = "";
            document.getElementById("citizenPhone").value = "";
        }
    </script>
</asp:Content>
