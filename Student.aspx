<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="OneGovernment.Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="Home.aspx" title="Back to home">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18" aria-hidden="true">
                <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
        </a>
    </div>
    <h2 class="section-title">Student Services</h2>
    <div class="services-grid">
        <!-- 1. Scholarship -->
        <a class="service-card" href="Category.aspx?type=scholarship">
            <div class="service-icon-box icon-scholarship">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- Mortarboard -->
                    <path d="M22 7l-10-4-10 4 10 4 10-4z"></path>
                    <path d="M6 9v4"></path>
                    <!-- Grant / Scholarship Coin -->
                    <circle cx="12" cy="16" r="5"></circle>
                    <path d="M12 14v4"></path>
                    <path d="M10.5 15h3"></path>
                </svg>
            </div>
            <span class="service-name">Scholarship</span>
        </a>

        <!-- 2. Verified Student ID -->
        <a class="service-card" href="Category.aspx?type=verified-student-id">
            <div class="service-icon-box icon-verified-student-id">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- ID Card Base -->
                    <rect x="3" y="3" width="18" height="18" rx="2"></rect>
                    <!-- Student Avatar -->
                    <circle cx="9" cy="9" r="2.5"></circle>
                    <path d="M5 16a4 4 0 0 1 8 0"></path>
                    <!-- Official Verification Lines -->
                    <line x1="15" y1="8" x2="19" y2="8"></line>
                    <line x1="15" y1="12" x2="19" y2="12"></line>
                    <polyline points="15 16 16.5 17.5 19 15"></polyline>
                </svg>
            </div>
            <span class="service-name">Verified Student ID</span>
        </a>

        <!-- 3. Student Degree with Government Seal -->
        <a class="service-card" href="Category.aspx?type=student-degree">
            <div class="service-icon-box icon-student-degree">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- Diploma / Certificate -->
                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                    <!-- Government Badge Ribbon -->
                    <circle cx="12" cy="8" r="3"></circle>
                    <path d="M10 11l-1 4 3-1.5 3 1.5-1-4"></path>
                </svg>
            </div>
            <span class="service-name">Student Degree with Government Seal</span>
        </a>

    </div>

</asp:Content>
