<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Health.aspx.cs" Inherits="OneGovernment.Health" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="Home.aspx" title="Back to home">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18" aria-hidden="true">
                <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
        </a>
    </div>
    <h2 class="section-title">Health</h2>
    <div class="services-grid">
        <!-- 1. Medical Exam -->
        <a class="service-card" href="Category.aspx?type=medical-exam">
            <div class="service-icon-box icon-medical-exam">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- Exam / Question Paper -->
                    <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                    <polyline points="14 2 14 8 20 8"></polyline>
                    <!-- Exam Lines -->
                    <line x1="8" y1="12" x2="11" y2="12"></line>
                    <line x1="8" y1="16" x2="10" y2="16"></line>
                    <!-- Stethoscope Overlay -->
                    <path d="M17 10v3a3 3 0 0 1-6 0v-1"></path>
                    <circle cx="17" cy="10" r="1"></circle>
                    <circle cx="11" cy="12" r="1"></circle>
                    <circle cx="14" cy="18" r="2"></circle>
                    <line x1="14" y1="16" x2="14" y2="14"></line>
                </svg>
            </div>
            <span class="service-name">Medical Exam</span>
        </a>

        <!-- 2. Medical Entrance -->
        <a class="service-card" href="Category.aspx?type=medical-entrance">
            <div class="service-icon-box icon-medical-entrance">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- Certificate Frame -->
                    <rect x="3" y="3" width="18" height="18" rx="2"></rect>
                    <!-- Red Cross / Health Emblem -->
                    <line x1="12" y1="7" x2="12" y2="13"></line>
                    <line x1="9" y1="10" x2="15" y2="10"></line>
                    <!-- Official Allotment Ribbon / Seal -->
                    <circle cx="12" cy="17" r="2"></circle>
                    <line x1="6" y1="16" x2="8" y2="16"></line>
                    <line x1="16" y1="16" x2="18" y2="16"></line>
                </svg>
            </div>
            <span class="service-name">Medical Entrance</span>
        </a>

    </div>

</asp:Content>
