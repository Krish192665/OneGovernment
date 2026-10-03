<%@ Page Title="Ration Card Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RationCardDetails.aspx.cs" Inherits="OneGovernment.RationCard_From.RationCardDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="../RationCard.aspx" title="Back to Ration Card Services">
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
            background: #fef3c7;
            color: #b45309;
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
                    <h3 class="details-heading">National Food Security Act (NFSA) & Ration Card Overview</h3>
                    <p class="details-paragraph">
                        Under the National Food Security Act (NFSA), 2013, the Ministry of Consumer Affairs, Food & Public Distribution provides subsidized food grains to eligible households through Fair Price Shops (FPS) / Ration depots across all states and Union Territories.
                    </p>

                    <div class="info-grid">
                        <div class="info-card">
                            <strong>1. Antyodaya Anna Yojana (AAY)</strong>
                            <p>Poorest of the poor families receive 35 kg of food grains per month at highly subsidized rates (Rice ₹3/kg, Wheat ₹2/kg).</p>
                        </div>
                        <div class="info-card">
                            <strong>2. Priority Household (PHH)</strong>
                            <p>Eligible households receive 5 kg of food grains per person per month under priority beneficiary categories.</p>
                        </div>
                        <div class="info-card">
                            <strong>3. One Nation One Ration Card</strong>
                            <p>Migrant workers and citizens can lift their entitled food grain quota from any Fair Price Shop across India using biometric authentication.</p>
                        </div>
                        <div class="info-card">
                            <strong>4. Aadhaar-Seeded e-POS</strong>
                            <p>Electronic Point of Sale (e-POS) devices verify beneficiary biometrics in real time to eliminate fake and duplicate ration entries.</p>
                        </div>
                    </div>
                </asp:View>

                <!-- 2. LINKS -->
                <asp:View ID="viewLinks" runat="server">
                    <h3 class="details-heading">Official Food & Civil Supplies Portals</h3>
                    
                    <div class="link-row">
                        <div>
                            <div>National Food Security Portal (NFSA)</div>
                            <small style="color: #64748b;">Centralized portal for citizen ration cards, state portals, and allocations</small>
                        </div>
                        <a href="https://nfsa.gov.in/" target="_blank" rel="noopener noreferrer" class="link-btn">
                            NFSA Portal &rarr;
                        </a>
                    </div>

                    <div class="link-row">
                        <div>
                            <div>Annavitran National Portal</div>
                            <small style="color: #64748b;">Track monthly food grain lifting, Fair Price Shop transactions, and ONORC</small>
                        </div>
                        <a href="https://annavitran.nic.in/" target="_blank" rel="noopener noreferrer" class="link-btn">
                            Annavitran &rarr;
                        </a>
                    </div>

                    <div class="link-row">
                        <div>
                            <div>State Food & Civil Supplies Digital Portal</div>
                            <small style="color: #64748b;">State-wise online application for new digital ration card and adding family members</small>
                        </div>
                        <a href="https://ipds.gujarat.gov.in/" target="_blank" rel="noopener noreferrer" class="link-btn">
                            State Portal &rarr;
                        </a>
                    </div>
                </asp:View>

                <!-- 3. DOCUMENTS -->
                <asp:View ID="viewDocuments" runat="server">
                    <h3 class="details-heading">Checklist of Documents Required</h3>
                    <p class="details-paragraph">The following original documents are needed when applying for a new ration card or updating existing members:</p>

                    <ul class="doc-list">
                        <li class="doc-item">
                            <span class="doc-badge">Aadhaar</span>
                            <div class="doc-text">
                                <strong>Aadhaar Cards of All Family Members</strong>
                                <span>Copy of Aadhaar card for every family member to be included in the household ration card.</span>
                            </div>
                        </li>
                        <li class="doc-item">
                            <span class="doc-badge">Photo</span>
                            <div class="doc-text">
                                <strong>Photograph of Head of Household (Female Head)</strong>
                                <span>NFSA mandates cards be issued in the name of the eldest adult woman of the household (age 18+).</span>
                            </div>
                        </li>
                        <li class="doc-item">
                            <span class="doc-badge">Address Proof</span>
                            <div class="doc-text">
                                <strong>Proof of Residence</strong>
                                <span>Electricity bill, registered rent agreement, water bill, or LPG consumer gas connection passbook.</span>
                            </div>
                        </li>
                        <li class="doc-item">
                            <span class="doc-badge">Income</span>
                            <div class="doc-text">
                                <strong>Income Certificate / BPL Certificate</strong>
                                <span>Annual household income certificate issued by the Talati / Tehsildar or revenue authority.</span>
                            </div>
                        </li>
                    </ul>
                </asp:View>

                <!-- 4. DEMO FORM (ORIGINAL NFSA RATION CARD APPLICATION FORM) -->
                <asp:View ID="viewDemoForm" runat="server">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px;">
                        <h3 class="details-heading" style="margin: 0;">Original NFSA Ration Card Application Demo Form</h3>
                        <button type="button" onclick="window.print()" class="link-btn" style="cursor: pointer; border: none;">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <polyline points="6 9 6 2 18 2 18 9"></polyline>
                                <path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path>
                                <rect x="6" y="14" width="12" height="8"></rect>
                            </svg>
                            Print Demo Form
                        </button>
                    </div>

                    <!-- Official Ration Card Form Sheet -->
                    <div style="background: #ffffff; border: 2px solid #0f172a; border-radius: 8px; padding: 24px; max-width: 780px; margin: 0 auto; box-shadow: 0 4px 16px rgba(0,0,0,0.08); font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; color: #0f172a;">
                        
                        <!-- Header Banner -->
                        <div style="text-align: center; border-bottom: 2px solid #0f172a; padding-bottom: 12px; margin-bottom: 16px;">
                            <div style="font-size: 0.85rem; font-weight: 700; letter-spacing: 1px; color: #475569;">FOOD, CIVIL SUPPLIES & CONSUMER AFFAIRS DEPARTMENT &bull; GOVERNMENT OF INDIA</div>
                            <h2 style="font-size: 1.25rem; font-weight: 800; margin: 6px 0; color: #0f172a; text-transform: uppercase;">Application Form for Digital Ration Card (NFSA)</h2>
                            <div style="font-size: 0.8rem; color: #dc2626; font-weight: 600;">(FORM NFSA-01 &bull; Fill in CAPITAL LETTERS &bull; Use Black or Blue Ball Pen &bull; Free Form)</div>
                        </div>

                        <!-- Top Scheme Flags Row -->
                        <div style="display: flex; justify-content: space-between; gap: 10px; margin-bottom: 14px; font-size: 0.85rem;">
                            <div style="border: 1px solid #cbd5e1; padding: 8px 12px; border-radius: 4px; flex: 1.2;">
                                <strong>Targeted Scheme:</strong> [ &check; ] Priority Household (PHH) &nbsp;&nbsp; [ &nbsp; ] Antyodaya (AAY)
                            </div>
                            <div style="border: 1px solid #cbd5e1; padding: 8px 12px; border-radius: 4px; flex: 1;">
                                <strong>Ward / Circle:</strong> Maninagar Zone (04) &bull; FPS-402
                            </div>
                        </div>

                        <!-- Section 1: Head of Household Details -->
                        <div style="border: 1px solid #cbd5e1; padding: 12px 14px; border-radius: 4px; margin-bottom: 12px;">
                            <div style="font-size: 0.9rem; font-weight: 700; margin-bottom: 8px; color: #0f172a;">
                                1. Details of Head of Household (Eldest Adult Female Member as per NFSA Sec 13)
                            </div>
                            
                            <div style="display: grid; grid-template-columns: 3fr 1fr; gap: 12px; margin-bottom: 10px;">
                                <div>
                                    <label style="font-size: 0.8rem; color: #475569;">Full Name of Female Head:</label>
                                    <div style="font-weight: 700; font-size: 0.95rem; border-bottom: 1px solid #0f172a; padding: 4px 0;">SUNITA RAMESH PANDEY</div>
                                    
                                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px; margin-top: 10px;">
                                        <div>
                                            <label style="font-size: 0.8rem; color: #475569;">Father's / Husband's Name:</label>
                                            <div style="font-weight: 600; font-size: 0.88rem;">Ramesh Kumar Pandey</div>
                                        </div>
                                        <div>
                                            <label style="font-size: 0.8rem; color: #475569;">Mother's Name:</label>
                                            <div style="font-weight: 600; font-size: 0.88rem;">Kaushalya Devi</div>
                                        </div>
                                    </div>
                                </div>
                                <div style="border: 1px solid #cbd5e1; height: 115px; text-align: center; display: flex; flex-direction: column; align-items: center; justify-content: center; font-size: 0.72rem; color: #64748b; background: #f8fafc; border-radius: 4px;">
                                    <span>Affix Photo of</span>
                                    <strong>Female Head</strong>
                                    <span>(3.5 cm x 4.5 cm)</span>
                                </div>
                            </div>

                            <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 10px; margin-top: -15px;">
                                <div>
                                    <label style="font-size: 0.8rem; color: #475569;">Date of Birth & Age:</label>
                                    <div style="font-size: 0.85rem; font-weight: 600;">12 / 04 / 1995 (31 Yrs)</div>
                                </div>
                                <div>
                                    <label style="font-size: 0.8rem; color: #475569;">Aadhaar Number:</label>
                                    <div style="font-size: 0.85rem; font-weight: 700;">XXXX-XXXX-7714</div>
                                </div>
                                <div>
                                    <label style="font-size: 0.8rem; color: #475569;">Registered Mobile No.:</label>
                                    <div style="font-size: 0.85rem; font-weight: 700;">+91 98765 43210</div>
                                </div>
                            </div>
                        </div>

                        <!-- Section 2: Residential Address & Gas Connection -->
                        <div style="border: 1px solid #cbd5e1; padding: 12px 14px; border-radius: 4px; margin-bottom: 12px; font-size: 0.85rem;">
                            <div style="font-size: 0.9rem; font-weight: 700; margin-bottom: 8px;">2. Residence & Domestic LPG Connection Details</div>
                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px; margin-bottom: 8px;">
                                <div><strong>Address:</strong> B-402, Shivalik Residency, Ashram Road</div>
                                <div><strong>City, District, PIN:</strong> Ahmedabad, Gujarat - 380009</div>
                            </div>
                            <div style="background: #f8fafc; padding: 8px; border-radius: 4px; border: 1px solid #e2e8f0;">
                                <strong>LPG Connection Status:</strong> [ &check; ] Single Cylinder &nbsp;&bull;&nbsp; Oil Co: <strong>IOCL (Indane)</strong> &nbsp;&bull;&nbsp; Consumer No: <strong>8492019</strong>
                            </div>
                        </div>

                        <!-- Section 3: Family Members Table -->
                        <div style="border: 1px solid #0f172a; border-radius: 4px; overflow: hidden; margin-bottom: 12px;">
                            <div style="background: #0f172a; color: #fff; padding: 8px 12px; font-size: 0.85rem; font-weight: 700;">
                                3. Details of Family Members residing together (for monthly grain quota):
                            </div>
                            <table style="width: 100%; border-collapse: collapse; font-size: 0.82rem; text-align: left;">
                                <thead>
                                    <tr style="background: #f1f5f9; color: #0f172a;">
                                        <th style="padding: 7px; border: 1px solid #cbd5e1; width: 30px; text-align: center;">S.N.</th>
                                        <th style="padding: 7px; border: 1px solid #cbd5e1;">Member Full Name</th>
                                        <th style="padding: 7px; border: 1px solid #cbd5e1; width: 90px;">Relation</th>
                                        <th style="padding: 7px; border: 1px solid #cbd5e1; width: 45px; text-align: center;">Gen</th>
                                        <th style="padding: 7px; border: 1px solid #cbd5e1; width: 45px; text-align: center;">Age</th>
                                        <th style="padding: 7px; border: 1px solid #cbd5e1;">Aadhaar Number</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr style="background: #ffffff;">
                                        <td style="padding: 7px; border: 1px solid #cbd5e1; text-align: center; font-weight: 700;">1</td>
                                        <td style="padding: 7px; border: 1px solid #cbd5e1; font-weight: 600;">SUNITA RAMESH PANDEY</td>
                                        <td style="padding: 7px; border: 1px solid #cbd5e1;">Self (Head)</td>
                                        <td style="padding: 7px; border: 1px solid #cbd5e1; text-align: center;">F</td>
                                        <td style="padding: 7px; border: 1px solid #cbd5e1; text-align: center;">31</td>
                                        <td style="padding: 7px; border: 1px solid #cbd5e1; font-family: monospace;">XXXX-XXXX-7714</td>
                                    </tr>
                                    <tr style="background: #f8fafc;">
                                        <td style="padding: 7px; border: 1px solid #cbd5e1; text-align: center; font-weight: 700;">2</td>
                                        <td style="padding: 7px; border: 1px solid #cbd5e1; font-weight: 600;">RAMESH KUMAR PANDEY</td>
                                        <td style="padding: 7px; border: 1px solid #cbd5e1;">Husband</td>
                                        <td style="padding: 7px; border: 1px solid #cbd5e1; text-align: center;">M</td>
                                        <td style="padding: 7px; border: 1px solid #cbd5e1; text-align: center;">34</td>
                                        <td style="padding: 7px; border: 1px solid #cbd5e1; font-family: monospace;">XXXX-XXXX-1926</td>
                                    </tr>
                                    <tr style="background: #ffffff;">
                                        <td style="padding: 7px; border: 1px solid #cbd5e1; text-align: center; font-weight: 700;">3</td>
                                        <td style="padding: 7px; border: 1px solid #cbd5e1; font-weight: 600;">AARAV RAMESH PANDEY</td>
                                        <td style="padding: 7px; border: 1px solid #cbd5e1;">Son</td>
                                        <td style="padding: 7px; border: 1px solid #cbd5e1; text-align: center;">M</td>
                                        <td style="padding: 7px; border: 1px solid #cbd5e1; text-align: center;">6</td>
                                        <td style="padding: 7px; border: 1px solid #cbd5e1; font-family: monospace;">XXXX-XXXX-8821</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- Section 4: Document Enclosures -->
                        <div style="border: 1px solid #cbd5e1; padding: 10px 12px; border-radius: 4px; margin-bottom: 12px; font-size: 0.82rem; background: #f8fafc;">
                            <strong>4. Documents Enclosed (Self-Attested Copies):</strong>
                            <div style="display: flex; gap: 16px; margin-top: 4px; flex-wrap: wrap;">
                                <span>[ &check; ] Aadhaar Cards of All Members</span>
                                <span>[ &check; ] Electricity Bill</span>
                                <span>[ &check; ] Income Certificate</span>
                                <span>[ &check; ] LPG Gas Passbook Copy</span>
                            </div>
                        </div>

                        <!-- Section 5: Declaration & Signatures -->
                        <div style="border: 1px solid #0f172a; padding: 12px; border-radius: 4px; display: grid; grid-template-columns: 2fr 1fr; gap: 14px; align-items: flex-end; background: #fff;">
                            <div style="font-size: 0.74rem; color: #475569; line-height: 1.4;">
                                <strong>Declaration:</strong> I hereby declare that no member included in this application possesses another valid ration card anywhere in India. The statements given above are true and correct to the best of my knowledge.
                                <div style="margin-top: 10px; font-weight: 600; color: #0f172a;">
                                    Date: 03/10/2026 &nbsp;&bull;&nbsp; Place: Ahmedabad, Gujarat
                                </div>
                            </div>
                            <div style="border: 1px dashed #0f172a; height: 75px; text-align: center; display: flex; flex-direction: column; justify-content: flex-end; padding-bottom: 6px; font-size: 0.72rem; color: #0f172a; font-weight: 700;">
                                Signature / Thumb Impression of Head of Family
                            </div>
                        </div>

                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>
