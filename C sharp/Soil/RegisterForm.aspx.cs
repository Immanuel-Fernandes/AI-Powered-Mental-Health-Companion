using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace Soil
{
    public partial class RegisterForm : System.Web.UI.Page
    {
        // Connection string to connect to SQL Server database
        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the page is being loaded for the first time (not a postback)
            if (!IsPostBack)
            {
                lblMessage.Text = ""; // Clear any previous messages
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Get values from the input fields
            string firstName = txtFirstName.Text.Trim();
            string password = txtPassword.Text.Trim();
            string email = txtEmail.Text.Trim();
            string mobileNo = txtMobileNo.Text.Trim();
            string address = txtAddress.Text.Trim();
            string pincode = txtPincode.Text.Trim();
            string username = txtFirstName.Text.Trim(); // Assuming you added a field for username

            // Validate input (you can add more validation as needed)
            if (string.IsNullOrEmpty(firstName) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(email) ||
                string.IsNullOrEmpty(mobileNo) || string.IsNullOrEmpty(address) || string.IsNullOrEmpty(pincode) || string.IsNullOrEmpty(username))
            {
                lblMessage.Text = "All fields are required.";
                return;
            }

            // Insert user data into the database
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    // Start a transaction so that both tables get updated together
                    SqlTransaction transaction = con.BeginTransaction();

                    try
                    {
                        // Insert into the 'register' table
                        string registerQuery = "INSERT INTO register (firstName, password, email, mobileNo, address, pincode) " +
                                               "VALUES (@FirstName, @Password, @Email, @MobileNo, @Address, @Pincode)";
                        using (SqlCommand cmd = new SqlCommand(registerQuery, con, transaction))
                        {
                            cmd.Parameters.AddWithValue("@FirstName", firstName);
                            cmd.Parameters.AddWithValue("@Password", password); // Ensure password is hashed in a real app
                            cmd.Parameters.AddWithValue("@Email", email);
                            cmd.Parameters.AddWithValue("@MobileNo", mobileNo);
                            cmd.Parameters.AddWithValue("@Address", address);
                            cmd.Parameters.AddWithValue("@Pincode", pincode);

                            // Execute the insert query
                            cmd.ExecuteNonQuery();
                        }

                        // Insert into the 'login' table
                        string loginQuery = "INSERT INTO login (username, password) VALUES (@Username, @Password)";
                        using (SqlCommand cmd = new SqlCommand(loginQuery, con, transaction))
                        {
                            cmd.Parameters.AddWithValue("@Username", username);
                            cmd.Parameters.AddWithValue("@Password", password); // Ensure password is hashed in a real app

                            // Execute the insert query
                            cmd.ExecuteNonQuery();
                        }

                        // Commit the transaction if both inserts succeed
                        transaction.Commit();
                        lblMessage.Text = "Registration successful!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    catch (Exception ex)
                    {
                        // If an error occurs, roll back the transaction
                        transaction.Rollback();
                        lblMessage.Text = "Error: " + ex.Message;
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}