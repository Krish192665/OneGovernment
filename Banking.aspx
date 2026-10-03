<%@ Page Title="Banking & Financial Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Banking.aspx.cs" Inherits="OneGovernment.Banking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="Home.aspx" title="Back to home">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18" aria-hidden="true">
                <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
        </a>
    </div>
    <h2 class="section-title">Banking & Financial Inclusion (PM Schemes)</h2>
    <div class="services-grid">
        <!-- 1. Pradhan Mantri Jan Dhan Yojana (PMJDY) -->
        <a class="service-card" href="Banking From/BankingDetails.aspx?type=pmjdy" title="PM Jan Dhan Yojana">
            <div class="service-icon-box icon-banking">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <rect x="2" y="5" width="20" height="14" rx="2"></rect>
                    <line x1="2" y1="10" x2="22" y2="10"></line>
                </svg>
            </div>
            <span class="service-name">PM Jan Dhan Yojana</span>
        </a>

        <!-- 2. Atal Pension Yojana (APY) -->
        <a class="service-card" href="Banking From/BankingDetails.aspx?type=apy" title="Atal Pension Yojana">
            <div class="service-icon-box icon-banking">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <circle cx="12" cy="12" r="10"></circle>
                    <path d="M12 6v6l4 2"></path>
                </svg>
            </div>
            <span class="service-name">Atal Pension Yojana (APY)</span>
        </a>

        <!-- 3. PM Mudra Yojana (PMMY) -->
        <a class="service-card" href="Banking From/BankingDetails.aspx?type=mudra" title="PM Mudra Business Loan">
            <div class="service-icon-box icon-banking">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <line x1="12" y1="1" x2="12" y2="23"></line>
                    <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
                </svg>
            </div>
            <span class="service-name">PM Mudra Loan Scheme</span>
        </a>

        <!-- 4. PM Suraksha Bima Yojana (PMSBY) -->
        <a class="service-card" href="Banking From/BankingDetails.aspx?type=pmsby" title="PM Suraksha Bima Yojana">
            <div class="service-icon-box icon-banking">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                </svg>
            </div>
            <span class="service-name">PM Insurance Schemes</span>
        </a>
    </div>
</asp:Content>
