<%@ Page Title="Help & Support" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HelpSupport.aspx.cs" Inherits="OneGovernment.HelpSupport" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Active state styling for Help & Support in Master Page sidebar -->
    <style>
        .portal-sidebar .nav-link[href*="Home.aspx"],
        .portal-sidebar .nav-link[href*="Home.aspx"].active {
            background-color: transparent !important;
            color: #475569 !important;
            font-weight: 600 !important;
        }
        .portal-sidebar .nav-link[href*="Home.aspx"] svg,
        .portal-sidebar .nav-link[href*="Home.aspx"].active svg {
            color: #64748b !important;
        }
        .portal-sidebar .nav-link[href*="Home.aspx"]:hover {
            background-color: #f1f5f9 !important;
            color: #0f172a !important;
        }
        .portal-sidebar .nav-link[href*="Home.aspx"]:hover svg {
            color: #0f172a !important;
        }
        .portal-sidebar .nav-link[href*="HelpSupport.aspx"] {
            background-color: transparent !important;
            color: #1e6fd8 !important;
            font-weight: 700 !important;
        }
        .portal-sidebar .nav-link[href*="HelpSupport.aspx"] svg {
            color: #1e6fd8 !important;
            fill: #1e6fd8 !important;
        }

        /* ============================================================
           Help & Support Layout with Website-Specific Descriptions
           (No ratings or review widgets)
           ============================================================ */
        .help-support-layout {
            max-width: 860px;
            width: 100%;
            margin: 15px 0 40px 10px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        /* Page Greeting Header */
        .help-page-header {
            margin-bottom: 6px;
        }

        .help-page-title {
            font-size: 1.65rem;
            font-weight: 800;
            color: #0f172a;
            margin: 0 0 6px 0;
            letter-spacing: -0.02em;
        }

        .help-page-desc {
            font-size: 0.95rem;
            color: #64748b;
            margin: 0;
            line-height: 1.5;
        }

        /* Clean White Action Cards with Descriptions */
        .help-action-card {
            background: #ffffff;
            border: 1px solid #e9ecef;
            border-radius: 12px;
            padding: 22px 28px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            text-decoration: none;
            color: inherit;
            cursor: pointer;
            box-shadow: 0 1px 4px rgba(15, 23, 42, 0.03);
            transition: all 0.18s ease;
            gap: 16px;
        }

        .help-action-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 22px rgba(15, 23, 42, 0.07);
            border-color: #cbd5e1;
        }

        .help-card-left {
            display: flex;
            align-items: center;
            gap: 22px;
        }

        .help-card-icon {
            width: 36px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #0f172a;
            flex-shrink: 0;
        }

        .icon-question-mark {
            font-size: 30px;
            font-weight: 900;
            line-height: 1;
            font-family: Arial, sans-serif;
            color: #0f172a;
        }

        .help-card-text {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .help-card-title {
            font-size: 1.12rem;
            font-weight: 700;
            color: #0f172a;
            margin: 0;
            letter-spacing: -0.01em;
        }

        .help-card-desc {
            font-size: 0.88rem;
            color: #64748b;
            margin: 0;
            line-height: 1.45;
        }

        .help-card-chevron {
            color: #0f172a;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            transition: transform 0.15s ease;
        }

        .help-action-card:hover .help-card-chevron {
            transform: translateX(4px);
            color: #1e6fd8;
        }

        /* Bottom Blue Banner Card */
        .still-help-card {
            background: #eff6ff;
            border: 1.5px solid #60a5fa;
            border-radius: 12px;
            padding: 24px 28px;
            display: flex;
            align-items: center;
            gap: 22px;
            text-decoration: none;
            color: inherit;
            cursor: pointer;
            margin-top: 10px;
            box-shadow: 0 2px 6px rgba(37, 99, 235, 0.05);
            transition: all 0.18s ease;
        }

        .still-help-card:hover {
            transform: translateY(-2px);
            background: #e0f2fe;
            border-color: #3b82f6;
            box-shadow: 0 8px 20px rgba(37, 99, 235, 0.12);
        }

        .still-help-icon {
            width: 36px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #2563eb;
            flex-shrink: 0;
        }

        .still-help-content {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .still-help-title {
            font-size: 1.15rem;
            font-weight: 700;
            color: #2563eb;
            margin: 0;
            line-height: 1.2;
        }

        .still-help-subtitle {
            font-size: 0.88rem;
            color: #64748b;
            margin: 0;
            line-height: 1.4;
        }

        /* ============================================================
           Interactive Drawer Modal for In-Depth Explanations
           ============================================================ */
        .help-modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(15, 23, 42, 0.45);
            backdrop-filter: blur(3px);
            z-index: 10000;
            align-items: center;
            justify-content: center;
            padding: 20px;
            box-sizing: border-box;
        }

        .help-modal-box {
            background: #ffffff;
            border-radius: 14px;
            max-width: 700px;
            width: 100%;
            max-height: 85vh;
            overflow-y: auto;
            box-shadow: 0 20px 40px rgba(15, 23, 42, 0.18);
            display: flex;
            flex-direction: column;
            animation: modalFadeIn 0.2s ease-out;
        }

        @keyframes modalFadeIn {
            from { opacity: 0; transform: scale(0.96); }
            to { opacity: 1; transform: scale(1); }
        }

        .modal-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 24px;
            border-bottom: 1px solid #e2e8f0;
        }

        .modal-header h3 {
            margin: 0;
            font-size: 1.25rem;
            font-weight: 700;
            color: #0f172a;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .modal-close-btn {
            background: transparent;
            border: none;
            font-size: 1.5rem;
            line-height: 1;
            color: #64748b;
            cursor: pointer;
            padding: 4px 8px;
            border-radius: 6px;
        }

        .modal-close-btn:hover {
            color: #0f172a;
            background: #f1f5f9;
        }

        .modal-body {
            padding: 24px;
            font-size: 0.95rem;
            color: #334155;
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .modal-faq-item {
            background: #f8fafc;
            border: 1px solid #edf2f7;
            border-radius: 8px;
            padding: 14px 16px;
        }

        .modal-faq-item strong {
            display: block;
            color: #0f172a;
            margin-bottom: 6px;
            font-size: 0.98rem;
        }

        .modal-step-list {
            margin: 0;
            padding-left: 20px;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .modal-step-list li strong {
            color: #0f172a;
        }

        .sectors-badge-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
            margin: 10px 0;
        }

        .sector-badge-item {
            background: #f1f5f9;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
            padding: 8px 12px;
            font-size: 0.88rem;
            font-weight: 600;
            color: #1e293b;
        }

        .modal-footer {
            padding: 14px 24px;
            border-top: 1px solid #e2e8f0;
            display: flex;
            justify-content: flex-end;
            background: #f8fafc;
            border-radius: 0 0 14px 14px;
        }

        .modal-btn-primary {
            background: #1e6fd8;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            padding: 9px 18px;
            font-size: 0.92rem;
            font-weight: 700;
            cursor: pointer;
            text-decoration: none;
        }

        .modal-btn-primary:hover {
            background: #155ab0;
        }

        @media (max-width: 640px) {
            .help-support-layout {
                margin: 10px 0 30px 0;
            }
            .help-action-card {
                padding: 18px 20px;
                gap: 12px;
            }
            .help-card-left {
                gap: 16px;
            }
            .still-help-card {
                padding: 18px 20px;
            }
            .sectors-badge-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>

    <div class="help-support-layout" aria-labelledby="helpTitle">
        <!-- Header Introduction -->
        <div class="help-page-header">
            <h1 id="helpTitle" class="help-page-title">Help &amp; Support</h1>
            <p class="help-page-desc">
                Find answers, explore service guides, and get assistance with all One Government digital services.
            </p>
        </div>

        <!-- Card 1: FAQs -->
        <div class="help-action-card" onclick="openHelpModal('faqs')" role="button" tabindex="0">
            <div class="help-card-left">
                <div class="help-card-icon">
                    <span class="icon-question-mark">?</span>
                </div>
                <div class="help-card-text">
                    <h2 class="help-card-title">FAQs</h2>
                    <p class="help-card-desc">Frequently asked questions about services, citizen account, and application tracking</p>
                </div>
            </div>
            <div class="help-card-chevron">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                    <polyline points="9 18 15 12 9 6"></polyline>
                </svg>
            </div>
        </div>

        <!-- Card 2: User Guide -->
        <div class="help-action-card" onclick="openHelpModal('userGuide')" role="button" tabindex="0">
            <div class="help-card-left">
                <div class="help-card-icon">
                    <svg width="26" height="26" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M21 5c-1.11-.35-2.33-.5-3.5-.5-1.95 0-4.05.4-5.5 1.5-1.45-1.1-3.55-1.5-5.5-1.5S2.45 4.9 1 6v14.65c0 .25.25.5.5.5.1 0 .15-.05.25-.05C3.1 20.45 5.05 20 6.5 20c1.95 0 4.05.4 5.5 1.5 1.35-.85 3.8-1.5 5.5-1.5 1.65 0 3.35.3 4.75 1.05.1.05.15.05.25.05.25 0 .5-.25.5-.5V6c-.6-.45-1.25-.75-2-1zm-1 13c-1.05-.3-2.3-.5-3.5-.5-1.7 0-4.15.65-5.5 1.5V8c1.35-.85 3.8-1.5 5.5-1.5 1.2 0 2.45.15 3.5.5v11z"/>
                    </svg>
                </div>
                <div class="help-card-text">
                    <h2 class="help-card-title">User Guide</h2>
                    <p class="help-card-desc">Learn how to navigate the 12 service categories, search from the header, and explore Overview, Links, Documents, and Demo Forms</p>
                </div>
            </div>
            <div class="help-card-chevron">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                    <polyline points="9 18 15 12 9 6"></polyline>
                </svg>
            </div>
        </div>

        <!-- Card 3: How to Apply -->
        <div class="help-action-card" onclick="openHelpModal('howToApply')" role="button" tabindex="0">
            <div class="help-card-left">
                <div class="help-card-icon">
                    <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                </div>
                <div class="help-card-text">
                    <h2 class="help-card-title">How to Apply</h2>
                    <p class="help-card-desc">Step-by-step workflow: browse categories, review required documents, preview the demo form, and complete your application</p>
                </div>
            </div>
            <div class="help-card-chevron">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                    <polyline points="9 18 15 12 9 6"></polyline>
                </svg>
            </div>
        </div>

        <!-- Card 4: Contact Support -->
        <a href="Contact.aspx" class="help-action-card">
            <div class="help-card-left">
                <div class="help-card-icon">
                    <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M3 18v-6a9 9 0 0 1 18 0v6"></path>
                        <path d="M21 19a2 2 0 0 1-2 2h-1a2 2 0 0 1-2-2v-3a2 2 0 0 1 2-2h3zM3 19a2 2 0 0 0 2 2h1a2 2 0 0 0 2-2v-3a2 2 0 0 0-2-2H3z"></path>
                    </svg>
                </div>
                <div class="help-card-text">
                    <h2 class="help-card-title">Contact Support</h2>
                    <p class="help-card-desc">Reach out to the One Government central secretariat at One Microsoft Way, call 425.555.0100, or send an inquiry</p>
                </div>
            </div>
            <div class="help-card-chevron">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                    <polyline points="9 18 15 12 9 6"></polyline>
                </svg>
            </div>
        </a>

        <!-- Bottom Banner: Still need help ? -->
       <%-- <a href="Contact.aspx" class="still-help-card">
            <div class="still-help-icon">
                <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M3 18v-6a9 9 0 0 1 18 0v6"></path>
                    <path d="M21 19a2 2 0 0 1-2 2h-1a2 2 0 0 1-2-2v-3a2 2 0 0 1 2-2h3zM3 19a2 2 0 0 0 2 2h1a2 2 0 0 0 2-2v-3a2 2 0 0 0-2-2H3z"></path>
                </svg>
            </div>
            <div class="still-help-content">
                <h3 class="still-help-title">Still need help ?</h3>
                <p class="still-help-subtitle">Contact our support team for any portal assistance or department inquiry</p>
            </div>
        </a>--%>
    </div>

    <!-- ==============================================================
         Interactive Content Modal
         ============================================================== -->
    <div id="helpModal" class="help-modal-overlay" onclick="closeHelpModalOnBg(event)">
        <div class="help-modal-box">
            <div class="modal-header">
                <h3 id="modalTitle">Help Topic</h3>
                <button type="button" class="modal-close-btn" onclick="closeHelpModal()">&times;</button>
            </div>
            <div class="modal-body" id="modalContent">
                <!-- Dynamically populated content -->
            </div>
            <div class="modal-footer">
                <button type="button" class="modal-btn-primary" onclick="closeHelpModal()">Got it</button>
            </div>
        </div>
    </div>

    <!-- Scripts for modal content and active sidebar styling -->
    <script type="text/javascript">
        (function () {
            function highlightHelpSidebar() {
                var sidebar = document.querySelector(".portal-sidebar");
                if (!sidebar) return;
                var links = sidebar.querySelectorAll(".nav-link");
                links.forEach(function (link) {
                    var href = link.getAttribute("href") || "";
                    if (href.indexOf("HelpSupport.aspx") !== -1 || href === "HelpSupport.aspx") {
                        link.classList.add("active");
                    } else {
                        link.classList.remove("active");
                    }
                });
            }

            if (document.readyState === "loading") {
                document.addEventListener("DOMContentLoaded", highlightHelpSidebar);
            } else {
                highlightHelpSidebar();
            }
        })();

        var helpData = {
            faqs: {
                title: "Frequently Asked Questions (FAQs)",
                html: `
                    <div class="modal-faq-item">
                        <strong>Q: How do I access different government services?</strong>
                        <p>Click on <em>Home</em> in the left sidebar to browse all categories, including IT Services, Police, Students, Colleges, RTO, Passport, and more. You can also search directly using the top search bar.</p>
                    </div>
                    <div class="modal-faq-item">
                        <strong>Q: How can I update my profile information?</strong>
                        <p>Navigate to the <em>Profile</em> page from the sidebar to view and update your registered citizen credentials, email, and contact number.</p>
                    </div>
                    <div class="modal-faq-item">
                        <strong>Q: What should I do if a service form fails to submit?</strong>
                        <p>Ensure all required fields marked with an asterisk are filled correctly and file uploads meet format guidelines. If the issue persists, visit the <em>Contact Us</em> page to submit a support ticket.</p>
                    </div>
                    <div class="modal-faq-item">
                        <strong>Q: Is the One Government portal accessible on mobile devices?</strong>
                        <p>Yes, the platform is fully responsive and optimized for smartphones, tablets, and desktop computers with touch-friendly navigation.</p>
                    </div>
                    <div class="modal-faq-item">
                        <strong>Q: How do I track my submitted applications?</strong>
                        <p>Upon submitting any form, you receive an application reference number. You can monitor the progress and updates directly from your Profile dashboard.</p>
                    </div>
                `
            },
            userGuide: {
                title: "One Government User Guide",
                html: `
                    <p>Welcome to the One Government portal. This user guide explains the core features of the website:</p>
                    <ol class="modal-step-list">
                        <li><strong>Home Dashboard:</strong> Browse all 12 public service sectors displayed as cards. Click any card to access its specific sub-services.</li>
                        <li><strong>Global Search:</strong> Located at the center of the top navigation bar. Enter any department name to instantly locate the matching service.</li>
                        <li><strong>Service Details &amp; Tabs:</strong> Every service provides 4 tabs: <em>Overview</em>, <em>Links</em>, <em>Documents</em>, and <em>Demo Form</em>.</li>
                        <li><strong>Sidebar Navigation:</strong> Access Home, Profile, Setting, About Us, Contact Us, and Help &amp; Support from any screen.</li>
                        <li><strong>Citizen Security:</strong> Always log out using the <em>Logout</em> button at the bottom of the sidebar when finishing your session on shared or public computers.</li>
                    </ol>
                `
            },
            howToApply: {
                title: "How to Apply for Services on One Government",
                html: `
                    <p>Follow this standard procedure to discover and apply for services:</p>
                    <ol class="modal-step-list">
                        <li><strong>Step 1: Select Your Service Department</strong><br>From the Home page, click on your required service category (e.g., RTO, Passport, Police, Student, Income Tax).</li>
                        <li><strong>Step 2: Choose the Specific Sub-Service</strong><br>Select the exact form or service from the subcategory grid.</li>
                        <li><strong>Step 3: Review Required Documents</strong><br>Switch to the <em>Documents</em> tab to see which proof of identity, proof of address, and educational certificates are mandatory.</li>
                        <li><strong>Step 4: Check the Demo Form</strong><br>Click the <em>Demo Form</em> tab to see a sample image of the official form before filling it out.</li>
                        <li><strong>Step 5: Access the Official Portal</strong><br>Switch to the <em>Links</em> tab to open the direct application gateway and watch preparation guidance videos.</li>
                    </ol>
                `
            }
        };

        function openHelpModal(type) {
            var data = helpData[type];
            if (!data) return;
            document.getElementById("modalTitle").innerText = data.title;
            document.getElementById("modalContent").innerHTML = data.html;
            document.getElementById("helpModal").style.display = "flex";
        }

        function closeHelpModal() {
            document.getElementById("helpModal").style.display = "none";
        }

        function closeHelpModalOnBg(e) {
            if (e.target.id === "helpModal") {
                closeHelpModal();
            }
        }
    </script>
</asp:Content>
