<%@ Page Title="Railway Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RailwayDetails.aspx.cs" Inherits="OneGovernment.Railway_From.RailwayDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="../Railway.aspx" title="Back to Railway Services">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18" aria-hidden="true">
                <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
        </a>
    </div>

    <!-- Basic Tab Styling matching site design -->
    <style>
        .tab-header {
            display: flex;
            gap: 6px;
            margin-top: 15px;
            border-bottom: 2px solid #dee2e6;
        }

        .tab-link {
            padding: 9px 20px;
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-bottom: none;
            border-radius: 6px 6px 0 0;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            color: #495057;
            transition: all 0.15s ease;
        }

        .tab-link:hover {
            background-color: #e9ecef;
            color: #0f172a;
        }

        .active-tab {
            background-color: #007bff !important;
            color: #ffffff !important;
            border-color: #007bff !important;
            font-weight: 600;
        }

        .tab-body {
            padding: 24px;
            border: 1px solid #dee2e6;
            border-top: none;
            background-color: #ffffff;
            min-height: 320px;
            border-radius: 0 0 8px 8px;
        }

        .details-heading {
            font-size: 1.25rem;
            font-weight: 700;
            color: #0f172a;
            margin: 0 0 14px 0;
        }

        .details-paragraph {
            color: #334155;
            font-size: 0.95rem;
            line-height: 1.65;
            margin-bottom: 16px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 14px;
            margin: 16px 0;
        }

        .info-card {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 14px;
        }

        .info-card strong {
            display: block;
            color: #1e293b;
            margin-bottom: 6px;
            font-size: 0.95rem;
        }

        .info-card p {
            color: #64748b;
            font-size: 0.88rem;
            margin: 0;
            line-height: 1.5;
        }

        .link-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 12px 16px;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            margin-bottom: 12px;
            text-decoration: none;
            color: #1e293b;
            font-weight: 600;
            transition: all 0.15s ease;
        }

        .link-row:hover {
            background: #eff6ff;
            border-color: #93c5fd;
            color: #1d4ed8;
        }

        .link-btn {
            background: #1e6fd8;
            color: #ffffff;
            padding: 6px 14px;
            border-radius: 6px;
            font-size: 0.85rem;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .doc-list {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .doc-item {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            padding: 12px 14px;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
        }

        .doc-badge {
            background: #e0e7ff;
            color: #4338ca;
            font-size: 0.75rem;
            font-weight: 700;
            padding: 3px 8px;
            border-radius: 4px;
            white-space: nowrap;
        }

        .doc-text strong {
            display: block;
            color: #0f172a;
            font-size: 0.92rem;
        }

        .doc-text span {
            color: #64748b;
            font-size: 0.85rem;
        }

        .video-container {
            width: 100%;
            max-width: 720px;
            margin: 0 auto 20px auto;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 14px rgba(0,0,0,0.1);
        }

        .demo-form-box {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 18px;
            margin-top: 18px;
        }
    </style>

    <div class="tabs-wrapper">
        <!-- Tab Navigation Buttons -->
        <div class="tab-header">
            <asp:Button ID="btnOverview" runat="server" Text="Overview" CommandArgument="Overview" OnClick="Tab_Click" CssClass="tab-link" />
            <asp:Button ID="btnLinks" runat="server" Text="Links" CommandArgument="Links" OnClick="Tab_Click" CssClass="tab-link" />
            <asp:Button ID="btnDocuments" runat="server" Text="Documents" CommandArgument="Documents" OnClick="Tab_Click" CssClass="tab-link" />
            <asp:Button ID="btnDemoForm" runat="server" Text="Demo Form" CommandArgument="DemoForm" OnClick="Tab_Click" CssClass="tab-link" />
        </div>

        <!-- Tab Views Container -->
        <div class="tab-body">
            <asp:MultiView ID="mvDetails" runat="server">
                <!-- 1. OVERVIEW -->
                <asp:View ID="viewOverview" runat="server">
                    <h3 class="details-heading">Indian Railways & IRCTC Passenger Services Overview</h3>
                    <p class="details-paragraph">
                        Indian Railways operates one of the world's largest rail networks. The Indian Railway Catering and Tourism Corporation (IRCTC) facilitates online e-ticketing, PNR status tracking, live train running enquiry, and Tatkal quota bookings.
                    </p>

                    <div class="info-grid">
                        <div class="info-card">
                            <strong>1. Advance Reservation Period (ARP)</strong>
                            <p>General train reservations open 120 days in advance (excluding the date of journey) across all classes.</p>
                        </div>
                        <div class="info-card">
                            <strong>2. Tatkal Scheme Timings</strong>
                            <p>Tatkal opens at 10:00 AM for AC classes (2A/3A/CC) and at 11:00 AM for Non-AC classes (Sleeper) one day prior to journey.</p>
                        </div>
                        <div class="info-card">
                            <strong>3. 10-Digit PNR Inquiry</strong>
                            <p>Passenger Name Record (PNR) provides real-time confirmation status: CNF (Confirmed), RAC, or WL (Waiting List).</p>
                        </div>
                        <div class="info-card">
                            <strong>4. Cancellation & Refund Rules</strong>
                            <p>Online ticket cancellation refunds are automatically processed to the original payment source within 3-5 working days.</p>
                        </div>
                    </div>
                </asp:View>

                <!-- 2. LINKS -->
                <asp:View ID="viewLinks" runat="server">
                    <h3 class="details-heading">Official Railway Portals & Tracking Links</h3>
                    
                    <div class="link-row">
                        <div>
                            <div>IRCTC Next Generation e-Ticketing System</div>
                            <small style="color: #64748b;">Official portal for train ticket reservation, Tatkal booking, and meal orders</small>
                        </div>
                        <a href="https://www.irctc.co.in/" target="_blank" rel="noopener noreferrer" class="link-btn">
                            IRCTC Portal &rarr;
                        </a>
                    </div>

                    <div class="link-row">
                        <div>
                            <div>National Train Enquiry System (NTES)</div>
                            <small style="color: #64748b;">Real-time live train running status, train schedule, and station departures</small>
                        </div>
                        <a href="https://enquiry.indianrail.gov.in/" target="_blank" rel="noopener noreferrer" class="link-btn">
                            NTES Live &rarr;
                        </a>
                    </div>

                    <div class="link-row">
                        <div>
                            <div>Indian Railways Passenger Reservation Enquiry</div>
                            <small style="color: #64748b;">Check 10-digit PNR status, seat availability, and fare enquiry</small>
                        </div>
                        <a href="https://www.indianrail.gov.in/" target="_blank" rel="noopener noreferrer" class="link-btn">
                            PNR Enquiry &rarr;
                        </a>
                    </div>
                </asp:View>

                <!-- 3. DOCUMENTS -->
                <asp:View ID="viewDocuments" runat="server">
                    <h3 class="details-heading">Original ID Documents for Train Travel</h3>
                    <p class="details-paragraph">At least one passenger per ticket must carry original photo identity proof during the entire journey:</p>

                    <ul class="doc-list">
                        <li class="doc-item">
                            <span class="doc-badge">Aadhaar</span>
                            <div class="doc-text">
                                <strong>Aadhaar Card / m-Aadhaar</strong>
                                <span>Physical Aadhaar card or digital Aadhaar displayed in the official mAadhaar or DigiLocker application.</span>
                            </div>
                        </li>
                        <li class="doc-item">
                            <span class="doc-badge">Voter ID</span>
                            <div class="doc-text">
                                <strong>Voter Identity Card (EPIC)</strong>
                                <span>Election commission photo identity card or digital e-EPIC certificate.</span>
                            </div>
                        </li>
                        <li class="doc-item">
                            <span class="doc-badge">Driving License</span>
                            <div class="doc-text">
                                <strong>Government Driving License</strong>
                                <span>Original laminated smart card driving license issued by state RTO or in mParivahan app.</span>
                            </div>
                        </li>
                        <li class="doc-item">
                            <span class="doc-badge">Student/Govt ID</span>
                            <div class="doc-text">
                                <strong>Student ID or Central/State Government ID</strong>
                                <span>Recognized school/college student identity card or employee ID card issued by government bodies.</span>
                            </div>
                        </li>
                    </ul>
                </asp:View>

                <!-- 4. DEMO FORM (ORIGINAL INDIAN RAILWAYS RESERVATION FORM) -->
                <asp:View ID="viewDemoForm" runat="server">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px;">
                        <h3 class="details-heading" style="margin: 0;">Original Indian Railways Passenger Reservation Demo Form</h3>
                        <button type="button" onclick="window.print()" class="link-btn" style="cursor: pointer; border: none;">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <polyline points="6 9 6 2 18 2 18 9"></polyline>
                                <path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path>
                                <rect x="6" y="14" width="12" height="8"></rect>
                            </svg>
                            Print Demo Form
                        </button>
                    </div>

                    <!-- Official Railway Requisition Sheet -->
                    <div style="background: #ffffff; border: 2px solid #0f172a; border-radius: 8px; padding: 24px; max-width: 780px; margin: 0 auto; box-shadow: 0 4px 16px rgba(0,0,0,0.08); font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; color: #0f172a;">
                        
                        <!-- Header Banner -->
                        <div style="text-align: center; border-bottom: 2px solid #0f172a; padding-bottom: 12px; margin-bottom: 16px;">
                            <div style="font-size: 0.85rem; font-weight: 700; letter-spacing: 1px; color: #475569;">GOVERNMENT OF INDIA &bull; MINISTRY OF RAILWAYS &bull; PASSENGER RESERVATION SYSTEM</div>
                            <h2 style="font-size: 1.25rem; font-weight: 800; margin: 6px 0; color: #0f172a; text-transform: uppercase;">Requisition for Reservation / Cancellation</h2>
                            <div style="font-size: 0.8rem; color: #dc2626; font-weight: 600;">(FORM NO: IR-RES-01 &bull; Fill in CAPITAL LETTERS &bull; Max 6 Passengers per Slip)</div>
                        </div>

                        <!-- Train & Journey Details Grid -->
                        <div style="border: 1px solid #cbd5e1; padding: 12px; border-radius: 4px; margin-bottom: 12px; background: #f8fafc; font-size: 0.85rem;">
                            <div style="display: grid; grid-template-columns: 2fr 1fr 1fr; gap: 10px; margin-bottom: 8px;">
                                <div><strong>Train No. & Name:</strong> 12951 / TEJAS RAJDHANI EXPRESS</div>
                                <div><strong>Date of Journey:</strong> 15 / 10 / 2026</div>
                                <div><strong>Class:</strong> [ &check; ] 2A &nbsp; [ ] 3A &nbsp; [ ] SL</div>
                            </div>
                            <div style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr; gap: 10px;">
                                <div><strong>Station From:</strong> AHMEDABAD (ADI)</div>
                                <div><strong>Station To:</strong> NEW DELHI (NDLS)</div>
                                <div><strong>Boarding At:</strong> ADI JN</div>
                                <div><strong>No. of Berths:</strong> 2 (Two)</div>
                            </div>
                        </div>

                        <!-- Passenger Information Table -->
                        <div style="border: 1px solid #0f172a; border-radius: 4px; overflow: hidden; margin-bottom: 12px;">
                            <table style="width: 100%; border-collapse: collapse; font-size: 0.82rem; text-align: left;">
                                <thead>
                                    <tr style="background: #0f172a; color: #ffffff;">
                                        <th style="padding: 8px; border: 1px solid #334155; width: 35px; text-align: center;">S.N.</th>
                                        <th style="padding: 8px; border: 1px solid #334155;">Name of Passenger (in Block Letters)</th>
                                        <th style="padding: 8px; border: 1px solid #334155; width: 55px; text-align: center;">Gender</th>
                                        <th style="padding: 8px; border: 1px solid #334155; width: 45px; text-align: center;">Age</th>
                                        <th style="padding: 8px; border: 1px solid #334155;">Berth Preference</th>
                                        <th style="padding: 8px; border: 1px solid #334155; width: 90px; text-align: center;">Meal (AC)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr style="background: #ffffff;">
                                        <td style="padding: 8px; border: 1px solid #cbd5e1; text-align: center; font-weight: 700;">1</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1; font-weight: 600;">RAMESH KUMAR PANDEY</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1; text-align: center;">M</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1; text-align: center;">34</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1;">Lower Berth (LB)</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1; text-align: center;">Veg</td>
                                    </tr>
                                    <tr style="background: #f8fafc;">
                                        <td style="padding: 8px; border: 1px solid #cbd5e1; text-align: center; font-weight: 700;">2</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1; font-weight: 600;">SUNITA RAMESH PANDEY</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1; text-align: center;">F</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1; text-align: center;">31</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1;">Lower Berth (LB)</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1; text-align: center;">Veg</td>
                                    </tr>
                                    <tr style="background: #ffffff; color: #94a3b8;">
                                        <td style="padding: 8px; border: 1px solid #cbd5e1; text-align: center;">3</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1;">&nbsp;</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1;">&nbsp;</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1;">&nbsp;</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1;">&nbsp;</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1;">&nbsp;</td>
                                    </tr>
                                    <tr style="background: #f8fafc; color: #94a3b8;">
                                        <td style="padding: 8px; border: 1px solid #cbd5e1; text-align: center;">4</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1;">&nbsp;</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1;">&nbsp;</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1;">&nbsp;</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1;">&nbsp;</td>
                                        <td style="padding: 8px; border: 1px solid #cbd5e1;">&nbsp;</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- Onward / Return Details -->
                        <div style="border: 1px solid #cbd5e1; padding: 10px 12px; border-radius: 4px; margin-bottom: 12px; font-size: 0.82rem;">
                            <strong>Return / Onward Journey Details (if any):</strong>
                            <div style="display: grid; grid-template-columns: 2fr 1fr 1fr; gap: 8px; margin-top: 4px; color: #475569;">
                                <div>Train No. & Name: 12952 / NEW DELHI - ADI TEJAS RAJDHANI</div>
                                <div>Date: 22 / 10 / 2026</div>
                                <div>Class: 2A (AC Two Tier)</div>
                            </div>
                        </div>

                        <!-- Applicant Contact & Signature Box -->
                        <div style="border: 1px solid #cbd5e1; padding: 12px; border-radius: 4px; margin-bottom: 12px; font-size: 0.85rem;">
                            <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 14px;">
                                <div>
                                    <div><strong>Name of Applicant:</strong> RAMESH KUMAR PANDEY</div>
                                    <div style="margin-top: 4px;"><strong>Full Residential Address:</strong> B-402, Shivalik Residency, Ashram Road, Ahmedabad - 380009</div>
                                    <div style="margin-top: 4px;"><strong>Mobile No. (for SMS PNR Alerts):</strong> +91 98765 43210</div>
                                </div>
                                <div style="border: 1px dashed #0f172a; height: 80px; text-align: center; display: flex; flex-direction: column; justify-content: flex-end; padding-bottom: 6px; font-size: 0.72rem; color: #0f172a; font-weight: 700; background: #fff;">
                                    Signature of Applicant / Representative
                                </div>
                            </div>
                        </div>

                        <!-- PRS Official Use Box -->
                        <div style="border: 1px solid #0f172a; background: #f1f5f9; padding: 10px 12px; border-radius: 4px; font-size: 0.8rem; display: flex; justify-content: space-between; align-items: center;">
                            <div>
                                <strong>FOR PRS RESERVATION OFFICE USE ONLY:</strong><br />
                                <span>PNR Generated: <strong>245-8910243</strong> &bull; Total Amount Received: <strong>₹ 4,350/-</strong> &bull; Window No: 04</span>
                            </div>
                            <div style="border: 1px solid #64748b; padding: 6px 12px; background: #fff; font-weight: bold; border-radius: 4px;">
                                PRS Booking Stamp & Sign
                            </div>
                        </div>

                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>
