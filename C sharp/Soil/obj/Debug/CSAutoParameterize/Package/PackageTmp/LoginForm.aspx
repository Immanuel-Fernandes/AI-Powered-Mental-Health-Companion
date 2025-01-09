<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="Soil.LoginForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="App_Themes/LoginStyleSheet.css" rel="stylesheet" />
    <br /><br /><br />
    <div class="login-container">
        <h2>Login</h2>

        <!-- Display message from server -->
        <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label><br /><br />

        <!-- Username field -->
        <asp:Label ID="lblUsername" runat="server" Text="Username:"></asp:Label><br />
        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox><br />

        <!-- Password field -->
        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label><br />
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox><br />

        <!-- Login button -->
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" /><br />

        <!-- Register link -->
        <div class="register-link">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="RegisterForm.aspx">Not registered? Click here to register.</asp:HyperLink>
        </div>
    </div>
    <br /><br /><br />
</asp:Content>
