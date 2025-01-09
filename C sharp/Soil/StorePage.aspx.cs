using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; 
using System.Data.SqlClient;
using System.Configuration;

namespace Soil
{
    public partial class StorePage : System.Web.UI.Page
    {
         protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategoriesAndProducts();
            }
        }

        private void BindCategoriesAndProducts()
        {
            // Connection string should be set according to your database configuration
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Fetching categories
                SqlDataAdapter daCategories = new SqlDataAdapter("SELECT * FROM Categories", conn);
                DataTable dtCategories = new DataTable();
                daCategories.Fill(dtCategories);

                // Adding an extra column to hold products
                dtCategories.Columns.Add("Products", typeof(DataTable));

                foreach (DataRow categoryRow in dtCategories.Rows)
                {
                    // Fetching products for each category
                    string categoryId = categoryRow["CategoryID"].ToString();
                    SqlDataAdapter daProducts = new SqlDataAdapter(
                        "SELECT * FROM Products WHERE SubCategoryID IN (SELECT SubCategoryID FROM SubCategories WHERE CategoryID = @CategoryID)", 
                        conn);
                    daProducts.SelectCommand.Parameters.AddWithValue("@CategoryID", categoryId);
                    DataTable dtProducts = new DataTable();
                    daProducts.Fill(dtProducts);

                    // Assigning the products to the category row
                    categoryRow["Products"] = dtProducts;
                }

                RepeaterCategories.DataSource = dtCategories;
                RepeaterCategories.DataBind();
            }
        }
    }
}
