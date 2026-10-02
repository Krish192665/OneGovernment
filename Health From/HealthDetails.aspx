<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HealthDetails.aspx.cs" Inherits="OneGovernment.Health_From.HealthDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-actions">
        <a class="back-button" href="../Health.aspx" title="Back to home">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="18" height="18" aria-hidden="true">
                <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
        </a>
    </div>

    <!-- Basic Tab Styling -->
    <style>
        .tab-header {
            display: flex;
            gap: 6px;
            margin-top: 15px;
            border-bottom: 2px solid #dee2e6;
        }

        .tab-link {
            padding: 8px 18px;
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-bottom: none;
            border-radius: 4px 4px 0 0;
            cursor: pointer;
            font-size: 14px;
            color: #495057;
        }

            .tab-link:hover {
                background-color: #e9ecef;
            }

        .active-tab {
            background-color: #007bff !important;
            color: #ffffff !important;
            border-color: #007bff !important;
            font-weight: 600;
        }

        .tab-body {
            padding: 20px;
            border: 1px solid #dee2e6;
            border-top: none;
            background-color: #ffffff;
            min-height: 250px;
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
                <asp:View ID="viewOverview" runat="server">
                    <h3>Overview</h3>
                    <p>
                        A general medical examination is a routine physical checkup used by healthcare providers to evaluate overall health, establish a health baseline, and screen for potential medical conditions
                    </p>
                </asp:View>

                <asp:View ID="viewLinks" runat="server">
                    <h3>Official Link</h3>
                    <strong>Official Portal:</strong>
                    <a href="https://www.nta.ac.in/medicalexam" target="_blank" rel="noopener noreferrer">https://gprb.gujarat.gov.in/
                        </a>
                    <h3>Video Link</h3>
                    <p>
                        <strong>YouTube Video:</strong>
                        <a href="https://www.youtube.com/watch?v=vke4AM6hxec" target="_blank" rel="noopener noreferrer">Watch Preparation Video
                        </a>
                </asp:View>

                <asp:View ID="viewDocuments" runat="server">
                    <h3>Documents</h3>
                    <a>Prescribed Medical Form:</a><br>
                    <a>Photo ID Proof:</a><br>
                    <a>Academic/ID Proofs:</a><br>
                    <a>Passport-Size Photographs:</a><br>
                </asp:View>

                <asp:View ID="viewDemoForm" runat="server">
                    
                    <div style="text-align: center; background-color: #f8f9fa; padding: 15px; border-radius: 6px; border: 1px solid #dee2e6;">
                        <asp:Image ID="imgDemoForm" runat="server"
                            ImageUrl="~/Health.jpg"
                            AlternateText="Gujarat Health Demo Form"
                            Style="max-width: 100%; width: 680px; height: auto; border: 1px solid #ccc; box-shadow: 0 4px 12px rgba(0,0,0,0.15); border-radius: 4px;" />
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>
