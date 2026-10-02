<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Passport.aspx.cs" Inherits="OneGovernment.Passport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="Home.aspx" title="Back to home">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18" aria-hidden="true">
                <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
        </a>
    </div>
    <h2 class="section-title">Passport</h2>
    <div class="services-grid">
        <!-- 1. Passport form -->
        <a class="service-card" href="Passport From/PassportDetails.aspx?type=passports">
            <div class="service-icon-box icon-passports">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <rect x="4" y="3" width="16" height="18" rx="2"></rect>
                    <circle cx="12" cy="11" r="4"></circle>
                    <line x1="8" y1="11" x2="16" y2="11"></line>
                    <path d="M12 7a6 6 0 0 1 0 8"></path>
                    <path d="M12 7a6 6 0 0 0 0 8"></path>
                    <line x1="8" y1="18" x2="16" y2="18"></line>
                </svg>
            </div>
            <span class="service-name">Passport Form</span>
        </a>

    </div>

</asp:Content>
