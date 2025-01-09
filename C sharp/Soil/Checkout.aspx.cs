using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.UI;

namespace Soil.CheckoutPage
{
    public partial class Checkout : System.Web.UI.Page
    {
        private string connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if user is logged in
                if (Session["UserId"] == null)
                {
                    Response.Redirect("LoginForm.aspx");
                }
                else
                {
                    LoadCheckoutCartData();
                }
            }
        }

        private void LoadCheckoutCartData()
        {
            try
            {
                string cartData = Request.QueryString["products"];
                decimal totalAmount = decimal.Parse(Request.QueryString["totalAmount"] ?? "0");

                if (!string.IsNullOrEmpty(cartData))
                {
                    var serializer = new JavaScriptSerializer();
                    List<CartItemCheckout> cartItems = serializer.Deserialize<List<CartItemCheckout>>(cartData);

                    string cartHtml = string.Empty;
                    foreach (var item in cartItems)
                    {
                        cartHtml += String.Format("<div class='cartItem'><p><strong>{0}</strong> - Rs. {1}</p></div>", item.ProductName, item.Price);
                    }

                    cartContainer.Text = cartHtml;
                    totalAmountLabel.Text = String.Format("Total Amount: Rs. {0:F2}", totalAmount);
                }
            }
            catch (Exception ex)
            {
                // Log the error (consider using a logging framework)
                Console.WriteLine("Error loading cart data: " + ex.Message);
                Response.Write("Error loading cart data: " + ex.Message);
            }
        }

        protected void PlaceCheckoutOrder_Click(object sender, EventArgs e)
        {
            try
            {
                string userId = Session["UserId"].ToString();
                string paymentMethod = ddlPaymentMethod.SelectedValue;
                string cartData = Request.QueryString["products"];
                decimal totalAmount = decimal.Parse(Request.QueryString["totalAmount"] ?? "0");

                if (!string.IsNullOrEmpty(cartData))
                {
                    var serializer = new JavaScriptSerializer();
                    List<CartItemCheckout> cartItems = serializer.Deserialize<List<CartItemCheckout>>(cartData);

                    using (SqlConnection conn = new SqlConnection(connString))
                    {
                        conn.Open();
                        string cartId = "Cart_" + Guid.NewGuid().ToString(); // Generating a unique CartID
                        foreach (var item in cartItems)
                        {
                            string orderId = GenerateUniqueOrderID(conn); // Ensure each OrderID is unique
                            string orderQuery = "INSERT INTO Orders (OrderID, CartID, UserID, ProductName, Price, TotalAmount, PaymentMethod) VALUES (@OrderID, @CartID, @UserID, @ProductName, @Price, @TotalAmount, @PaymentMethod)";
                            SqlCommand orderCmd = new SqlCommand(orderQuery, conn);
                            orderCmd.Parameters.AddWithValue("@OrderID", orderId);
                            orderCmd.Parameters.AddWithValue("@CartID", cartId);
                            orderCmd.Parameters.AddWithValue("@UserID", userId);
                            orderCmd.Parameters.AddWithValue("@ProductName", item.ProductName);
                            orderCmd.Parameters.AddWithValue("@Price", item.Price);
                            orderCmd.Parameters.AddWithValue("@TotalAmount", totalAmount);
                            orderCmd.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
                            orderCmd.ExecuteNonQuery();
                        }
                    }
                }

                Session.Remove("cart");
                Response.Redirect("ThankYou.aspx");
            }
            catch (SqlException sqlEx)
            {
                // Log the SQL exception (consider using a logging framework)
                Console.WriteLine("SQL Error: " + sqlEx.Message);
                Response.Write("SQL Error: " + sqlEx.Message);
            }
            catch (Exception ex)
            {
                // Log the general exception
                Console.WriteLine("Error placing order: " + ex.Message);
                Response.Write("Error placing order: " + ex.Message);
            }
        }

        private string GenerateUniqueOrderID(SqlConnection conn)
        {
            string orderId;
            bool isUnique = false;

            do
            {
                orderId = "Soil_" + Guid.NewGuid().ToString();
                string checkQuery = "SELECT COUNT(*) FROM Orders WHERE OrderID = @OrderID";
                SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
                checkCmd.Parameters.AddWithValue("@OrderID", orderId);

                int count = (int)checkCmd.ExecuteScalar();
                if (count == 0)
                {
                    isUnique = true;
                }
            } while (!isUnique);

            return orderId;
        }

        public class CartItemCheckout
        {
            public string ProductName { get; set; }
            public decimal Price { get; set; }
        }
    }
}
