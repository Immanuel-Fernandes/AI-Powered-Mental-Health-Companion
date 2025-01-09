<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Soil.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .dashboard-container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }

        .dashboard-section {
            margin: 20px 0;
        }

        .dashboard-section h2 {
            margin-bottom: 20px;
        }

        .dashboard-button {
            padding: 15px 25px;
            margin: 10px;
            font-size: 18px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }

        .dashboard-button:hover {
            background-color: #0056b3;
        }
    </style>

    <div class="dashboard-container">
        <h1>Admin Dashboard</h1>

        <div class="dashboard-section">
            <h2>Manage Products</h2>
            <asp:Button ID="btnManageProducts" runat="server" Text="Manage Products" CssClass="dashboard-button" OnClick="btnManageProducts_Click" />
        </div>

        <div class="dashboard-section">
            <h2>View Orders</h2>
            <asp:Button ID="btnViewOrders" runat="server" Text="View Orders" CssClass="dashboard-button" OnClick="btnViewOrders_Click" />
        </div>

    </div>
</asp:Content>
