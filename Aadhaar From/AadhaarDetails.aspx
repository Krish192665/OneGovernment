<%@ Page Title="Aadhaar Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AadhaarDetails.aspx.cs" Inherits="OneGovernment.Aadhaar_From.AadhaarDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="../Aadhaar.aspx" title="Back to Aadhaar Services">
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
            background: #e0f2fe;
            color: #0284c7;
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
                    <h3 class="details-heading">Aadhaar Enrolment & Identification Overview</h3>
                    <p class="details-paragraph">
                        Aadhaar is a 12-digit unique identity number issued by the Unique Identification Authority of India (UIDAI) on behalf of the Government of India. It serves as proof of identity and address across India for citizens of all age groups.
                    </p>

                    <div class="info-grid">
                        <div class="info-card">
                            <strong>1. Biometric Capture</strong>
                            <p>Capture of 10 fingerprints, iris scan for both eyes, and high-resolution facial photograph at authorized centers.</p>
                        </div>
                        <div class="info-card">
                            <strong>2. Demographic Information</strong>
                            <p>Verification of resident full name, date of birth, gender, permanent address, active mobile number, and email.</p>
                        </div>
                        <div class="info-card">
                            <strong>3. Mandatory Updates</strong>
                            <p>Children must update their biometrics twice: first upon reaching 5 years of age, and second at 15 years of age.</p>
                        </div>
                        <div class="info-card">
                            <strong>4. Security & Privacy</strong>
                            <p>Masked Aadhaar and Virtual ID (VID) options are available to protect citizen privacy during online e-KYC.</p>
                        </div>
                    </div>
                </asp:View>

                <!-- 2. LINKS -->
                <asp:View ID="viewLinks" runat="server">
                    <h3 class="details-heading">Official Portals & Direct Links</h3>
                    
                    <div class="link-row">
                        <div>
                            <div>MyAadhaar Resident Portal (UIDAI)</div>
                            <small style="color: #64748b;">Download e-Aadhaar, check status, and update demographic data</small>
                        </div>
                        <a href="https://myaadhaar.uidai.gov.in/" target="_blank" rel="noopener noreferrer" class="link-btn">
                            Visit Portal &rarr;
                        </a>
                    </div>

                    <div class="link-row">
                        <div>
                            <div>Book Aadhaar Seva Kendra Appointment</div>
                            <small style="color: #64748b;">Schedule offline slot for new enrolment or biometric correction</small>
                        </div>
                        <a href="https://appointments.uidai.gov.in/" target="_blank" rel="noopener noreferrer" class="link-btn">
                            Book Slot &rarr;
                        </a>
                    </div>

                    <div class="link-row">
                        <div>
                            <div>Check Enrolment & Update Status</div>
                            <small style="color: #64748b;">Track status using 14-digit Enrolment ID (EID) and timestamp</small>
                        </div>
                        <a href="https://myaadhaar.uidai.gov.in/check-aadhaar" target="_blank" rel="noopener noreferrer" class="link-btn">
                            Check Status &rarr;
                        </a>
                    </div>
                </asp:View>

                <!-- 3. DOCUMENTS -->
                <asp:View ID="viewDocuments" runat="server">
                    <h3 class="details-heading">Original Documents Required</h3>
                    <p class="details-paragraph">Please bring original supporting documents for verification at the Aadhaar Seva Kendra:</p>

                    <ul class="doc-list">
                        <li class="doc-item">
                            <span class="doc-badge">POI</span>
                            <div class="doc-text">
                                <strong>Proof of Identity</strong>
                                <span>Passport, PAN Card, Voter ID, Driving License, Government ID card, or Arms License.</span>
                            </div>
                        </li>
                        <li class="doc-item">
                            <span class="doc-badge">POA</span>
                            <div class="doc-text">
                                <strong>Proof of Address</strong>
                                <span>Electricity Bill / Water Bill (max 3 months old), Bank Statement/Passbook, Registered Rent Agreement, or Ration Card.</span>
                            </div>
                        </li>
                        <li class="doc-item">
                            <span class="doc-badge">DOB</span>
                            <div class="doc-text">
                                <strong>Date of Birth Verification</strong>
                                <span>Birth Certificate issued by municipal authority, SSLC / 10th Class mark sheet, or Passport.</span>
                            </div>
                        </li>
                        <li class="doc-item">
                            <span class="doc-badge">POR</span>
                            <div class="doc-text">
                                <strong>Proof of Relationship (Minors)</strong>
                                <span>Birth Certificate showing parent names or Family Ration Card along with parents' valid Aadhaar.</span>
                            </div>
                        </li>
                    </ul>
                </asp:View>

                <!-- 4. DEMO FORM (ORIGINAL GOVERNMENT APPLICATION FORM) -->
                <asp:View ID="viewDemoForm" runat="server">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px;">
                        <h3 class="details-heading" style="margin: 0;">Original Aadhaar Enrolment / Correction Demo Form</h3>
                        <button type="button" onclick="window.print()" class="link-btn" style="cursor: pointer; border: none;">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <polyline points="6 9 6 2 18 2 18 9"></polyline>
                                <path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path>
                                <rect x="6" y="14" width="12" height="8"></rect>
                            </svg>
                            Print Demo Form
                        </button>
                    </div>

                    <!-- Official Form Sheet -->
                    <div style="background: #ffffff; border: 2px solid #0f172a; border-radius: 8px; padding: 24px; max-width: 780px; margin: 0 auto; box-shadow: 0 4px 16px rgba(0,0,0,0.08); font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; color: #0f172a;">
                        
                        <!-- Header Banner -->
                        <div style="text-align: center; border-bottom: 2px solid #0f172a; padding-bottom: 12px; margin-bottom: 16px;">
                            <div style="font-size: 0.85rem; font-weight: 700; letter-spacing: 1px; color: #475569;">GOVERNMENT OF INDIA &bull; UNIQUE IDENTIFICATION AUTHORITY OF INDIA</div>
                            <h2 style="font-size: 1.25rem; font-weight: 800; margin: 6px 0; color: #0f172a; text-transform: uppercase;">Aadhaar Enrolment / Correction Form</h2>
                            <div style="font-size: 0.8rem; color: #dc2626; font-weight: 600;">(Please fill in BLOCK LETTERS only &bull; Use Black or Blue Ball Point Pen &bull; Free of Cost)</div>
                        </div>

                        <!-- Top Flags -->
                        <div style="display: flex; justify-content: space-between; gap: 10px; margin-bottom: 14px; font-size: 0.85rem;">
                            <div style="border: 1px solid #cbd5e1; padding: 8px 12px; border-radius: 4px; flex: 1;">
                                <strong>Application Type:</strong> [ &check; ] Resident Indian &nbsp;&nbsp; [ &nbsp; ] Non-Resident Indian (NRI)
                            </div>
                            <div style="border: 1px solid #cbd5e1; padding: 8px 12px; border-radius: 4px; flex: 1;">
                                <strong>Request:</strong> [ &check; ] New Enrolment &nbsp;&nbsp; [ &nbsp; ] Update / Correction
                            </div>
                        </div>

                        <!-- Section 1: Pre-enrolment / Aadhaar number -->
                        <div style="border: 1px solid #cbd5e1; padding: 10px 14px; border-radius: 4px; margin-bottom: 12px; background: #f8fafc; font-size: 0.88rem;">
                            <strong>1. 28-Digit Enrolment ID (EID) / 12-Digit Aadhaar Number (if update):</strong>
                            <div style="display: flex; gap: 4px; margin-top: 6px;">
                                <span style="display: inline-block; width: 22px; height: 26px; border: 1px solid #64748b; background: #fff; text-align: center; line-height: 26px; font-weight: bold;">X</span>
                                <span style="display: inline-block; width: 22px; height: 26px; border: 1px solid #64748b; background: #fff; text-align: center; line-height: 26px; font-weight: bold;">X</span>
                                <span style="display: inline-block; width: 22px; height: 26px; border: 1px solid #64748b; background: #fff; text-align: center; line-height: 26px; font-weight: bold;">X</span>
                                <span style="display: inline-block; width: 22px; height: 26px; border: 1px solid #64748b; background: #fff; text-align: center; line-height: 26px; font-weight: bold;">X</span>
                                <span style="margin: 0 4px; font-weight: bold;">-</span>
                                <span style="display: inline-block; width: 22px; height: 26px; border: 1px solid #64748b; background: #fff; text-align: center; line-height: 26px; font-weight: bold;">X</span>
                                <span style="display: inline-block; width: 22px; height: 26px; border: 1px solid #64748b; background: #fff; text-align: center; line-height: 26px; font-weight: bold;">X</span>
                                <span style="display: inline-block; width: 22px; height: 26px; border: 1px solid #64748b; background: #fff; text-align: center; line-height: 26px; font-weight: bold;">X</span>
                                <span style="display: inline-block; width: 22px; height: 26px; border: 1px solid #64748b; background: #fff; text-align: center; line-height: 26px; font-weight: bold;">X</span>
                                <span style="margin: 0 4px; font-weight: bold;">-</span>
                                <span style="display: inline-block; width: 22px; height: 26px; border: 1px solid #64748b; background: #fff; text-align: center; line-height: 26px; font-weight: bold;">1</span>
                                <span style="display: inline-block; width: 22px; height: 26px; border: 1px solid #64748b; background: #fff; text-align: center; line-height: 26px; font-weight: bold;">9</span>
                                <span style="display: inline-block; width: 22px; height: 26px; border: 1px solid #64748b; background: #fff; text-align: center; line-height: 26px; font-weight: bold;">2</span>
                                <span style="display: inline-block; width: 22px; height: 26px; border: 1px solid #64748b; background: #fff; text-align: center; line-height: 26px; font-weight: bold;">6</span>
                            </div>
                        </div>

                        <!-- Section 2: Biometric Update Checklist -->
                        <div style="border: 1px solid #cbd5e1; padding: 10px 14px; border-radius: 4px; margin-bottom: 12px; font-size: 0.85rem;">
                            <strong>2. In case of Update, tick fields to be updated:</strong><br />
                            <div style="display: flex; gap: 16px; margin-top: 6px; flex-wrap: wrap;">
                                <span>[ &check; ] Biometrics (Photo/Fingerprint/Iris)</span>
                                <span>[ &check; ] Mobile No</span>
                                <span>[ &nbsp; ] Date of Birth</span>
                                <span>[ &check; ] Address</span>
                                <span>[ &nbsp; ] Name</span>
                                <span>[ &nbsp; ] Gender</span>
                            </div>
                        </div>

                        <!-- Section 3: Personal Details -->
                        <div style="border: 1px solid #cbd5e1; padding: 12px 14px; border-radius: 4px; margin-bottom: 12px;">
                            <div style="font-size: 0.9rem; font-weight: 700; margin-bottom: 8px;">3. Resident Personal Information</div>
                            
                            <div style="display: grid; grid-template-columns: 3fr 1fr; gap: 12px; margin-bottom: 10px;">
                                <div>
                                    <label style="font-size: 0.8rem; color: #475569;">Full Name (As per Proof of Identity):</label>
                                    <div style="font-weight: 700; font-size: 0.95rem; border-bottom: 1px solid #0f172a; padding: 4px 0;">RAMESH KUMAR PANDEY</div>
                                </div>
                                <div style="border: 1px solid #cbd5e1; height: 110px; text-align: center; display: flex; flex-direction: column; align-items: center; justify-content: center; font-size: 0.72rem; color: #64748b; background: #f8fafc; border-radius: 4px;">
                                    <span>Affix Color Photograph</span>
                                    <span>(3.5 cm x 4.5 cm)</span>
                                    <span style="color: #dc2626; font-size: 0.68rem; margin-top: 4px;">Cross Signature</span>
                                </div>
                            </div>

                            <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 12px; margin-top: -30px;">
                                <div>
                                    <label style="font-size: 0.8rem; color: #475569;">Gender:</label>
                                    <div style="font-size: 0.85rem; font-weight: 600; padding: 4px 0;">[ &check; ] Male &nbsp; [ ] Female</div>
                                </div>
                                <div>
                                    <label style="font-size: 0.8rem; color: #475569;">Date of Birth:</label>
                                    <div style="font-size: 0.85rem; font-weight: 700; padding: 4px 0;">15 / 08 / 1992 [ &check; ] Verified</div>
                                </div>
                                <div>
                                    <label style="font-size: 0.8rem; color: #475569;">Mobile Number:</label>
                                    <div style="font-size: 0.85rem; font-weight: 700; padding: 4px 0;">+91 98765 43210</div>
                                </div>
                            </div>
                        </div>

                        <!-- Section 4: Address Details -->
                        <div style="border: 1px solid #cbd5e1; padding: 12px 14px; border-radius: 4px; margin-bottom: 12px; font-size: 0.85rem;">
                            <div style="font-size: 0.9rem; font-weight: 700; margin-bottom: 8px;">4. Residential Address Details</div>
                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
                                <div><strong>House No / Building:</strong> B-402, Shivalik Residency</div>
                                <div><strong>Street / Road / Lane:</strong> Ashram Road, Near Riverfront</div>
                                <div><strong>Landmark:</strong> Opposite RBI Headquarters</div>
                                <div><strong>Village / Town / City:</strong> Ahmedabad</div>
                                <div><strong>District:</strong> Ahmedabad</div>
                                <div><strong>State & PIN Code:</strong> Gujarat - 380009</div>
                            </div>
                        </div>

                        <!-- Section 5: Verification & Documents Attached -->
                        <div style="border: 1px solid #cbd5e1; padding: 10px 14px; border-radius: 4px; margin-bottom: 14px; font-size: 0.82rem; background: #f8fafc;">
                            <strong>5. Verification Details & Documents Attached:</strong>
                            <div style="margin-top: 4px; line-height: 1.6;">
                                &bull; <strong>POI (Proof of Identity):</strong> Permanent Account Number (PAN Card No: ABCDE1234F)<br />
                                &bull; <strong>POA (Proof of Address):</strong> Electricity Bill (Consumer No: 084729103, Month: May 2026)<br />
                                &bull; <strong>DOB (Proof of Date of Birth):</strong> Secondary School Leaving Certificate (10th Board)
                            </div>
                        </div>

                        <!-- Section 6: Declaration & Signature Box -->
                        <div style="border: 1px solid #0f172a; padding: 12px 14px; border-radius: 4px; display: grid; grid-template-columns: 2fr 1fr; gap: 16px; align-items: flex-end; background: #fff;">
                            <div style="font-size: 0.75rem; color: #475569; line-height: 1.4;">
                                <strong>Declaration:</strong> I hereby confirm that the information provided in this form is true, correct and complete to the best of my knowledge and belief. I consent to my identity information being used for authentication purposes under the Aadhaar Act, 2016.
                                <div style="margin-top: 14px; font-weight: 600; color: #0f172a;">
                                    Date: 03/10/2026 &nbsp;&nbsp;&bull;&nbsp;&nbsp; Place: Ahmedabad, Gujarat
                                </div>
                            </div>
                            <div style="border: 1px dashed #0f172a; height: 75px; text-align: center; display: flex; flex-direction: column; justify-content: flex-end; padding-bottom: 6px; font-size: 0.72rem; color: #0f172a; font-weight: 700;">
                                Signature / Thumb Impression of Resident
                            </div>
                        </div>

                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>
