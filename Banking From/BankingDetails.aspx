<%@ Page Title="Banking Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BankingDetails.aspx.cs" Inherits="OneGovernment.Banking_From.BankingDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="../Banking.aspx" title="Back to Banking Services">
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
            background: #dcfce7;
            color: #15803d;
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
                    <h3 class="details-heading">Pradhan Mantri Financial Inclusion & Banking Overview</h3>
                    <p class="details-paragraph">
                        The Government of India launched landmark financial initiatives, including the Pradhan Mantri Jan Dhan Yojana (PMJDY), Atal Pension Yojana (APY), and PM Mudra Yojana, ensuring every household has access to banking facilities, credit, insurance, and pension schemes.
                    </p>

                    <div class="info-grid">
                        <div class="info-card">
                            <strong>1. Zero Balance Facility</strong>
                            <p>No minimum balance requirement is needed to maintain a Basic Savings Bank Deposit Account (BSBDA).</p>
                        </div>
                        <div class="info-card">
                            <strong>2. RuPay Debit Card & Insurance</strong>
                            <p>Free RuPay debit card with inbuilt accident insurance cover of up to ₹2,00,000 for active cardholders.</p>
                        </div>
                        <div class="info-card">
                            <strong>3. Overdraft Facility</strong>
                            <p>Overdraft facility up to ₹10,000 available to eligible account holders after 6 months of satisfactory operations.</p>
                        </div>
                        <div class="info-card">
                            <strong>4. Direct Benefit Transfer (DBT)</strong>
                            <p>Direct credit of government subsidies like LPG Pahal, PM-KISAN, and scholarships straight to the bank account.</p>
                        </div>
                    </div>
                </asp:View>

                <!-- 2. LINKS -->
                <asp:View ID="viewLinks" runat="server">
                    <h3 class="details-heading">Official Banking Portals & Information Links</h3>
                    
                    <div class="link-row">
                        <div>
                            <div>PM Jan Dhan Yojana Official Portal</div>
                            <small style="color: #64748b;">National mission on financial inclusion and account opening guidelines</small>
                        </div>
                        <a href="https://pmjdy.gov.in/" target="_blank" rel="noopener noreferrer" class="link-btn">
                            Visit Portal &rarr;
                        </a>
                    </div>

                    <div class="link-row">
                        <div>
                            <div>Pradhan Mantri MUDRA Yojana Portal</div>
                            <small style="color: #64748b;">Micro-business loan applications (Shishu, Kishore, and Tarun schemes)</small>
                        </div>
                        <a href="https://www.mudra.org.in/" target="_blank" rel="noopener noreferrer" class="link-btn">
                            Mudra Portal &rarr;
                        </a>
                    </div>

                    <div class="link-row">
                        <div>
                            <div>Jan Suraksha Portal (APY / PMSBY / PMJJBY)</div>
                            <small style="color: #64748b;">National pension and insurance scheme forms and claim status</small>
                        </div>
                        <a href="https://www.jansuraksha.gov.in/" target="_blank" rel="noopener noreferrer" class="link-btn">
                            Jan Suraksha &rarr;
                        </a>
                    </div>
                </asp:View>

                <!-- 3. DOCUMENTS -->
                <asp:View ID="viewDocuments" runat="server">
                    <h3 class="details-heading">Checklist of Documents Required</h3>
                    <p class="details-paragraph">You can open a PMJDY account with zero balance by providing any Officially Valid Document (OVD):</p>

                    <ul class="doc-list">
                        <li class="doc-item">
                            <span class="doc-badge">Aadhaar</span>
                            <div class="doc-text">
                                <strong>Aadhaar Card (Simplified e-KYC)</strong>
                                <span>If your Aadhaar address has changed, a self-declaration of the current address is sufficient.</span>
                            </div>
                        </li>
                        <li class="doc-item">
                            <span class="doc-badge">PAN/Form 60</span>
                            <div class="doc-text">
                                <strong>PAN Card or Form 60</strong>
                                <span>PAN Card copy or simple Form 60 declaration if you do not currently possess a PAN card.</span>
                            </div>
                        </li>
                        <li class="doc-item">
                            <span class="doc-badge">Photos</span>
                            <div class="doc-text">
                                <strong>Passport-Size Photographs</strong>
                                <span>2 recent passport-size color photographs for account record and passbook issuance.</span>
                            </div>
                        </li>
                        <li class="doc-item">
                            <span class="doc-badge">Alternative OVD</span>
                            <div class="doc-text">
                                <strong>Other Officially Valid Document (if no Aadhaar)</strong>
                                <span>Voter ID Card, Driving License, NREGA Job Card, or Passport.</span>
                            </div>
                        </li>
                    </ul>
                </asp:View>

                <!-- 4. DEMO FORM (ORIGINAL PMJDY ACCOUNT OPENING FORM) -->
                <asp:View ID="viewDemoForm" runat="server">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px;">
                        <h3 class="details-heading" style="margin: 0;">Original PM Jan Dhan Yojana Account Opening Demo Form</h3>
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
                            <div style="font-size: 0.85rem; font-weight: 700; letter-spacing: 1px; color: #475569;">DEPARTMENT OF FINANCIAL SERVICES &bull; MINISTRY OF FINANCE &bull; GOVERNMENT OF INDIA</div>
                            <h2 style="font-size: 1.25rem; font-weight: 800; margin: 6px 0; color: #0f172a; text-transform: uppercase;">Pradhan Mantri Jan Dhan Yojana (PMJDY) Form</h2>
                            <div style="font-size: 0.8rem; color: #059669; font-weight: 700;">BASIC SAVINGS BANK DEPOSIT ACCOUNT (BSBDA) OPENING FORM &bull; ZERO BALANCE ACCOUNT</div>
                        </div>

                        <!-- Top Bank Details Row -->
                        <div style="display: grid; grid-template-columns: 2fr 1fr 1fr; gap: 10px; margin-bottom: 14px; font-size: 0.85rem;">
                            <div style="border: 1px solid #cbd5e1; padding: 8px 12px; border-radius: 4px;">
                                <strong>Bank & Branch:</strong> State Bank of India &bull; Main Branch, Ahmedabad
                            </div>
                            <div style="border: 1px solid #cbd5e1; padding: 8px 12px; border-radius: 4px;">
                                <strong>Branch Code:</strong> 000412
                            </div>
                            <div style="border: 1px solid #cbd5e1; padding: 8px 12px; border-radius: 4px;">
                                <strong>Date:</strong> 03/10/2026
                            </div>
                        </div>

                        <!-- Section 1: Applicant Details -->
                        <div style="border: 1px solid #cbd5e1; padding: 12px 14px; border-radius: 4px; margin-bottom: 12px;">
                            <div style="font-size: 0.9rem; font-weight: 700; margin-bottom: 8px;">1. Applicant Personal Information</div>
                            
                            <div style="display: grid; grid-template-columns: 3fr 1fr; gap: 12px; margin-bottom: 10px;">
                                <div>
                                    <label style="font-size: 0.8rem; color: #475569;">Full Name of Applicant (Block Letters):</label>
                                    <div style="font-weight: 700; font-size: 0.95rem; border-bottom: 1px solid #0f172a; padding: 4px 0;">RAMESH KUMAR PANDEY</div>
                                    
                                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px; margin-top: 10px;">
                                        <div>
                                            <label style="font-size: 0.8rem; color: #475569;">Father / Spouse Name:</label>
                                            <div style="font-weight: 600; font-size: 0.88rem;">Suresh Chandra Pandey</div>
                                        </div>
                                        <div>
                                            <label style="font-size: 0.8rem; color: #475569;">Occupation / Trade:</label>
                                            <div style="font-weight: 600; font-size: 0.88rem;">Self Employed / Services</div>
                                        </div>
                                    </div>
                                </div>
                                <div style="border: 1px solid #cbd5e1; height: 110px; text-align: center; display: flex; flex-direction: column; align-items: center; justify-content: center; font-size: 0.72rem; color: #64748b; background: #f8fafc; border-radius: 4px;">
                                    <span>Affix Passport Photo</span>
                                    <span>(3.5 cm x 4.5 cm)</span>
                                </div>
                            </div>

                            <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 12px; border-top: 1px dashed #e2e8f0; padding-top: 8px;">
                                <div>
                                    <label style="font-size: 0.8rem; color: #475569;">Date of Birth:</label>
                                    <div style="font-size: 0.85rem; font-weight: 700;">15 / 08 / 1992</div>
                                </div>
                                <div>
                                    <label style="font-size: 0.8rem; color: #475569;">Annual Income:</label>
                                    <div style="font-size: 0.85rem; font-weight: 700;">₹ 1,80,000 / Year</div>
                                </div>
                                <div>
                                    <label style="font-size: 0.8rem; color: #475569;">Mobile Number:</label>
                                    <div style="font-size: 0.85rem; font-weight: 700;">+91 98765 43210</div>
                                </div>
                            </div>
                        </div>

                        <!-- Section 2: KYC & Identification -->
                        <div style="border: 1px solid #cbd5e1; padding: 10px 14px; border-radius: 4px; margin-bottom: 12px; font-size: 0.85rem; background: #f8fafc;">
                            <strong>2. Officially Valid KYC Documents Submitted:</strong>
                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px; margin-top: 6px;">
                                <div>&bull; <strong>Aadhaar Card No:</strong> XXXX-XXXX-1926</div>
                                <div>&bull; <strong>PAN Card / Form 60:</strong> ABCDE1234F</div>
                            </div>
                        </div>

                        <!-- Section 3: RuPay Card & DBT Seeding Consent -->
                        <div style="border: 1px solid #cbd5e1; padding: 10px 14px; border-radius: 4px; margin-bottom: 12px; font-size: 0.85rem;">
                            <strong>3. Banking Services Required:</strong>
                            <div style="display: flex; gap: 16px; margin-top: 6px; flex-wrap: wrap;">
                                <span>[ &check; ] Free RuPay Debit Card</span>
                                <span>[ &check; ] SMS Alerts</span>
                                <span>[ &check; ] Aadhaar DBT Subsidy Credit</span>
                                <span>[ &check; ] Cheque Book (Optional)</span>
                            </div>
                        </div>

                        <!-- Section 4: Nomination Details -->
                        <div style="border: 1px solid #cbd5e1; padding: 10px 14px; border-radius: 4px; margin-bottom: 14px; font-size: 0.85rem;">
                            <strong>4. Nomination Details (Form DA-1 under Banking Regulation Act):</strong>
                            <div style="display: grid; grid-template-columns: 2fr 1fr 1fr; gap: 10px; margin-top: 6px;">
                                <div><strong>Nominee Name:</strong> Sunita Ramesh Pandey</div>
                                <div><strong>Relationship:</strong> Spouse</div>
                                <div><strong>Age:</strong> 31 Years</div>
                            </div>
                        </div>

                        <!-- Section 5: Declaration & Signature -->
                        <div style="border: 1px solid #0f172a; padding: 12px 14px; border-radius: 4px; display: grid; grid-template-columns: 2fr 1fr; gap: 16px; align-items: flex-end; background: #fff;">
                            <div style="font-size: 0.75rem; color: #475569; line-height: 1.4;">
                                <strong>Declaration:</strong> I hereby apply for opening a PMJDY Basic Savings Bank Deposit Account and confirm that I do not maintain any other Basic Savings Bank Deposit account in any other bank. I agree to comply with the rules and terms governing PMJDY accounts.
                                <div style="margin-top: 14px; font-weight: 600; color: #0f172a;">
                                    Date: 03/10/2026 &nbsp;&nbsp;&bull;&nbsp;&nbsp; Place: Ahmedabad, Gujarat
                                </div>
                            </div>
                            <div style="border: 1px dashed #0f172a; height: 75px; text-align: center; display: flex; flex-direction: column; justify-content: flex-end; padding-bottom: 6px; font-size: 0.72rem; color: #0f172a; font-weight: 700;">
                                Signature / Thumb Impression of Applicant
                            </div>
                        </div>

                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>
