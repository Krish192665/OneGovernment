<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="OneGovernment.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server"> <main class="portal-content">
     <div class="page-greeting">
         <h1>Welcome back, Ramesh Pandey&#128075;</h1>
         <p>Access all government services in one place</p>
     </div>

     <h2 class="section-title">All Services</h2>

     <div class="services-grid">
         <!-- 1. IT Services -->
         <a class="service-card" href="Itservice.aspx?type=it">
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
         <a class="service-card" href="Police.aspx?type=police">
             <div class="service-icon-box icon-police">
                 <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                     <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                     <circle cx="12" cy="11" r="3"></circle>
                 </svg>
             </div>
             <span class="service-name">Police</span>
         </a>

         <!-- 3. Students -->
         <a class="service-card"  href="Student.aspx?type=student">
             <div class="service-icon-box icon-students">
                 <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                     <path d="M22 10v6M2 10l10-5 10 5-10 5z"></path>
                     <path d="M6 12v5c3 3 9 3 12 0v-5"></path>
                 </svg>
             </div>
             <span class="service-name">Students</span>
         </a>

         <!-- 4. Colleges -->
         <a class="service-card" href="Collage.aspx?type=colleges">
             <div class="service-icon-box icon-colleges">
                 <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                     <path d="M3 21h18M3 10h18M5 10v11M19 10v11M9 10v11M15 10v11M12 3l9 7H3l9-7z"></path>
                 </svg>
             </div>
             <span class="service-name">Colleges</span>
         </a>

         <!-- 5. RTO -->
         <a class="service-card" href="RTO.aspx?type=rto">
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
         <a class="service-card" href="Passport.aspx?type=passport">
             <div class="service-icon-box icon-passport">
                 <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                     <rect x="3" y="4" width="18" height="16" rx="2"></rect>
                     <circle cx="12" cy="10" r="3"></circle>
                     <path d="M7 17h10"></path>
                 </svg>
             </div>
             <span class="service-name">Passport</span>
         </a>

         <!-- 7. IncomTaxes -->
         <a class="service-card" href="IncomText.aspx?type=IncomText">
             <div class="service-icon-box icon-taxes">
                 <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                     <line x1="12" y1="1" x2="12" y2="23"></line>
                     <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
                 </svg>
             </div>
             <span class="service-name">Income Taxes</span>
         </a>

         <!-- 8. Health -->
         <a class="service-card" href="Health.aspx?type=health">
             <div class="service-icon-box icon-health">
                 <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                     <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
                 </svg>
             </div>
             <span class="service-name">Health</span>
         </a>

         <!-- 9. Transport -->
         <a class="service-card" href="Transport.aspx?type=transport">
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
         <a class="service-card" href="Agriculture.aspx?type=agriculture">
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
         <a class="service-card" href="Electricity.aspx?type=electricity">
             <div class="service-icon-box icon-electricity">
                 <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                     <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                 </svg>
             </div>
             <span class="service-name">Electricity</span>
         </a>

         <!-- 12. Aadhaar & Identity -->
         <a class="service-card" href="Aadhaar.aspx?type=aadhaar">
             <div class="service-icon-box icon-aadhaar">
                 <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                     <rect x="3" y="4" width="18" height="16" rx="3"></rect>
                     <circle cx="9" cy="10" r="2.5"></circle>
                     <path d="M15 8h2M15 12h2M7 16h10"></path>
                 </svg>
             </div>
             <span class="service-name">Aadhaar & Identity</span>
         </a>

         <!-- 13. Banking & Schemes -->
         <a class="service-card" href="Banking.aspx?type=banking">
             <div class="service-icon-box icon-banking">
                 <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                     <path d="M3 21h18M3 10h18M5 10v11M19 10v11M9 10v11M15 10v11M12 2l10 5H2l10-5z"></path>
                 </svg>
             </div>
             <span class="service-name">Banking & Schemes</span>
         </a>

         <!-- 14. Railway & IRCTC -->
         <a class="service-card" href="Railway.aspx?type=railway">
             <div class="service-icon-box icon-railway">
                 <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                     <rect x="4" y="3" width="16" height="16" rx="2"></rect>
                     <path d="M4 11h16M12 3v8M8 19l-3 3M16 19l3 3"></path>
                     <circle cx="8" cy="15" r="1"></circle>
                     <circle cx="16" cy="15" r="1"></circle>
                 </svg>
             </div>
             <span class="service-name">Railway & IRCTC</span>
         </a>

         <!-- 15. Ration Card -->
         <a class="service-card" href="RationCard.aspx?type=ration">
             <div class="service-icon-box icon-ration">
                 <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                     <rect x="2" y="4" width="20" height="16" rx="2"></rect>
                     <path d="M7 15h4M7 11h10M7 7h6"></path>
                     <circle cx="16" cy="14" r="2"></circle>
                 </svg>
             </div>
             <span class="service-name">Ration Card</span>
         </a>

     </div>
 </main>
</asp:Content>
