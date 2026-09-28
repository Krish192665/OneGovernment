<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="OneGovernment.Home" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Dashboard | One Government</title>
    <link href="~/Styles/site.css" rel="stylesheet" />
</head>
<body>
    <form id="homeForm" runat="server">
        <div class="portal-wrapper">
            <!-- Header -->
            <header class="portal-header">
                <a class="portal-brand" href="Home.aspx">
                    <div class="portal-brand-logo">
                        <svg viewBox="0 0 24 24" fill="currentColor">
                            <path d="M12 1L2 6v2h20V6L12 1zm0 3.2L18.4 6H5.6L12 4.2zM4 10v9h3v-9H4zm6 0v9h4v-9h-4zm7 0v9h3v-9h-3zM2 21v2h20v-2H2z"/>
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
                                <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
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
                        <h1>Welcome back, <asp:Literal ID="UserGreetingLiteral" runat="server">John Doe</asp:Literal> &#128075;</h1>
                        <p>Access all government services in one place</p>
                    </div>

                    <h2 class="section-title">All Services</h2>

                    <div class="services-grid">
                        <!-- 1. IT Services -->
                        <a class="service-card" href="Category.aspx?type=it">
                            <div class="service-icon-box icon-it">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <rect x="2" y="3" width="20" height="14" rx="2" ry="2"></rect>
                                    <line x1="8" y1="21" x2="16" y2="21"></line>
                                    <line x1="12" y1="17" x2="12" y2="21"></line>
                                </svg>
                            </div>
                            <span class="service-name">IT Services</span>
                        </a>

                        <!-- 2. Police -->
                        <a class="service-card" href="Category.aspx?type=police">
                            <div class="service-icon-box icon-police">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                                    <circle cx="12" cy="11" r="3"></circle>
                                </svg>
                            </div>
                            <span class="service-name">Police</span>
                        </a>

                        <!-- 3. Students -->
                        <a class="service-card" href="Category.aspx?type=student">
                            <div class="service-icon-box icon-students">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M22 10v6M2 10l10-5 10 5-10 5z"></path>
                                    <path d="M6 12v5c3 3 9 3 12 0v-5"></path>
                                </svg>
                            </div>
                            <span class="service-name">Students</span>
                        </a>

                        <!-- 4. Colleges -->
                        <a class="service-card" href="Category.aspx?type=colleges">
                            <div class="service-icon-box icon-colleges">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M3 21h18M3 10h18M5 10v11M19 10v11M9 10v11M15 10v11M12 3l9 7H3l9-7z"></path>
                                </svg>
                            </div>
                            <span class="service-name">Colleges</span>
                        </a>

                        <!-- 5. RTO -->
                        <a class="service-card" href="Category.aspx?type=rto">
                            <div class="service-icon-box icon-rto">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <rect x="1" y="5" width="22" height="12" rx="2"></rect>
                                    <circle cx="7" cy="17" r="2"></circle>
                                    <circle cx="17" cy="17" r="2"></circle>
                                </svg>
                            </div>
                            <span class="service-name">RTO</span>
                        </a>

                        <!-- 6. Passport -->
                        <a class="service-card" href="Category.aspx?type=passport">
                            <div class="service-icon-box icon-passport">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <rect x="3" y="4" width="18" height="16" rx="2"></rect>
                                    <circle cx="12" cy="10" r="3"></circle>
                                    <path d="M7 17h10"></path>
                                </svg>
                            </div>
                            <span class="service-name">Passport</span>
                        </a>

                        <!-- 7. Taxes -->
                        <a class="service-card" href="Category.aspx?type=taxes">
                            <div class="service-icon-box icon-taxes">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <line x1="12" y1="1" x2="12" y2="23"></line>
                                    <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
                                </svg>
                            </div>
                            <span class="service-name">Taxes</span>
                        </a>

                        <!-- 8. Health -->
                        <a class="service-card" href="Category.aspx?type=health">
                            <div class="service-icon-box icon-health">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
                                </svg>
                            </div>
                            <span class="service-name">Health</span>
                        </a>

                        <!-- 9. Transport -->
                        <a class="service-card" href="Category.aspx?type=transport">
                            <div class="service-icon-box icon-transport">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <rect x="4" y="3" width="16" height="16" rx="2"></rect>
                                    <circle cx="8" cy="15" r="1.5"></circle>
                                    <circle cx="16" cy="15" r="1.5"></circle>
                                    <line x1="4" y1="10" x2="20" y2="10"></line>
                                </svg>
                            </div>
                            <span class="service-name">Transport</span>
                        </a>

                        <!-- 10. Agriculture -->
                        <a class="service-card" href="Category.aspx?type=agriculture">
                            <div class="service-icon-box icon-agriculture">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M12 2a10 10 0 0 1 10 10c0 5.52-4.48 10-10 10S2 17.52 2 12c0-3.35 1.64-6.31 4.17-8.13"></path>
                                    <path d="M12 22V12"></path>
                                    <path d="M8 8c1.5 0 3 .5 4 2 1-1.5 2.5-2 4-2"></path>
                                </svg>
                            </div>
                            <span class="service-name">Agriculture</span>
                        </a>

                        <!-- 11. Electricity -->
                        <a class="service-card" href="Category.aspx?type=electricity">
                            <div class="service-icon-box icon-electricity">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                </svg>
                            </div>
                            <span class="service-name">Electricity</span>
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
        </div>
    </form>
</body>
</html>
