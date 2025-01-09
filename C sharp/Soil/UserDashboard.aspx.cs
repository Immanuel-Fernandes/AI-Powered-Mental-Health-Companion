using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Soil.UserDashboardPage
{
    public partial class UserDashboard : System.Web.UI.Page
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
                    LoadUserDashboardProducts();
                }
            }
        }

        private void LoadUserDashboardProducts()
        {
            List<Product> productList = GetProductsFromDatabase();

            foreach (var product in productList)
            {
                string cardHtml = "<div class='productCard'>";
                cardHtml += "<img src='" + product.ImageUrl + "' alt='" + product.ProductName + "' />";
                cardHtml += "<h3>" + product.ProductName + "</h3>";
                cardHtml += "<p>" + product.Category + "</p>";
                cardHtml += "<p>Price: Rs. " + product.Price + "</p>";
                cardHtml += "<button class='addToCartButton' onclick='addToCart(" + product.ProductId + ", \"" + product.ProductName + "\", " + product.Price + ")'>Add to Cart</button>";
                cardHtml += "<button class='viewButton' onclick='viewProduct(" + product.ProductId + ")'>View</button>";
                cardHtml += "</div>";

                // Append the HTML to the product container dynamically
                productContainer.InnerHtml += cardHtml;
            }
        }

        private List<Product> GetProductsFromDatabase()
        {
            List<Product> productList = new List<Product>();

            string query = "SELECT ProductId, ProductName, Price, Category, ImageUrl FROM Products";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Product product = new Product
                        {
                            ProductId = Convert.ToInt32(reader["ProductId"]),
                            ProductName = reader["ProductName"].ToString(),
                            Price = Convert.ToDecimal(reader["Price"]),
                            Category = reader["Category"].ToString(),
                            ImageUrl = reader["ImageUrl"].ToString()
                        };

                        productList.Add(product);
                    }

                    reader.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }

            return productList;
        }

        public class Product
        {
            public int ProductId { get; set; }
            public string ProductName { get; set; }
            public string ImageUrl { get; set; }
            public decimal Price { get; set; }
            public string Category { get; set; }
        }
    }
}
