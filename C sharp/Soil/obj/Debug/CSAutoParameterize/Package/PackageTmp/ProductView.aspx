<%@ Page Title="Product View" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="ProductView.aspx.cs" Inherits="Soil.ProductView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .productViewContainer {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .productViewContainer h1 {
            color: #333;
            margin-bottom: 20px;
        }

        .productDetails img {
            width: 25%;  /* Ensures the image takes full width */
            max-width: 100%;  /* Prevents the image from exceeding its container's width */
            height: auto;  /* Maintains the aspect ratio */
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .productDetails h3 {
            color: #4CAF50;
            margin-bottom: 10px;
        }

        .productDetails p {
            color: #555;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .dashboardButton {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }

        .dashboardButton:hover {
            background-color: #45a049;
        }
    </style>
     <br /><br /><br />
    <div class="productViewContainer">
        <h1>Product Details</h1>
        <div id="productDetails" runat="server">
            <!-- Add image and product details dynamically here -->
            <img src="path_to_product_image.jpg" alt="Product Image" />
        </div>
        <asp:Button ID="btnGoToDashboard" runat="server" Text="Go to Dashboard" CssClass="dashboardButton" OnClick="btnGoToDashboard_Click" />
    </div>

     <br /><br /><br />
</asp:Content>
