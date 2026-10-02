<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IncomText.aspx.cs" Inherits="OneGovernment.IncomText" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="Home.aspx" title="Back to home">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18" aria-hidden="true">
                <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
        </a>
    </div>
    <h2 class="section-title">Income Taxes</h2>
    <div class="services-grid">
        <!-- 1. PAN Card -->
        <a class="service-card" href="IncomTaxes From/IncomTaxsDetails.aspx?type=pan-card">
            <div class="service-icon-box icon-pan-card">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- Card Frame -->
                    <rect x="2" y="4" width="20" height="16" rx="2"></rect>
                    <!-- User Photo -->
                    <rect x="5" y="7" width="5" height="6" rx="1"></rect>
                    <!-- Government / Department Header -->
                    <line x1="12" y1="8" x2="19" y2="8"></line>
                    <!-- PAN Number Code Line -->
                    <line x1="12" y1="11" x2="17" y2="11"></line>
                    <!-- Signature / Hologram Line -->
                    <line x1="5" y1="16" x2="13" y2="16"></line>
                    <circle cx="17.5" cy="15.5" r="1.5"></circle>
                </svg>
            </div>
            <span class="service-name">PAN Card</span>
        </a>

        <!-- 2. Tax Officer -->
        <a class="service-card" href="IncomTaxes From/IncomTaxsDetails.aspx?type=tax-officer">
            <div class="service-icon-box icon-tax-officer">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- Officer Head -->
                    <circle cx="10" cy="7" r="4"></circle>
                    <!-- Suit Shoulders & Body -->
                    <path d="M2 21v-2a4 4 0 0 1 4-4h8a4 4 0 0 1 4 4v2"></path>
                    <!-- Tie -->
                    <path d="M10 11l1 3-1 3-1-3 1-3z"></path>
                    <!-- Rupee / Assessment Badge on Chest -->
                    <circle cx="18" cy="11" r="4"></circle>
                    <path d="M16.5 9.5h3"></path>
                    <path d="M16.5 11h2a1 1 0 0 1 0 2h-2"></path>
                    <line x1="17.5" y1="12" x2="19.5" y2="14"></line>
                </svg>
            </div>
            <span class="service-name">Tax Officer</span>
        </a>

        <!-- 3. Income Tax Auditor -->
        <a class="service-card" href="IncomTaxes From/IncomTaxsDetails.aspx?type=income-tax-auditor">
            <div class="service-icon-box icon-income-tax-auditor">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- Inspector Avatar -->
                    <circle cx="9" cy="7" r="4"></circle>
                    <path d="M2 21v-2a4 4 0 0 1 4-4h6"></path>
                    <!-- Tax Case File / Assessment Folder -->
                    <path d="M14 13h5a2 2 0 0 1 2 2v6H14v-8z"></path>
                    <!-- Magnifier / Audit Scrutiny Glass -->
                    <circle cx="17" cy="8" r="3"></circle>
                    <line x1="19.5" y1="10.5" x2="22" y2="13"></line>
                </svg>
            </div>
            <span class="service-name">Income Tax Auditor</span>
        </a>

    </div>

</asp:Content>
