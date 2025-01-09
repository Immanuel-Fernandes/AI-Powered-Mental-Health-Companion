using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

namespace Soil
{
    public partial class ManageProducts : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
                BindProductGrid();
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            string productName = txtProductName.Text.Trim();
            string category = string.IsNullOrEmpty(txtNewCategory.Text.Trim()) ? ddlCategory.SelectedValue : txtNewCategory.Text.Trim();
            string description = txtDescription.Text.Trim();
            decimal price = decimal.Parse(txtPrice.Text.Trim());
            int amount = int.Parse(txtAmount.Text.Trim());

            // Handle image upload
            string imageUrl = string.Empty;
            if (fileUploadImage.HasFile)
            {
                string fileName = Path.GetFileName(fileUploadImage.FileName);
                string uploadPath = Server.MapPath("~/images/");
                if (!Directory.Exists(uploadPath))
                {
                    Directory.CreateDirectory(uploadPath);
                }
                fileUploadImage.SaveAs(Path.Combine(uploadPath, fileName));
                imageUrl = "images/" + fileName;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(
                    "INSERT INTO Products (ProductName, ImageUrl, Price, Amount, Category, Description) VALUES (@ProductName, @ImageUrl, @Price, @Amount, @Category, @Description)",
                    connection
                );
                command.Parameters.AddWithValue("@ProductName", productName);
                command.Parameters.AddWithValue("@ImageUrl", imageUrl);
                command.Parameters.AddWithValue("@Price", price);
                command.Parameters.AddWithValue("@Amount", amount);
                command.Parameters.AddWithValue("@Category", category);
                command.Parameters.AddWithValue("@Description", description);

                command.ExecuteNonQuery();
            }

            // Refresh product grid
            BindProductGrid();
            LoadCategories(); // Reload categories to include the new category if added
            Response.Write("<script>alert('Product added successfully!');</script>");
        }

        private void LoadCategories()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT DISTINCT Category FROM Products", connection);
                SqlDataReader reader = command.ExecuteReader();
                ddlCategory.Items.Clear();
                while (reader.Read())
                {
                    ddlCategory.Items.Add(new ListItem(reader["Category"].ToString()));
                }
                reader.Close();
            }
        }

        private void BindProductGrid()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT * FROM Products", connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                System.Data.DataTable dt = new System.Data.DataTable();
                adapter.Fill(dt);
                gvProducts.DataSource = dt;
                gvProducts.DataBind();
            }
        }

        protected void gvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int productId = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value);

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand("DELETE FROM Products WHERE ProductId = @ProductId", connection);
                    command.Parameters.AddWithValue("@ProductId", productId);
                    command.ExecuteNonQuery();
                }

                // Refresh the GridView
                BindProductGrid();
                Response.Write("<script>alert('Product deleted successfully!');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: {ex.Message}');</script>");
            }
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            string newCategory = txtNewCategory.Text.Trim();
            if (!string.IsNullOrEmpty(newCategory))
            {
                // Manually add the new category to the dropdown
                ddlCategory.Items.Add(new ListItem(newCategory));
                txtNewCategory.Text = string.Empty;
                Response.Write("<script>alert('Category added successfully!');</script>");
            }
        }
    }
}
