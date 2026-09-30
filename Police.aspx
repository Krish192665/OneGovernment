<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Police.aspx.cs" Inherits="OneGovernment.Police" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="Home.aspx" title="Back to home">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18" aria-hidden="true">
                <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
        </a>
    </div>
    <h2 class="section-title">Police</h2>
    <div class="services-grid">
        <!-- 1. Arms License -->
        <a class="service-card" href="Category.aspx?type=arms">
            <div class="service-icon-box <icon-arms></icon-arms>">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <circle cx="12" cy="12" r="10"></circle>
                    <line x1="22" y1="12" x2="18" y2="12"></line>
                    <line x1="6" y1="12" x2="2" y2="12"></line>
                    <line x1="12" y1="6" x2="12" y2="2"></line>
                    <line x1="12" y1="22" x2="12" y2="18"></line>
                    <circle cx="12" cy="12" r="3"></circle>
                </svg>
            </div>
            <span class="service-name">Arms License</span>
        </a>

        <!-- 2. Cyber Crime Complaint -->
        <a class="service-card" href="Category.aspx?type=cyber-crime">
            <div class="service-icon-box icon-cyber-crime">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                    <polyline points="9 9 12 12 9 15"></polyline>
                    <line x1="13" y1="15" x2="15" y2="15"></line>
                </svg>
            </div>
            <span class="service-name">Cyber Crime Complaint</span>
        </a>

        <!-- 3. Traffic E-Challan -->
        <a class="service-card" href="Category.aspx?type=traffic-e-challan">
            <div class="service-icon-box icon-traffic-e-challan">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect>
                    <line x1="1" y1="10" x2="23" y2="10"></line>
                    <line x1="6" y1="15" x2="10" y2="15"></line>
                </svg>
            </div>
            <span class="service-name">Traffic E-Challan</span>
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


        <!-- 5. Clearance Certificate (PCC) -->
        <a class="service-card" href="Category.aspx?type=pcc">
            <div class="service-icon-box icon-pcc">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                    <polyline points="9 12 11 14 15 10"></polyline>
                </svg>
            </div>
            <span class="service-name">Clearance Certificate (PCC)</span>
        </a>

        <!-- 6. More -->
        <a class="service-card" href="Category.aspx?type=more">
            <div class="service-icon-box icon-more">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <rect x="3" y="3" width="7" height="7"></rect>
                    <rect x="14" y="3" width="7" height="7"></rect>
                    <rect x="14" y="14" width="7" height="7"></rect>
                    <rect x="3" y="14" width="7" height="7"></rect>
                </svg>
            </div>
            <span class="service-name">More</span>
        </a>
    </div>
</asp:Content>
