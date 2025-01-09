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
    public partial class MiniProject : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAccountNumbers();
            }
        }

        // Insert Customer
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string insertSQL = "INSERT INTO customer (AccountNumber, CustomerName, BankBalance) VALUES (@AccountNumber, @CustomerName, @BankBalance)";
            using (SqlConnection scon = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(insertSQL, scon);
                cmd.Parameters.AddWithValue("@AccountNumber", txtAccountNumber.Text);
                cmd.Parameters.AddWithValue("@CustomerName", txtCustomerName.Text);
                cmd.Parameters.AddWithValue("@BankBalance", txtBankBalance.Text);

                try
                {
                    scon.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("Customer inserted successfully!");
                    LoadAccountNumbers();
                }
                catch (Exception err)
                {
                    Response.Write("Error: " + err.Message);
                }
            }
        }

        // Load Account Numbers
        private void LoadAccountNumbers()
        {
            string selectSQL = "SELECT AccountNumber FROM customer";
            using (SqlConnection scon = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(selectSQL, scon);
                try
                {
                    scon.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    ddlAccountNumberUpdate.Items.Clear();
                    ddlAccountNumberDelete.Items.Clear();
                    ddlAccountNumber.Items.Clear();

                    while (reader.Read())
                    {
                        string AccountNumber = reader["AccountNumber"].ToString();
                        ddlAccountNumberUpdate.Items.Add(new ListItem(AccountNumber, AccountNumber));
                        ddlAccountNumberDelete.Items.Add(new ListItem(AccountNumber, AccountNumber));
                        ddlAccountNumber.Items.Add(new ListItem(AccountNumber, AccountNumber));
                    }
                    reader.Close();
                }
                catch (Exception err)
                {
                    Response.Write("Error: " + err.Message);
                }
            }
        }

        // Update Customer
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string updateSQL = "UPDATE customer SET CustomerName = @CustomerName WHERE AccountNumber = @AccountNumber";
            using (SqlConnection scon = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(updateSQL, scon);
                cmd.Parameters.AddWithValue("@AccountNumber", ddlAccountNumberUpdate.SelectedValue);
                cmd.Parameters.AddWithValue("@CustomerName", txtNewCustomerName.Text);

                try
                {
                    scon.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("Customer updated successfully!");
                }
                catch (Exception err)
                {
                    Response.Write("Error: " + err.Message);
                }
            }
        }

        // Delete Customer
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string deleteSQL = "DELETE FROM customer WHERE AccountNumber = @AccountNumber";
            using (SqlConnection scon = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(deleteSQL, scon);
                cmd.Parameters.AddWithValue("@AccountNumber", ddlAccountNumberDelete.SelectedValue);

                try
                {
                    scon.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("Customer deleted successfully!");
                    LoadAccountNumbers(); // Refresh dropdowns
                }
                catch (Exception err)
                {
                    Response.Write("Error: " + err.Message);
                }
            }
        }

        // Display All customers
        protected void btnDisplayAll_Click(object sender, EventArgs e)
        {
            string selectSQL = "SELECT * FROM customer";
            using (SqlConnection scon = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(selectSQL, scon);
                try
                {
                    scon.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                catch (Exception err)
                {
                    Response.Write("Error: " + err.Message);
                }
            }
        }

        // Deposit Amount
        protected void btnDeposit_Click(object sender, EventArgs e)
        {
            decimal amount = 0;
            if (!string.IsNullOrWhiteSpace(txtAmount.Text))
            {
                amount = Convert.ToDecimal(txtAmount.Text);
                if (amount > 0)
                {
                    string updateSQL = "UPDATE customer SET BankBalance = BankBalance + @Amount WHERE AccountNumber = @AccountNumber";
                    string accountNumber = ddlAccountNumber.SelectedValue;

                    ExecuteTransaction(updateSQL, amount, "Deposit successful!", "Failed to deposit amount. Please try again.");
                }
                else
                {
                    Response.Write("Please enter a valid deposit amount.");
                }
            }
            else
            {
                Response.Write("Please enter a valid number.");
            }
        }

        // Withdraw Amount
        protected void btnWithdraw_Click(object sender, EventArgs e)
        {
            decimal amount = 0;
            if (!string.IsNullOrWhiteSpace(txtAmount.Text))
            {
                amount = Convert.ToDecimal(txtAmount.Text);
                if (amount > 0)
                {
                    string updateSQL = "UPDATE customer SET BankBalance = BankBalance - @Amount WHERE AccountNumber = @AccountNumber AND BankBalance >= @Amount";
                    string accountNumber = ddlAccountNumber.SelectedValue;

                    ExecuteTransaction(updateSQL, amount, "Withdrawal successful!", "Insufficient funds for this withdrawal.");
                }
                else
                {
                    Response.Write("Please enter a valid withdrawal amount.");
                }
            }
            else
            {
                Response.Write("Please enter a valid number.");
            }
        }

        // Execute Transaction
        private void ExecuteTransaction(string query, decimal amount, string successMessage, string failureMessage = "Transaction failed!")
        {
            using (SqlConnection scon = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, scon);
                cmd.Parameters.AddWithValue("@Amount", amount);
                cmd.Parameters.AddWithValue("@AccountNumber", ddlAccountNumber.SelectedValue);

                try
                {
                    scon.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Response.Write(successMessage);
                    }
                    else
                    {
                        Response.Write(failureMessage);
                    }
                }
                catch (Exception err)
                {
                    Response.Write("Error: " + err.Message);
                }
            }
        }
    }
}