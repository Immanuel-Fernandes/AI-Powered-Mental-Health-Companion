<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="GamifiedMoodTracking.aspx.cs" Inherits="Soil.GamifiedMoodTracking" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="StylePage.css" />
    <div class="black-card">
        <h1>Gamified Tracking</h1>
        <iframe 
            src="https://deoatharva.github.io/sudoku/" 
            width="100%" 
            height="600px" 
            frameborder="0" 
            style="border-radius: 10px; overflow: hidden; border: 1px solid #ccc; margin-top: 20px;">
        </iframe>
    </div>
</asp:Content>
