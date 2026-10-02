<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Collage.aspx.cs" Inherits="OneGovernment.Collage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="Home.aspx" title="Back to home">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18" aria-hidden="true">
                <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
        </a>
    </div>
    <h2 class="section-title">Colleges</h2>
    <div class="services-grid">
        <!-- 1. College Application -->
        <a class="service-card" href="Collage From/CollageDetail.aspx?type=college-application">
            <div class="service-icon-box icon-college-application">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- Document Base -->
                    <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                    <polyline points="14 2 14 8 20 8"></polyline>
                    <!-- Graduation Cap on Form -->
                    <path d="M7 13l4-2 4 2-4 2-4-2z"></path>
                    <path d="M9 14.5v1.5c0 .8 1 1.5 2 1.5s2-.7 2-1.5v-1.5"></path>
                    <line x1="15" y1="13" x2="15" y2="15.5"></line>
                </svg>
            </div>
            <span class="service-name">College Application</span>
        </a>

        <!-- 2. College Registration -->
        <a class="service-card" href="Collage From/CollageDetail.aspx?type=college-registration">
            <div class="service-icon-box icon-college-registration">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- Flag atop university -->
                    <path d="M12 2v3m0 0h3l-1.5 1.5L15 8h-3"></path>
                    <!-- Roof Triangular Pediment -->
                    <path d="M3 10l9-4 9 4"></path>
                    <!-- Pillars & Floor -->
                    <line x1="4" y1="21" x2="20" y2="21"></line>
                    <line x1="6" y1="10" x2="6" y2="21"></line>
                    <line x1="10" y1="10" x2="10" y2="21"></line>
                    <line x1="14" y1="10" x2="14" y2="21"></line>
                    <line x1="18" y1="10" x2="18" y2="21"></line>
                </svg>
            </div>
            <span class="service-name">College Registration</span>
        </a>

    </div>

</asp:Content>
