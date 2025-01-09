<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Soil.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Custom CSS for the contact form */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f8f5;
        }

        .contact-container {
            display: flex;
            flex-wrap: wrap;
            margin: 20px auto;
            max-width: 1200px;
            background-color: #e6f2e6;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            gap: 20px; /* Add space between form and map */
        }

        .map-section {
            flex: 1;
            background-color: #c8e6c9;
            border-left: 2px solid #d4d4d4;
            border-radius: 0 10px 10px 0;
            padding: 10px; /* Add padding inside map section */
        }

        .map-section iframe {
            width: 100%;
            height: 100%;
            border: none;
            border-radius: 5px;
        }

        .form-section {
            flex: 1;
            padding: 20px;
            background-color: #e6f2e6;
        }

        .form-section h2 {
            margin-bottom: 20px;
            color: #004d00;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #004d00;
        }

        .form-group input, .form-group textarea, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #008000;
            border-radius: 5px;
            background-color: #ffffff;
            font-size: 1rem;
            color: #333;
        }

        .form-group textarea {
            resize: none;
        }

        .form-group input:focus, .form-group textarea:focus, .form-group select:focus {
            outline: none;
            border-color: #4caf50;
            box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
        }

        .btn-submit {
            background-color: #008000;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            transition: 0.3s;
        }

        .btn-submit:hover {
            background-color: #005900;
        }
    </style>

    <div class="contact-container">
        <!-- Contact Form -->
        <div class="form-section">
            <h2>Contact Us</h2>
            <div class="form-group">
                <label for="txtName">Full Name</label>
                <asp:TextBox ID="txtName" runat="server" Placeholder="Your Full Name"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtEmail">Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" Placeholder="Your Email"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPhone">Phone Number</label>
                <asp:TextBox ID="txtPhone" runat="server" Placeholder="Your Phone Number"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="ddlCategory">Category</label>
                <asp:DropDownList ID="ddlCategory" runat="server">
                    <asp:ListItem Value="General Inquiry" Text="General Inquiry"></asp:ListItem>
                    <asp:ListItem Value="Admissions" Text="Admissions"></asp:ListItem>
                    <asp:ListItem Value="Technical Support" Text="Technical Support"></asp:ListItem>
                    <asp:ListItem Value="Others" Text="Others"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="txtMessage">Message</label>
                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4" Placeholder="Your Message"></asp:TextBox>
            </div>
            <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="btn-submit" OnClick="SubmitForm" />
        </div>

        <!-- Map -->
        <div class="map-section">
            <iframe 
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3770.8813367888973!2d72.8606661146886!3d19.030156458453024!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7ced4c44dcaed%3A0x4cd0a68c68542b83!2sS.I.W.S.%20College!5e0!3m2!1sen!2sin!4v1689482612293!5m2!1sen!2sin" 
                width="100%" 
                height="100%" 
                frameborder="0" 
                style="border:0" 
                allowfullscreen>
            </iframe>
        </div>
    </div>
</asp:Content>
