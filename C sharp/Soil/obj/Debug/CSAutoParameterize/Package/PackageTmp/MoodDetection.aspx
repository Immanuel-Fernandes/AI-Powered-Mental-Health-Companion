<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="MoodDetection.aspx.cs" Inherits="Soil.MoodDetection" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="StylePage.css" />
    <div class="black-card">
        <h1>Mood Detection</h1>
        <p>
            Our Mood Detection tool allows you to analyze text input and determine the mood conveyed within. Whether you're exploring sentiments for personal use, academic research, or professional insights, this tool provides a unique and interactive way to understand emotions expressed in text.
        </p>
        <p>
            To get started, you can either enter your text below or explore the embedded mood detection application for advanced analysis.
        </p>
        <iframe 
            src="https://mental-health-b9h2rhwkxuzpb9mhrdvrb4.streamlit.app?embed=true" 
            width="100%" 
            height="600px" 
            frameborder="0" 
            style="border-radius: 10px; overflow: hidden; border: 1px solid #ccc; margin-top: 20px;">
        </iframe>
    </div>
</asp:Content>