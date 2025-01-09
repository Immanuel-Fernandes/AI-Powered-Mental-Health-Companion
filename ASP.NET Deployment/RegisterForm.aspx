<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="RegisterForm.aspx.cs" Inherits="Soil.RegisterForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .register-container {
            width: 300px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .register-container h2 {
            text-align: center;
            color: #333;
        }

        .register-container label {
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        .register-container input[type="text"],
        .register-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .register-container input[type="submit"],
        .register-container button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .register-container button:hover {
            background-color: #45a049;
        }

        .register-container .register-link {
            display: block;
            text-align: center;
            margin-top: 15px;
        }

        .register-container .register-link a {
            color: #4CAF50;
            text-decoration: none;
        }

        .register-container .register-link a:hover {
            text-decoration: underline;
        }

        .error-message {
            color: red;
            text-align: center;
        }
    </style>
    <br /><br /><br />
    <div class="register-container">
        <h2>Register</h2>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label><br /><br />
        <asp:Label ID="lblFirstName" runat="server" Text="First Name:" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-input"></asp:TextBox>
        <asp:Label ID="lblPassword" runat="server" Text="Password:" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-input"></asp:TextBox>
        <asp:Label ID="lblEmail" runat="server" Text="Email:" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input"></asp:TextBox>
        <asp:Label ID="lblMobileNo" runat="server" Text="Mobile No:" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="txtMobileNo" runat="server" CssClass="form-input"></asp:TextBox>
        <asp:Label ID="lblAddress" runat="server" Text="Address:" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-input"></asp:TextBox>
        <asp:Label ID="lblPincode" runat="server" Text="Pincode:" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="txtPincode" runat="server" CssClass="form-input"></asp:TextBox>
        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="form-button" OnClick="btnRegister_Click" /><br /><br />
        <div class="register-link">
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="LoginForm.aspx">Already registered? Click here to login.</asp:HyperLink>
        </div>
    </div>
    <br /><br /><br />
</asp:Content>
