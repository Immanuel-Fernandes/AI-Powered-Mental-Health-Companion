<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Soil.CheckoutPage.Checkout" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="App_Themes/CheckoutStyleSheet2.css" rel="stylesheet" />
    <script>
        // Function to load cart data and display it on the checkout page
        function loadCheckoutData() {
            // Parse query parameters to get cart data
            const urlParams = new URLSearchParams(window.location.search);
            const cart = JSON.parse(urlParams.get('products')) || [];
            const totalAmount = urlParams.get('totalAmount') || 0;

            // Display cart items
            let cartHtml = '';
            cart.forEach(item => {
                cartHtml += `<div class='cartItem'>
                                <p><strong>${item.ProductName}</strong> - Rs. ${item.Price}</p>
                             </div>`;
            });
            document.getElementById('cartItems').innerHTML = cartHtml;

            // Display total amount
            document.getElementById('totalAmount').innerText = `Total Amount: Rs. ${totalAmount}`;
        }

        // Initialize checkout data on page load
        window.onload = loadCheckoutData;
    </script>
    <br /> <br />
    <div class="checkoutContainer">
        <h1>Checkout</h1>

        <!-- Cart items section -->
        <div id="cartItems" runat="server">
            <!-- Cart items will be displayed dynamically here -->
        </div>

        <!-- Total Amount -->
        <p id="totalAmount" class="totalAmount" runat="server">
            <!-- Total amount will be displayed here dynamically -->
        </p>
        
        <asp:Literal ID="cartContainer" runat="server"></asp:Literal>
        <asp:Literal ID="totalAmountLabel" runat="server"></asp:Literal>

        <br /> <br />
        <div class="paymentMethod">
            <label for="ddlPaymentMethod">Select Payment Method:</label>
            <asp:DropDownList ID="ddlPaymentMethod" runat="server">
                <asp:ListItem Value="CreditCard">Credit Card</asp:ListItem>
                <asp:ListItem Value="DebitCard">Debit Card</asp:ListItem>
                <asp:ListItem Value="PayPal">PayPal</asp:ListItem>
                <asp:ListItem Value="NetBanking">Net Banking</asp:ListItem>
                <asp:ListItem Value="COD">Cash on Delivery</asp:ListItem>
            </asp:DropDownList>
        </div>
        <br /> <br />
        <!-- Place Order Button -->
        <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" OnClick="PlaceCheckoutOrder_Click" CssClass="placeOrderButton" />
    </div>
     <br /> <br />
</asp:Content>
