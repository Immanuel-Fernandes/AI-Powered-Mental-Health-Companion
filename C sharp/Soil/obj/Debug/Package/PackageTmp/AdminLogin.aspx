<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Soil.AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .login-container {
            width: 300px;
            margin: 100px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: center;
        }

        .login-container h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .form-input {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
        }

        .form-button {
            width: 90%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }

        .form-button:hover {
            background-color: #218838;
        }
    </style>

    <div class="login-container">
        <h1>Admin Login</h1>
        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-input" Placeholder="Username"></asp:TextBox>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" TextMode="Password" Placeholder="Password"></asp:TextBox>
        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="form-button" OnClick="btnLogin_Click" />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
