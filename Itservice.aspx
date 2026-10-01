<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Itservice.aspx.cs" Inherits="OneGovernment.Itservice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="Home.aspx" title="Back to home">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18" aria-hidden="true">
                <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
        </a>
    </div>
    <h2 class="section-title">IT Services</h2>
    <div class="services-grid">
        <!-- 1. Cloud Computing & Networks -->
        <a class="service-card" href="Category.aspx?type=cloud-computing">
            <div class="service-icon-box icon-cloud-computing">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <path d="M18 10h-1.26A8 8 0 1 0 9 20h9a5 5 0 0 0 0-10z"></path>
                    <line x1="12" y1="12" x2="12" y2="16"></line>
                    <line x1="10" y1="14" x2="14" y2="14"></line>
                </svg>
            </div>
            <span class="service-name">Cloud Computing & Networks</span>
        </a>

        <!-- 2. Server Rack -->
        <a class="service-card" href="Category.aspx?type=server-rack">
            <div class="service-icon-box icon-server-rack">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <rect x="2" y="2" width="20" height="8" rx="2" ry="2"></rect>
                    <rect x="2" y="14" width="20" height="8" rx="2" ry="2"></rect>
                    <line x1="6" y1="6" x2="6.01" y2="6"></line>
                    <line x1="6" y1="18" x2="6.01" y2="18"></line>
                </svg>
            </div>
            <span class="service-name">Server Rack</span>
        </a>

        <!-- 3. Cyber Security & IT Protection -->
        <a class="service-card" href="Category.aspx?type=cyber-security">
            <div class="service-icon-box icon-cyber-security">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                    <circle cx="12" cy="11" r="3"></circle>
                </svg>
            </div>
            <span class="service-name">Cyber Security & IT Protection</span>
        </a>


        <!-- 4. Lost Property Report -->
        <a class="service-card" href="Category.aspx?type=lost-property">
            <div class="service-icon-box icon-lost-property">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <rect x="2" y="7" width="20" height="14" rx="2" ry="2"></rect>
                    <path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path>
                    <line x1="12" y1="11" x2="12" y2="13"></line>
                </svg>
            </div>
            <span class="service-name">Lost Property Report</span>
        </a>

    </div>

</asp:Content>
