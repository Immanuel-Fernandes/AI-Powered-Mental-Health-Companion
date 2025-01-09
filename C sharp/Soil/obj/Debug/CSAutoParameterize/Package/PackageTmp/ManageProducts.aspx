<%@ Page Title="Manage Products" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="ManageProducts.aspx.cs" Inherits="Soil.ManageProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }

        .tabs {
            margin-bottom: 20px;
        }

        .tabs button {
            padding: 10px 20px;
            margin-right: 5px;
            cursor: pointer;
            background-color: #f1f1f1;
            border: 1px solid #ccc;
            outline: none;
        }

        .tabs button.active {
            background-color: #28a745;
            color: white;
            border: 1px solid #28a745;
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }

        .form-section {
            margin: 20px 0;
        }

        .form-label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-input, .form-button, .form-dropdown {
            width: 50%;
            padding: 10px;
            margin: 10px 0;
        }

        .form-button {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }

        .form-button:hover {
            background-color: #218838;
        }

        .product-table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
        }

        .product-table th, .product-table td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        .delete-button {
            background-color: #dc3545;
            color: white;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
        }

        .delete-button:hover {
            background-color: #c82333;
        }
    </style>

    <script>
        function openTab(evt, tabName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tab-content");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(tabName).style.display = "block";
            evt.currentTarget.className += " active";
        }

        document.addEventListener("DOMContentLoaded", function () {
            document.getElementById("defaultOpen").click();
        });
    </script>

    <div class="container">
        <h1>Manage Products</h1>

        <div class="tabs">
            <button type="button" class="tablinks" onclick="openTab(event, 'AddProduct')" id="defaultOpen">Add Product</button>
            <button type="button" class="tablinks" onclick="openTab(event, 'RemoveProduct')">Remove Product</button>
        </div>

        <div id="AddProduct" class="tab-content">
            <div class="form-section">
                <h2>Add New Product</h2>
                <label class="form-label" for="txtProductName">Product Name:</label>
                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-input" />

                <label class="form-label" for="txtPrice">Price:</label>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-input" />

                <label class="form-label" for="txtAmount">Amount:</label>
                <asp:TextBox ID="txtAmount" runat="server" CssClass="form-input" />

                <label class="form-label" for="ddlCategory">Category:</label>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-dropdown"></asp:DropDownList>
                <label class="form-label" for="txtNewCategory">New Category:</label>
                <asp:TextBox ID="txtNewCategory" runat="server" CssClass="form-input" />
                <asp:Button ID="btnAddCategory" runat="server" Text="Add New Category" CssClass="form-button" OnClick="btnAddCategory_Click" />

                <label class="form-label" for="txtDescription">Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-input" TextMode="MultiLine" Rows="4" />

                <label class="form-label" for="fileUploadImage">Upload Image:</label>
                <asp:FileUpload ID="fileUploadImage" runat="server" CssClass="form-input" />

                <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" CssClass="form-button" OnClick="btnAddProduct_Click" />
            </div>
        </div>

        <div id="RemoveProduct" class="tab-content">
            <div class="form-section">
                <h2>Remove Products</h2>
                <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" 
                              CssClass="product-table" 
                              DataKeyNames="ProductId"
                              OnRowDeleting="gvProducts_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="ProductId" HeaderText="ID" />
                        <asp:BoundField DataField="ProductName" HeaderText="Name" />
                        <asp:BoundField DataField="Category" HeaderText="Category" />
                        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="Amount" HeaderText="Amount" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="delete-button" 
                                            CommandName="Delete" CommandArgument='<%# Eval("ProductId") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
