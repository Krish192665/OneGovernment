<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Transport.aspx.cs" Inherits="OneGovernment.Transport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="Home.aspx" title="Back to home">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18" aria-hidden="true">
                <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
        </a>
    </div>
    <h2 class="section-title">Transport</h2>
    <div class="services-grid">
        <!-- 1. Vehicle Inspection -->
        <a class="service-card" href="Category.aspx?type=vehicle-inspection">
            <div class="service-icon-box icon-vehicle-inspection">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- Inspector Profile -->
                    <circle cx="8" cy="6" r="3.5"></circle>
                    <path d="M2 19v-1a4 4 0 0 1 4-4h4"></path>
                    <!-- Inspection Clipboard / Test Sheet -->
                    <rect x="14" y="3" width="8" height="10" rx="1.5"></rect>
                    <polyline points="16 7 17.5 8.5 20 6"></polyline>
                    <line x1="16" y1="10.5" x2="20" y2="10.5"></line>
                    <!-- Vehicle Front Grille at Bottom -->
                    <rect x="11" y="16" width="11" height="5" rx="1.5"></rect>
                    <circle cx="13.5" cy="18.5" r="0.8"></circle>
                    <circle cx="19.5" cy="18.5" r="0.8"></circle>
                    <line x1="15.5" y1="18.5" x2="17.5" y2="18.5"></line>
                </svg>
            </div>
            <span class="service-name">Vehicle Inspection</span>
        </a>

        <!-- 2. Transport Authority -->
        <a class="service-card" href="Category.aspx?type=transport-authority">
            <div class="service-icon-box icon-transport-authority">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- Official Silhouette with Tie -->
                    <circle cx="9" cy="7" r="4"></circle>
                    <path d="M2 21v-2a4 4 0 0 1 4-4h6"></path>
                    <path d="M9 11l1 2.5-1 2.5-1-2.5 1-2.5z"></path>
                    <!-- Official Transport Shield -->
                    <path d="M18 9l4 1.5v3.5c0 3-2 5-4 6-2-1-4-3-4-6v-3.5L18 9z"></path>
                    <!-- Car Line Inside Shield -->
                    <path d="M15.5 14h5"></path>
                    <circle cx="16.5" cy="15.5" r="0.5"></circle>
                    <circle cx="19.5" cy="15.5" r="0.5"></circle>
                </svg>
            </div>
            <span class="service-name">Transport Authority</span>
        </a>

        <!-- 3. BUS Officer -->
        <a class="service-card" href="Category.aspx?type=bus-officer">
            <div class="service-icon-box icon-bus-officer">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- Bus Body -->
                    <rect x="3" y="3" width="18" height="15" rx="3"></rect>
                    <!-- Windshield / Windows -->
                    <line x1="3" y1="9" x2="21" y2="9"></line>
                    <line x1="12" y1="3" x2="12" y2="9"></line>
                    <!-- Headlights -->
                    <circle cx="7" cy="14" r="1"></circle>
                    <circle cx="17" cy="14" r="1"></circle>
                    <!-- Wheels -->
                    <line x1="6" y1="18" x2="6" y2="21"></line>
                    <line x1="18" y1="18" x2="18" y2="21"></line>
                </svg>
            </div>
            <span class="service-name">BUS Officer</span>
        </a>

        <!-- 4. Train Operator -->
        <a class="service-card" href="Category.aspx?type=train-operator">
            <div class="service-icon-box icon-train-operator">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                    <!-- Train Cab Frame -->
                    <rect x="4" y="3" width="16" height="16" rx="2"></rect>
                    <!-- Window Screen -->
                    <rect x="6.5" y="6" width="11" height="5" rx="1"></rect>
                    <!-- Front Marker Lights -->
                    <circle cx="8" cy="15" r="1"></circle>
                    <circle cx="16" cy="15" r="1"></circle>
                    <!-- Rail Tracks -->
                    <line x1="2" y1="21" x2="22" y2="21"></line>
                    <line x1="7" y1="19" x2="5" y2="21"></line>
                    <line x1="17" y1="19" x2="19" y2="21"></line>
                </svg>
            </div>
            <span class="service-name">Train Operator</span>
        </a>

    </div>

</asp:Content>
