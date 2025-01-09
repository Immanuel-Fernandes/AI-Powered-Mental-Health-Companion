<%@ Page Title="Thank You" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="Soil.ThankYou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .thankYouContainer {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }

        .thankYouMessage {
            font-size: 24px;
            font-weight: bold;
            color: green;
        }

        .paymentDetails {
            margin-top: 20px;
            font-size: 18px;
        }

        .backToShopButton {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
        }

        .container {
            text-align: center;
            margin-top: 100px;
        }

        .container h1 {
            font-size: 36px;
            color: #28a745;
        }
    </style>

    <div class="thankYouContainer">
        <div class="container">
            <h1>Thank You for Shopping!</h1>
            <p>Your order has been successfully placed.</p>
        </div>
        <br />
        <asp:Button ID="btnBackToShop" runat="server" Text="Back to Shop" CssClass="backToShopButton" OnClick="BackToShop_Click" />
    </div>
</asp:Content>
