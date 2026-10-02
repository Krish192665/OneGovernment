<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="OneGovernment.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* ============================================================
           About Us Page Layout & Components
           ============================================================ */
        .about-page-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px 24px 40px 24px;
            box-sizing: border-box;
            width: 100%;
            max-width: 1040px;
            margin: 0 auto;
        }

        /* Hero Header Matching Original Reference */
        .about-hero-section {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            max-width: 680px;
            width: 100%;
            margin-bottom: 48px;
        }

        .about-circle-emblem {
            width: 160px;
            height: 160px;
            border-radius: 50%;
            background-color: #d1d5db;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 22px;
            flex-shrink: 0;
            box-shadow: 0 4px 14px rgba(0, 0, 0, 0.06);
        }

        .about-circle-emblem svg {
            width: 80px;
            height: 80px;
            color: #000000;
            fill: currentColor;
        }

        .about-title {
            font-size: 2.2rem;
            font-weight: 800;
            color: #000000;
            margin: 0 0 8px 0;
            letter-spacing: -0.015em;
        }

        .about-tagline {
            font-size: 1rem;
            color: #475569;
            margin: 0 0 22px 0;
            font-weight: 500;
        }

        .about-mission-text {
            font-size: 0.96rem;
            color: #475569;
            line-height: 1.7;
            margin: 0 auto;
            text-align: center;
            max-width: 620px;
        }

        /* Section Headings */
        .about-section-heading {
            width: 100%;
            text-align: center;
            margin: 16px 0 24px 0;
        }

        .about-section-heading h2 {
            font-size: 1.4rem;
            font-weight: 700;
            color: #0f172a;
            margin: 0 0 8px 0;
            letter-spacing: -0.01em;
        }

        .about-section-heading p {
            font-size: 0.92rem;
            color: #64748b;
            margin: 0;
        }

        /* Objective & Feature Cards Grid */
        .about-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            width: 100%;
            margin-bottom: 40px;
        }

        .about-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 24px;
            display: flex;
            gap: 18px;
            box-shadow: 0 2px 8px rgba(15, 23, 42, 0.03);
            transition: all 0.2s ease;
        }

        .about-card:hover {
            transform: translateY(-2px);
            border-color: #cbd5e1;
            box-shadow: 0 8px 20px rgba(15, 23, 42, 0.06);
        }

        .about-card-icon-box {
            width: 48px;
            height: 48px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .icon-blue {
            background-color: #eff6ff;
            color: #2563eb;
        }

        .icon-green {
            background-color: #ecfdf5;
            color: #059669;
        }

        .icon-purple {
            background-color: #f5f3ff;
            color: #7c3aed;
        }

        .icon-amber {
            background-color: #fffbeb;
            color: #d97706;
        }

        .about-card-content {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .about-card-title {
            font-size: 1.05rem;
            font-weight: 700;
            color: #0f172a;
            margin: 0;
        }

        .about-card-desc {
            font-size: 0.9rem;
            color: #64748b;
            line-height: 1.55;
            margin: 0;
        }

        /* Vision Banner */
        .about-vision-banner {
            width: 100%;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            border-radius: 14px;
            padding: 32px 36px;
            color: #ffffff;
            box-sizing: border-box;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 24px;
            margin-bottom: 40px;
            box-shadow: 0 10px 25px rgba(15, 23, 42, 0.12);
        }

        .about-vision-text-block h3 {
            font-size: 1.25rem;
            font-weight: 700;
            color: #ffffff;
            margin: 0 0 8px 0;
        }

        .about-vision-text-block p {
            font-size: 0.94rem;
            color: #cbd5e1;
            line-height: 1.6;
            margin: 0;
            max-width: 650px;
        }

        .about-vision-action {
            flex-shrink: 0;
        }

        .about-btn-action {
            display: inline-block;
            background: #ffffff;
            color: #0f172a;
            font-weight: 700;
            font-size: 0.9rem;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            transition: all 0.18s ease;
        }

        .about-btn-action:hover {
            background: #f1f5f9;
            transform: translateY(-1px);
            color: #1e6fd8;
        }

        /* Sector Badges Pill Area */
        .about-services-summary {
            width: 100%;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 24px;
            box-sizing: border-box;
            margin-bottom: 40px;
            text-align: center;
        }

        .about-services-summary h3 {
            font-size: 1.1rem;
            font-weight: 700;
            color: #0f172a;
            margin: 0 0 6px 0;
        }

        .about-services-summary p {
            font-size: 0.88rem;
            color: #64748b;
            margin: 0 0 18px 0;
        }

        .about-badges-wrapper {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 10px;
        }

        .service-badge {
            background: #ffffff;
            border: 1px solid #cbd5e1;
            border-radius: 20px;
            padding: 6px 14px;
            font-size: 0.84rem;
            font-weight: 600;
            color: #334155;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .service-badge::before {
            content: "";
            display: inline-block;
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background-color: #2563eb;
        }

        /* Version Footer Matching Original */
        .about-version-text {
            padding-top: 10px;
            font-size: 0.86rem;
            color: #64748b;
            text-align: center;
            letter-spacing: 0.02em;
        }

        @media (max-width: 768px) {
            .about-page-container {
                padding: 30px 16px 24px 16px;
            }
            .about-grid {
                grid-template-columns: 1fr;
            }
            .about-circle-emblem {
                width: 130px;
                height: 130px;
                margin-bottom: 18px;
            }
            .about-circle-emblem svg {
                width: 64px;
                height: 64px;
            }
            .about-title {
                font-size: 1.8rem;
            }
            .about-vision-banner {
                flex-direction: column;
                align-items: flex-start;
                padding: 24px;
            }
        }
    </style>

    <div class="about-page-container" aria-labelledby="aboutPageTitle">
        <!-- Exact Hero Matching Reference Image -->
        <div class="about-hero-section">
            <div class="about-circle-emblem" aria-hidden="true">
                <svg viewBox="0 0 24 24">
                    <path d="M12 2L2 7v2h20V7L12 2zm-1 3.2L18.4 7H5.6L11 5.2zM4 11v8h3v-8H4zm6 0v8h4v-8h-4zm7 0v8h3v-8h-3zM2 21v2h20v-2H2z" />
                </svg>
            </div>

            <h1 id="aboutPageTitle" class="about-title">One Government</h1>
            <p class="about-tagline">All Government services,One Platform</p>

            <p class="about-mission-text">
                Our mission is to simplify access to government services by providing a single,reliable, and secure digital platform. We strive to reduce paperwork,improve transparency, and deliver faster public services for every citizen.
            </p>
        </div>

        <!-- Section 1: Core Objectives -->
       <%-- <div class="about-section-heading">
            <h2>Core Platform Objectives</h2>
            <p>Designed to deliver a modern, connected, and effortless citizen experience</p>
        </div>--%>

<%--        <div class="about-grid">--%>
            <!-- Objective 1 -->
           <%-- <div class="about-card">
                <div class="about-card-icon-box icon-blue">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="3" y="3" width="7" height="7"></rect>
                        <rect x="14" y="3" width="7" height="7"></rect>
                        <rect x="14" y="14" width="7" height="7"></rect>
                        <rect x="3" y="14" width="7" height="7"></rect>
                    </svg>
                </div>
                <div class="about-card-content">
                    <h3 class="about-card-title">Single-Window Access</h3>
                    <p class="about-card-desc">Unified entry point integrating 12 public departments and agencies, eliminating the need to navigate fragmented portals.</p>
                </div>
            </div>--%>

            <!-- Objective 2 -->
            <%--<div class="about-card">
                <div class="about-card-icon-box icon-green">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                        <polyline points="14 2 14 8 20 8"></polyline>
                        <line x1="16" y1="13" x2="8" y2="13"></line>
                        <line x1="16" y1="17" x2="8" y2="17"></line>
                        <polyline points="10 9 9 9 8 9"></polyline>
                    </svg>
                </div>
                <div class="about-card-content">
                    <h3 class="about-card-title">Paperless &amp; Transparent</h3>
                    <p class="about-card-desc">Clear digital document requirements, verified processing steps, and online application tracking without physical queues.</p>
                </div>
            </div>--%>

            <!-- Objective 3 -->
            <%--<div class="about-card">
                <div class="about-card-icon-box icon-purple">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                        <line x1="12" y1="8" x2="12" y2="12"></line>
                        <line x1="12" y1="16" x2="12.01" y2="16"></line>
                    </svg>
                </div>
                <div class="about-card-content">
                    <h3 class="about-card-title">Security &amp; Citizen Privacy</h3>
                    <p class="about-card-desc">Government-standard encryption and strict privacy protocols to safeguard citizen credentials and sensitive personal records.</p>
                </div>
            </div>--%>

            <!-- Objective 4 -->
            <%--<div class="about-card">
                <div class="about-card-icon-box icon-amber">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"></circle>
                        <polyline points="12 6 12 12 16 14"></polyline>
                    </svg>
                </div>
                <div class="about-card-content">
                    <h3 class="about-card-title">Prompt Service Delivery</h3>
                    <p class="about-card-desc">Interactive demo forms and guided workflows ensure applications are submitted accurately for faster processing.</p>
                </div>
            </div>
        </div>--%>

        <!-- Section 2: Service Coverage Overview -->
        <%--<div class="about-services-summary">
            <h3>Integrated Public Service Domains</h3>
            <p>Access authorized information, guidelines, and online services across multiple government sectors:</p>
            <div class="about-badges-wrapper">
                <span class="service-badge">IT Services</span>
                <span class="service-badge">Police &amp; Verification</span>
                <span class="service-badge">Student Scholarships</span>
                <span class="service-badge">Colleges &amp; Education</span>
                <span class="service-badge">RTO &amp; Vehicle Licensing</span>
                <span class="service-badge">Passport Seva</span>
                <span class="service-badge">Income Tax &amp; PAN</span>
                <span class="service-badge">Public Health &amp; Hospitals</span>
                <span class="service-badge">Transport &amp; Transit</span>
                <span class="service-badge">Agriculture &amp; Farmers</span>
                <span class="service-badge">Utilities &amp; Energy</span>
                <span class="service-badge">Municipal Services</span>
            </div>
        </div>--%>

        <!-- Section 3: Vision & Support CTA Banner -->
       <%-- <div class="about-vision-banner">
            <div class="about-vision-text-block">
                <h3>Our Vision for Digital Governance</h3>
                <p>To empower every citizen with accountable, seamless, and inclusive digital public services accessible from any device at any time.</p>
            </div>
            <div class="about-vision-action">
                <a href="HelpSupport.aspx" class="about-btn-action">Explore Help &amp; Support</a>
            </div>
        </div>--%>

        <!-- Exact Version Footer Matching Reference -->
       <%-- <div class="about-version-text">
            version1.0.00.1
        </div>
    </div>--%>

    <!-- Active Sidebar Highlighting Script -->
    <%--<script type="text/javascript">
        (function () {
            function highlightAboutSidebar() {
                var sidebar = document.querySelector(".portal-sidebar");
                if (!sidebar) return;
                var links = sidebar.querySelectorAll(".nav-link");
                links.forEach(function (link) {
                    var href = link.getAttribute("href") || "";
                    if (href.indexOf("About.aspx") !== -1 || href === "About.aspx") {
                        link.classList.add("active");
                    } else {
                        link.classList.remove("active");
                    }
                });
            }

            if (document.readyState === "loading") {
                document.addEventListener("DOMContentLoaded", highlightAboutSidebar);
            } else {
                highlightAboutSidebar();
            }
        })();
    </script>--%>
</asp:Content>
