<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Police.aspx.cs" Inherits="OneGovernment.Police" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Dashboard | One Government</title>
    <link href="~/Styles/site.css" rel="stylesheet" />
    <link href="Home.aspx" rel="next" />
</head>
<body>
    <form id="homeForm" runat="server">
        <div class="portal-wrapper">
            <!-- Header -->
            <header class="portal-header">
                <a class="portal-brand" href="Home.aspx">
                    <div class="portal-brand-logo">
                        <svg viewBox="0 0 24 24" fill="currentColor">
                            <path d="M12 1L2 6v2h20V6L12 1zm0 3.2L18.4 6H5.6L12 4.2zM4 10v9h3v-9H4zm6 0v9h4v-9h-4zm7 0v9h3v-9h-3zM2 21v2h20v-2H2z" />
                        </svg>
                    </div>
                    <div class="portal-brand-text">
                        <strong>One Government</strong>
                        <small>All Government Services, One Platform</small>
                    </div>
                </a>

                <div class="header-search">
                    <svg class="search-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                    <input type="text" placeholder="Search services..." />
                </div>

                <div class="header-actions">
                    <button type="button" class="notification-bell" title="Notifications" aria-label="Notifications">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>
                            <path d="M13.73 21a2 2 0 0 1-3.46 0"></path>
                        </svg>
                        <span class="notification-dot"></span>
                    </button>

                    <a href="Profile.aspx" class="user-profile-chip">
                        <div class="user-avatar-circle">
                            <svg viewBox="0 0 24 24" fill="currentColor">
                                <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z" />
                            </svg>
                        </div>
                        <asp:Label ID="UserNameLabel" runat="server" CssClass="user-name" Text="Ramesh Pande" />
                        <svg class="chevron-down" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="6 9 12 15 18 9"></polyline>
                        </svg>
                    </a>
                </div>
            </header>

            <!-- Layout: Sidebar + Content -->
            <div class="portal-layout">
                <!-- Sidebar -->
                <aside class="portal-sidebar">
                    <nav class="sidebar-nav">
                        <a class="nav-link active" href="Home.aspx">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                <polyline points="9 22 9 12 15 12 15 22"></polyline>
                            </svg>
                            Home
                        </a>
                        <a class="nav-link" href="Profile.aspx">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                <circle cx="12" cy="7" r="4"></circle>
                            </svg>
                            Profile
                        </a>
                        <a class="nav-link" href="Setting.aspx">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="12" r="3"></circle>
                                <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path>
                            </svg>
                            Settings
                        </a>
                        <a class="nav-link" href="AboutUs.aspx">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="12" r="10"></circle>
                                <line x1="12" y1="16" x2="12" y2="12"></line>
                                <line x1="12" y1="8" x2="12.01" y2="8"></line>
                            </svg>
                            About Us
                        </a>
                        <a class="nav-link" href="ContactUs.aspx">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
                            </svg>
                            Contact Us
                        </a>
                        <a class="nav-link" href="HelpSupport.aspx">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="12" r="10"></circle>
                                <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                                <line x1="12" y1="17" x2="12.01" y2="17"></line>
                            </svg>
                            Help &amp; Support
                        </a>
                        <a class="nav-link" href="PrivacySecurity.aspx">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                            </svg>
                            Privacy &amp; Security
                        </a>
                    </nav>

                    <asp:LinkButton ID="LogoutButton" runat="server" CssClass="nav-link logout" CausesValidation="false" OnClick="LogoutButton_Click">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                            <polyline points="16 17 21 12 16 7"></polyline>
                            <line x1="21" y1="12" x2="9" y2="12"></line>
                        </svg>
                        Logout
                    </asp:LinkButton>
                </aside>

                <!-- Content -->
                <main class="portal-content">
                    <div class="page-greeting">
                        <h1>
                            <asp:Literal ID="UserGreetingLiteral" runat="server">Ramesh Pandey</asp:Literal>
                            &#128075;</h1>
                        <p>Access all government services in one place</p>
                    </div>

                    <h2 class="section-title">Category</h2>

                    <div class="services-grid">
                        <!-- 1. File-e-FIR -->
                        <a class="service-card" href="Category.aspx?type=File-e-FIR">
                            <div class="service-icon-box icon-File-e-FIR">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                                    <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                                    <polyline points="14 2 14 8 20 8"></polyline>
                                    <line x1="16" y1="13" x2="8" y2="13"></line>
                                    <line x1="16" y1="17" x2="8" y2="17"></line>
                                    <line x1="10" y1="9" x2="8" y2="9"></line>
                                </svg>
                            </div>
                            <span class="service-name">File-e-FIR</span>
                        </a>

                        <!-- 2. PCC -->
                        <a class="service-card" href="Police.aspx?type=PCC">
                            <div class="service-icon-box icon-PCC">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                                    <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                                    <polyline points="9 12 11 14 15 10"></polyline>
                                </svg>
                            </div>
                            <span class="service-name">PCC</span>
                        </a>

                        <!-- 3. Tenant Verification -->
                        <a class="service-card" href="Category.aspx?type=Tenant-Verification">
                            <div class="service-icon-box icon-Tenant-Verification">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                                    <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                    <path d="M9 22V12h6v10"></path>
                                    <circle cx="12" cy="7" r="1.5"></circle>
                                </svg>
                            </div>
                            <span class="service-name">Tenant Verification</span>
                        </a>

                        <!-- 4. Domestic Help Verification -->
                        <a class="service-card" href="Category.aspx?type=Domestic-Help-Verification">
                            <div class="service-icon-box icon-Domestic-Help-Verification">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="9" cy="7" r="4"></circle>
                                    <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                    <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                </svg>
                            </div>
                            <span class="service-name">Domestic Help Verification</span>
                        </a>

                        <!-- 5. Lost Property Report -->
                        <a class="service-card" href="Category.aspx?type=Lost-Property-Report">
                            <div class="service-icon-box icon-Lost-Property-Report">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                                    <rect x="2" y="7" width="20" height="14" rx="2" ry="2"></rect>
                                    <path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path>
                                    <line x1="12" y1="11" x2="12" y2="13"></line>
                                </svg>
                            </div>
                            <span class="service-name">Lost Property Report</span>
                        </a>

                        <!-- 6. Missing Person Report -->
                        <a class="service-card" href="Category.aspx?type=Missing-Person-Report">
                            <div class="service-icon-box icon-Missing-Person-Report">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                                    <circle cx="11" cy="11" r="8"></circle>
                                    <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                                    <line x1="11" y1="8" x2="11.01" y2="8"></line>
                                    <line x1="11" y1="11" x2="11" y2="14"></line>
                                </svg>
                            </div>
                            <span class="service-name">Missing Person Report</span>
                        </a>

                        <!-- 7. Traffic E-Challan -->
                        <a class="service-card" href="Category.aspx?type=Traffic-E-Challan">
                            <div class="service-icon-box icon-Traffic-E-Challan">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                                    <rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect>
                                    <line x1="1" y1="10" x2="23" y2="10"></line>
                                    <line x1="6" y1="15" x2="10" y2="15"></line>
                                </svg>
                            </div>
                            <span class="service-name">Traffic E-Challan</span>
                        </a>

                        <!-- 8. Sound Permission -->
                        <a class="service-card" href="Category.aspx?type=Sound-Permission">
                            <div class="service-icon-box icon-Sound-Permission">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                                    <path d="M11 5L6 9H2v6h4l5 4V5z"></path>
                                    <path d="M19.07 4.93a10 10 0 0 1 0 14.14M15.54 8.46a5 5 0 0 1 0 7.07"></path>
                                </svg>
                            </div>
                            <span class="service-name">Sound Permission</span>
                        </a>

                        <!-- 9. Cyber Crime Complaint -->
                        <a class="service-card" href="Category.aspx?type=Cyber-Crime-Complaint">
                            <div class="service-icon-box icon-Cyber-Crime-Complaint">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                                    <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                                    <polyline points="9 9 12 12 9 15"></polyline>
                                    <line x1="13" y1="15" x2="15" y2="15"></line>
                                </svg>
                            </div>
                            <span class="service-name">Cyber Crime Complaint</span>
                        </a>

                        <!-- 10. Senior Citizen Cell -->
                        <a class="service-card" href="Category.aspx?type=senior-citizen-cell">
                            <div class="service-icon-box icon-Senior-Citizen-Cell">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="28" height="28">
                                    <circle cx="12" cy="7" r="4"></circle>
                                    <path d="M6 21v-2a4 4 0 0 1 4-4h4a4 4 0 0 1 4 4v2"></path>
                                    <path d="M18 11l2 2 4-4"></path>
                                </svg>
                            </div>
                            <span class="service-name">Senior Citizen Cell</span>
                        </a>

                        <!-- 11. Arms License -->
                        <a class="service-card" href="Category.aspx?type=arms-license">
                            <div class="service-icon-box icon-Arms-License">
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

                        <!-- 12. More -->
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
            </main>
         </div>
    </form>
</body>
</html>
