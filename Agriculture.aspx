<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agriculture.aspx.cs" Inherits="OneGovernment.Agriculture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="Home.aspx" title="Back to home">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18" aria-hidden="true">
                <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
        </a>
    </div>
    <h2 class="section-title">Agriculture</h2>
    <div class="services-grid">
        <!-- 1. Agriculture Officer -->
        <a class="service-card" href="Category.aspx?type=agriculture-officer">
            <div class="service-icon-box icon-agriculture-officer">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- Officer Silhouette -->
                    <circle cx="9" cy="7" r="4"></circle>
                    <path d="M2 21v-2a4 4 0 0 1 4-4h6"></path>
                    <!-- Tie / Collar -->
                    <path d="M9 11l.75 2.5-.75 2.5-.75-2.5L9 11z"></path>
                    <!-- Plant / Agriculture Badge -->
                    <path d="M17 21v-6"></path>
                    <path d="M17 15a4 4 0 0 1 4-4v1a4 4 0 0 1-4 3"></path>
                    <path d="M17 17a4 4 0 0 0-4-4v1a4 4 0 0 0 4 3"></path>
                </svg>
            </div>
            <span class="service-name">Agriculture Officer</span>
        </a>

        <!-- 2. Field Inspector -->
        <a class="service-card" href="Category.aspx?type=field-inspector">
            <div class="service-icon-box icon-field-inspector">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- Inspector Silhouette -->
                    <circle cx="8" cy="6" r="3.5"></circle>
                    <path d="M2 20v-1a4 4 0 0 1 4-4h4"></path>
                    <!-- Inspection Pad / Survey Form -->
                    <rect x="13" y="4" width="9" height="11" rx="1.5"></rect>
                    <line x1="16" y1="8" x2="19" y2="8"></line>
                    <line x1="16" y1="11" x2="19" y2="11"></line>
                    <!-- Wheat Ear / Grain Spike Base -->
                    <line x1="17" y1="22" x2="17" y2="17"></line>
                    <path d="M15 18a2 2 0 0 1 2-2 2 2 0 0 1 2 2"></path>
                </svg>
            </div>
            <span class="service-name">Field Inspector</span>
        </a>
    </div>

</asp:Content>
