<%@ Page Title="Service Category" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="OneGovernment.Category" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="portal-content" aria-labelledby="categoryTitle">
        <a class="back-button" href="Home.aspx" title="Back to home">&larr; Back to Home</a>
        <h1 id="categoryTitle"><asp:Label ID="CategoryTitleLabel" runat="server" /></h1>
        <p class="lead">Government services for this category will be available here.</p>
        <p><a class="btn btn-primary" href="Home.aspx">Browse all services</a></p>
    </main>
</asp:Content>
