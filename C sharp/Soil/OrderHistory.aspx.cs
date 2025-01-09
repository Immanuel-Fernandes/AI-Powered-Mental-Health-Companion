using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Soil
{
    public partial class OrderHistory : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

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
                    LoadOrderHistory();
                }
            }
        }

        private void LoadOrderHistory()
        {
            string userId = Session["UserId"].ToString();
            List<Orders> orderHistory = new List<Orders>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT OrderID, CartID, ProductName, Price, TotalAmount, PaymentMethod, OrderDate FROM Orders WHERE UserID = @UserID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userId);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Orders order = new Orders
                        {
                            OrderID = reader["OrderID"].ToString(),
                            CartID = reader["CartID"].ToString(),
                            ProductName = reader["ProductName"].ToString(),
                            Price = Convert.ToDecimal(reader["Price"]),
                            TotalAmount = Convert.ToDecimal(reader["TotalAmount"]),
                            PaymentMethod = reader["PaymentMethod"].ToString(),
                            OrderDate = Convert.ToDateTime(reader["OrderDate"])
                        };
                        orderHistory.Add(order);
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    // Handle any errors that occur during the query execution
                    Response.Write("Error: " + ex.Message);
                }
            }

            RepeaterOrderHistory.DataSource = orderHistory;
            RepeaterOrderHistory.DataBind();
        }

        public class Orders
        {
            public string OrderID { get; set; }
            public string CartID { get; set; }
            public string ProductName { get; set; }
            public decimal Price { get; set; }
            public decimal TotalAmount { get; set; }
            public string PaymentMethod { get; set; }
            public DateTime OrderDate { get; set; }
        }
    }
}
