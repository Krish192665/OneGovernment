<%@ Page Title="Railway & IRCTC Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Railway.aspx.cs" Inherits="OneGovernment.Railway" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="Home.aspx" title="Back to home">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18" aria-hidden="true">
                <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
        </a>
    </div>
    <h2 class="section-title">Railway & IRCTC Passenger Services</h2>
    <div class="services-grid">
        <!-- 1. E-Ticket Booking -->
        <a class="service-card" href="Railway From/RailwayDetails.aspx?type=ticket-booking" title="Train Ticket Booking">
            <div class="service-icon-box icon-railway">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <rect x="4" y="3" width="16" height="16" rx="2"></rect>
                    <path d="M4 11h16M12 3v8"></path>
                    <circle cx="8" cy="15" r="1.5"></circle>
                    <circle cx="16" cy="15" r="1.5"></circle>
                </svg>
            </div>
            <span class="service-name">E-Ticket Booking</span>
        </a>

        <!-- 2. Live Train Status & PNR -->
        <a class="service-card" href="Railway From/RailwayDetails.aspx?type=pnr-status" title="PNR & Train Running Status">
            <div class="service-icon-box icon-railway">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <circle cx="12" cy="12" r="10"></circle>
                    <polyline points="12 6 12 12 16 14"></polyline>
                </svg>
            </div>
            <span class="service-name">PNR & Live Train Status</span>
        </a>

        <!-- 3. Tatkal & Premium Tatkal -->
        <a class="service-card" href="Railway From/RailwayDetails.aspx?type=tatkal" title="Tatkal Quota Booking">
            <div class="service-icon-box icon-railway">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                </svg>
            </div>
            <span class="service-name">Tatkal Quota Booking</span>
        </a>

        <!-- 4. Ticket Cancellation & Refund -->
        <a class="service-card" href="Railway From/RailwayDetails.aspx?type=refund" title="Ticket Cancellation & Refund">
            <div class="service-icon-box icon-railway">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8"></path>
                    <path d="M3 3v5h5"></path>
                </svg>
            </div>
            <span class="service-name">Cancellation & Refund</span>
        </a>
    </div>
</asp:Content>
