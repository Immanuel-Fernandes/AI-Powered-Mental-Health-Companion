<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="Soil.UserDashboardPage.UserDashboard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>User Dashboard</title>
    <link href="App_Themes/DashboardStyleSheet.css" rel="stylesheet" />
    <link href="App_Themes/StyleSheet1.css" rel="stylesheet" />
    <script type="text/javascript">
        // Function to add a product to the cart
        function addToCart(productId, productName, price) {
            let cart = JSON.parse(sessionStorage.getItem('cart')) || [];
            cart.push({ ProductId: productId, ProductName: productName, Price: price });
            sessionStorage.setItem('cart', JSON.stringify(cart));
            displayCart(cart);
        }

        function removeFromCart(productId) {
            let cart = JSON.parse(sessionStorage.getItem('cart')) || [];
            cart = cart.filter(item => item.ProductId !== productId);
            sessionStorage.setItem('cart', JSON.stringify(cart));
            displayCart(cart);
        }

        function clearCart() {
            sessionStorage.removeItem('cart');
            displayCart([]);
        }

        function displayCart(cart) {
            let cartHtml = '';
            let totalAmount = 0;

            if (cart.length === 0) {
                cartHtml = "<p>Your cart is empty.</p>";
            } else {
                cart.forEach(item => {
                    totalAmount += item.Price;
                    cartHtml += `<div class='cartItem' id='cartItem_${item.ProductId}'>
                                    <p>${item.ProductName} - Rs. ${item.Price}</p>
                                    <button class='removeButton' onclick='removeFromCart(${item.ProductId})'>Remove</button>
                                 </div>`;
                });

                cartHtml += `<div class="cartFooter">
                                <p><strong>Total Amount:</strong> Rs. ${totalAmount}</p>
                                <button onclick="clearCart()" class="clearCartButton">Clear Cart</button>
                                <button onclick="proceedToCheckout()" class="checkoutButton">Checkout</button>
                             </div>`;
            }

            document.getElementById('cartContainer').innerHTML = cartHtml;
        }

        function proceedToCheckout() {
            let cart = JSON.parse(sessionStorage.getItem('cart')) || [];
            let totalAmount = cart.reduce((total, item) => total + item.Price, 0);
            let cartId = 'CART' + new Date().getTime();
            let params = new URLSearchParams();
            params.append('cartId', cartId);
            params.append('totalAmount', totalAmount);
            params.append('products', JSON.stringify(cart));

            // Check if user is logged in
            let isLoggedIn = '<%= Session["UserId"] != null %>';
            if (isLoggedIn === 'True') {
                window.location.href = "Checkout.aspx?" + params.toString();
            } else {
                window.location.href = "LoginForm.aspx";
            }
        }

        function viewProduct(productId) {
            window.location.href = "ProductView.aspx?productId=" + productId;
        }

        window.onload = function() {
            let cart = JSON.parse(sessionStorage.getItem('cart')) || [];
            displayCart(cart);
        };
    </script>
     <link href="App_Themes/NavBarStyleSheet.css" rel="stylesheet" />
    <link href="App_Themes/FooterApp_Themes/StyleSheet1.css" rel="stylesheet" />
</head>
<body>

<h1 align="center" style="color: #008000"> Welcome to the Enthusiast Dashboard</h1>
 <!-- Navigation Menu -->
        <div class="navMenu">
            <ul>
                <li><a href="UserDashboard.aspx">Products</a></li>
                <li><a href="Contact.aspx">Contact</a></li>
                <li><a href="LoginForm.aspx">Logout</a></li>
                <li><a href="OrderHistory.aspx">Order History</a></li>
                <li><a href="AdminLogin.aspx">Admin</a></li>
                
            </ul>
        </div>
        
       
        <br />  <br />
        <div id="productContainer" runat="server"></div>

        <div id="cartContainer">
            <h3>Your Cart</h3>
            <div id="cartItems" class="cartItems"></div>
            <button class="clearCartButton" onclick="clearCart()">Clear Cart</button>
            <button class="checkoutButton" onclick="proceedToCheckout()">Proceed to Checkout</button>
        </div>
    </div>

            <br /> <br /> <br /> 

        <!-- Back to Top -->
        <div class="back-to-top">
            <a href="#top">Back to top</a>
        </div>

        <!-- Extended Footer Section -->
        <div class="extended-footer">
            <div class="footer-section">
                <h4>About Us</h4>
                <ul>
                    <li><a href="About.aspx">About</a></li>
                    <li><a href="PrivacyPolicy.aspx">Privacy Policy</a></li>
                    <li><a href="CancellationPolicy.aspx">Cancellation Policy</a></li>
                    <li><a href="ReturnRefundPolicy.aspx">Return & Refund Policy</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Customer Services</h4>
                <ul>
                    <li><a href="Contact.aspx">Contact Us</a></li>
                    <li><a href="Services.aspx">Our Services</a></li>
                    <li><a href="Checkout.aspx">Checkout</a></li>
                    <li><a href="OrderHistory.aspx">Order History</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Quick Links</h4>
                <ul>
                    <li><a href="index.aspx">Home</a></li>
                    <li><a href="LoginForm.aspx">Login</a></li>
                    <li><a href="RegisterForm.aspx">Register</a></li>
                    <li><a href="AdminLogin.aspx">Admin Login</a></li>
                </ul>
            </div>
        </div>

</body>
</html>
