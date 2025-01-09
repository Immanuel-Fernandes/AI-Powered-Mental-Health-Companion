<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="WellnessRecommendations.aspx.cs" Inherits="Soil.WellnessRecommendations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="StylePage.css" />
    <div class="black-card">
        <h1>Your Personalized Wellness Chatbot</h1>
        <p>
            Welcome to your AI-powered wellness companion! Our Personalized Wellness Chatbot is here to provide you with tailored advice and emotional support based on your needs and preferences.
        </p>
        <p>
            Whether you're seeking tips on mental well-being, relaxation techniques, or motivation, our chatbot offers a friendly and interactive way to help you on your journey towards holistic health.
        </p>
        <p>
            Start by interacting with the chatbot below to receive personalized wellness recommendations. Take a moment for yourself, and let's create a path to a healthier, balanced you!
        </p>
        <iframe 
            src="https://multi-personality-assistant-bmustvj88rsaouqqu6wee7.streamlit.app/?embed=true" 
            width="100%" 
            height="600px" 
            frameborder="0" 
            style="border-radius: 10px; overflow: hidden; border: 1px solid #ccc; margin-top: 20px;">
        </iframe>
    </div>
</asp:Content>
