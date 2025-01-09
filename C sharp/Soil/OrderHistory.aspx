<%@ Page Title="Order History" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="Soil.OrderHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .orderHistoryContainer {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .orderHistoryContainer h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .orderHistoryTable {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .orderHistoryTable th, .orderHistoryTable td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        .orderHistoryTable th {
            background-color: #4CAF50;
            color: white;
        }

        .orderHistoryTable tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .orderHistoryTable tr:hover {
            background-color: #ddd;
        }

        .orderHistoryTable td {
            color: #333;
        }
    </style>
     <br /> <br /> 
    <div class="orderHistoryContainer">
        <h1>Order History</h1>
        <asp:Repeater ID="RepeaterOrderHistory" runat="server">
            <HeaderTemplate>
                <table class="orderHistoryTable">
                    <tr>
                        <th>Order ID</th>
                        <th>Cart ID</th>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Total Amount</th>
                        <th>Payment Method</th>
                        <th>Order Date</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("OrderID") %></td>
                    <td><%# Eval("CartID") %></td>
                    <td><%# Eval("ProductName") %></td>
                    <td>Rs. <%# Eval("Price") %></td>
                    <td>Rs. <%# Eval("TotalAmount") %></td>
                    <td><%# Eval("PaymentMethod") %></td>
                    <td><%# Eval("OrderDate") %></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
    <br /> <br /> 
</asp:Content>
