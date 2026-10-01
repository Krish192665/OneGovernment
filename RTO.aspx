<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RTO.aspx.cs" Inherits="OneGovernment.RTO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="Home.aspx" title="Back to home">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18" aria-hidden="true">
                <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
        </a>
    </div>
    <h2 class="section-title">RTO</h2>
    <div class="services-grid">
        <!-- 1. Driving License -->
        <a class="service-card" href="Category.aspx?type=driving-license">
            <div class="service-icon-box icon-driving-license">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- License Card Border -->
                    <rect x="2" y="4" width="20" height="16" rx="2"></rect>
                    <!-- Driver Photo / Avatar -->
                    <circle cx="7" cy="10" r="2"></circle>
                    <path d="M4 16a3 3 0 0 1 6 0"></path>
                    <!-- Steering Wheel / RTO Emblem -->
                    <circle cx="16" cy="12" r="3.5"></circle>
                    <line x1="16" y1="8.5" x2="16" y2="15.5"></line>
                    <line x1="12.5" y1="12" x2="19.5" y2="12"></line>
                </svg>
            </div>
            <span class="service-name">Driving License</span>
        </a>

        <!-- 2. Number Plate -->
        <a class="service-card" href="Category.aspx?type=number-plate">
            <div class="service-icon-box icon-number-plate">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- Number Plate Frame -->
                    <rect x="2" y="6" width="20" height="12" rx="2"></rect>
                    <!-- IND / State Seal Section -->
                    <line x1="7" y1="6" x2="7" y2="18"></line>
                    <circle cx="4.5" cy="12" r="1"></circle>
                    <!-- Plate Text Lines -->
                    <line x1="10" y1="10" x2="18" y2="10"></line>
                    <line x1="10" y1="14" x2="16" y2="14"></line>
                </svg>
            </div>
            <span class="service-name">Number Plate</span>
        </a>

    </div>

</asp:Content>
