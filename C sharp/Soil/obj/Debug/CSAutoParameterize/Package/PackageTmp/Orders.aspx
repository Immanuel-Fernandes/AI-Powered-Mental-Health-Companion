<%@ Page Title="View Orders" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="Soil.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }

        .order-table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
        }

        .order-table th, .order-table td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        .backToDashboardButton {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }

        .backToDashboardButton:hover {
            background-color: #218838;
        }
    </style>

    <div class="container">
        <h1>All Orders</h1>
        <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" 
                      CssClass="order-table" 
                      DataKeyNames="OrderID">
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                <asp:BoundField DataField="CartID" HeaderText="Cart ID" />
                <asp:BoundField DataField="UserID" HeaderText="User ID" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" DataFormatString="{0:C}" />
                <asp:BoundField DataField="PaymentMethod" HeaderText="Payment Method" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnBackToDashboard" runat="server" Text="Back to Dashboard" CssClass="backToDashboardButton" OnClick="BackToDashboard_Click" />
    </div>
</asp:Content>
