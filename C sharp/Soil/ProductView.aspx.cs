using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Soil
{
    public partial class ProductView : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string productId = Request.QueryString["productId"];
                if (!string.IsNullOrEmpty(productId))
                {
                    LoadProductDetails(productId);
                }
            }
        }

        private void LoadProductDetails(string productId)
        {
            Product product = GetProductFromDatabase(productId);

            if (product != null)
            {
                string productHtml = "<div class='productDetails'>";
                productHtml += "<img src='" + product.ImageUrl + "' alt='" + product.ProductName + "' />";
                productHtml += "<h3>" + product.ProductName + "</h3>";
                productHtml += "<p>Category: " + product.Category + "</p>";
                productHtml += "<p>Price: Rs. " + product.Price + "</p>";
                productHtml += "<p>Description: " + product.Description + "</p>";
                productHtml += "</div>";

                productDetails.InnerHtml = productHtml;
            }
        }

        private Product GetProductFromDatabase(string productId)
        {
            Product product = null;

            string query = "SELECT ProductId, ProductName, Price, Category, ImageUrl, Description FROM Products WHERE ProductId = @ProductId";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ProductId", productId);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        product = new Product
                        {
                            ProductId = Convert.ToInt32(reader["ProductId"]),
                            ProductName = reader["ProductName"].ToString(),
                            Price = Convert.ToDecimal(reader["Price"]),
                            Category = reader["Category"].ToString(),
                            ImageUrl = reader["ImageUrl"].ToString(),
                            Description = reader["Description"].ToString()
                        };
                    }

                    reader.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }

            return product;
        }

        protected void btnGoToDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboard.aspx");
        }

        public class Product
        {
            public int ProductId { get; set; }
            public string ProductName { get; set; }
            public string ImageUrl { get; set; }
            public decimal Price { get; set; }
            public string Category { get; set; }
            public string Description { get; set; }
        }
    }
}
