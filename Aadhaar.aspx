<%@ Page Title="Aadhaar & Identity Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Aadhaar.aspx.cs" Inherits="OneGovernment.Aadhaar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="Home.aspx" title="Back to home">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18" aria-hidden="true">
                <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
        </a>
    </div>
    <h2 class="section-title">Aadhaar & Identity Services (UIDAI)</h2>
    <div class="services-grid">
        <!-- 1. New Aadhaar Enrolment -->
        <a class="service-card" href="Aadhaar From/AadhaarDetails.aspx?type=new-enrolment" title="New Aadhaar Enrolment">
            <div class="service-icon-box icon-aadhaar">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                    <circle cx="8.5" cy="7" r="4"></circle>
                    <line x1="20" y1="8" x2="20" y2="14"></line>
                    <line x1="23" y1="11" x2="17" y2="11"></line>
                </svg>
            </div>
            <span class="service-name">New Aadhaar Enrolment</span>
        </a>

        <!-- 2. Update Demographic & Address -->
        <a class="service-card" href="Aadhaar From/AadhaarDetails.aspx?type=update-aadhaar" title="Update Aadhaar Details">
            <div class="service-icon-box icon-aadhaar">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                </svg>
            </div>
            <span class="service-name">Update Aadhaar & Address</span>
        </a>

        <!-- 3. Download e-Aadhaar -->
        <a class="service-card" href="Aadhaar From/AadhaarDetails.aspx?type=download-aadhaar" title="Download e-Aadhaar">
            <div class="service-icon-box icon-aadhaar">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                    <polyline points="7 10 12 15 17 10"></polyline>
                    <line x1="12" y1="15" x2="12" y2="3"></line>
                </svg>
            </div>
            <span class="service-name">Download e-Aadhaar</span>
        </a>

        <!-- 4. Order Aadhaar PVC Card -->
        <a class="service-card" href="Aadhaar From/AadhaarDetails.aspx?type=pvc-card" title="Order Aadhaar PVC Card">
            <div class="service-icon-box icon-aadhaar">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <rect x="2" y="5" width="20" height="14" rx="2"></rect>
                    <line x1="2" y1="10" x2="22" y2="10"></line>
                    <circle cx="6" cy="15" r="1"></circle>
                </svg>
            </div>
            <span class="service-name">Order Aadhaar PVC Card</span>
        </a>
    </div>
</asp:Content>
