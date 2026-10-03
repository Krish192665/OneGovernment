<%@ Page Title="Food & Civil Supplies / Ration Card" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RationCard.aspx.cs" Inherits="OneGovernment.RationCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="Home.aspx" title="Back to home">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18" aria-hidden="true">
                <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
        </a>
    </div>
    <h2 class="section-title">Food & Civil Supplies / Ration Card (NFSA)</h2>
    <div class="services-grid">
        <!-- 1. New Ration Card Application -->
        <a class="service-card" href="RationCard From/RationCardDetails.aspx?type=new-card" title="New Ration Card Application">
            <div class="service-icon-box icon-ration">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <rect x="2" y="4" width="20" height="16" rx="2"></rect>
                    <path d="M7 15h4M7 11h10M7 7h6"></path>
                </svg>
            </div>
            <span class="service-name">New Ration Card</span>
        </a>

        <!-- 2. Add / Delete Family Member -->
        <a class="service-card" href="RationCard From/RationCardDetails.aspx?type=modify-member" title="Add or Delete Member">
            <div class="service-icon-box icon-ration">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                    <circle cx="9" cy="7" r="4"></circle>
                    <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                    <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                </svg>
            </div>
            <span class="service-name">Modify Family Members</span>
        </a>

        <!-- 3. Monthly Ration Quota & Entitlement -->
        <a class="service-card" href="RationCard From/RationCardDetails.aspx?type=quota" title="Check Ration Quota">
            <div class="service-icon-box icon-ration">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path>
                    <polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline>
                    <line x1="12" y1="22.08" x2="12" y2="12"></line>
                </svg>
            </div>
            <span class="service-name">Monthly Food Grain Quota</span>
        </a>

        <!-- 4. One Nation One Ration Card (ONORC) -->
        <a class="service-card" href="RationCard From/RationCardDetails.aspx?type=onorc" title="One Nation One Ration Card">
            <div class="service-icon-box icon-ration">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <circle cx="12" cy="12" r="10"></circle>
                    <line x1="2" y1="12" x2="22" y2="12"></line>
                    <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path>
                </svg>
            </div>
            <span class="service-name">One Nation One Ration Card</span>
        </a>
    </div>
</asp:Content>
