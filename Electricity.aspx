<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Electricity.aspx.cs" Inherits="OneGovernment.Electricity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="Home.aspx" title="Back to home">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18" aria-hidden="true">
                <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
        </a>
    </div>
    <h2 class="section-title">Electricity</h2>
    <div class="services-grid">
        <!-- 1. Electricity Officer -->
        <a class="service-card" href="Electricity From/ElectricityDetails.aspx?type=electricity-officer">
            <div class="service-icon-box icon-electricity-officer">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- Safety Hard Hat -->
                    <path d="M5 8h10"></path>
                    <path d="M6 8a4 4 0 0 1 8 0"></path>
                    <line x1="10" y1="3" x2="10" y2="4"></line>
                    <!-- Officer Face & Body -->
                    <circle cx="10" cy="11" r="2.5"></circle>
                    <path d="M3 21v-2a4 4 0 0 1 4-4h6a4 4 0 0 1 4 4v2"></path>
                    <!-- Lightning Flash Badge -->
                    <polygon points="19 8 16 13 18.5 13 17.5 18 21.5 12 19 12 20 8"></polygon>
                </svg>
            </div>
            <span class="service-name">Electricity Officer</span>
        </a>

        <!-- 2. Electrical Inspector -->
        <a class="service-card" href="Electricity From/ElectricityDetails.aspx?type=electrical-inspector">
            <div class="service-icon-box icon-electrical-inspector">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- Inspector Profile -->
                    <circle cx="8" cy="6" r="3.5"></circle>
                    <path d="M2 20v-1a4 4 0 0 1 4-4h4"></path>
                    <!-- Multimeter / Energy Meter Box -->
                    <rect x="13" y="5" width="9" height="12" rx="2"></rect>
                    <!-- Dial / Screen -->
                    <rect x="15" y="7" width="5" height="3" rx="0.5"></rect>
                    <!-- Dial Pointer -->
                    <line x1="17.5" y1="13" x2="19" y2="11.5"></line>
                    <!-- Test Probe Wires -->
                    <path d="M15 17v4"></path>
                    <path d="M20 17v4"></path>
                </svg>
            </div>
            <span class="service-name">Electrical Inspector</span>
        </a>

        <!-- 3. Department Authority -->
        <a class="service-card" href="Electricity From/ElectricityDetails.aspx?type=department-authority">
            <div class="service-icon-box icon-department-authority">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- Official Silhouette with Tie -->
                    <circle cx="8" cy="7" r="4"></circle>
                    <path d="M2 21v-2a4 4 0 0 1 4-4h4"></path>
                    <path d="M8 11l.75 2.5-.75 2.5-.75-2.5L8 11z"></path>
                    <!-- Department Shield -->
                    <path d="M17 8l4 1.5v4c0 3-2 5-4 6-2-1-4-3-4-6v-4L17 8z"></path>
                    <!-- Power Bolt Inside Shield -->
                    <polygon points="17 11 15.5 14 17 14 16.5 17 18.5 13.5 17 13.5 17.5 11"></polygon>
                </svg>
            </div>
            <span class="service-name">Department Authority</span>
        </a>
    </div>

</asp:Content>
