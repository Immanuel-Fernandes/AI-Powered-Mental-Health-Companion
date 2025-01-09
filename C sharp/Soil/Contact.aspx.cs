using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;
using System.Data.SqlClient;

namespace Soil
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void SubmitForm(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string category = ddlCategory.SelectedValue;
            string message = txtMessage.Text.Trim();

            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO ContactUs (Name, Email, Phone, Category, Message) VALUES (@Name, @Email, @Phone, @Category, @Message)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@Category", category);
                cmd.Parameters.AddWithValue("@Message", message);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Thank you! Your message has been sent.');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error:'+ex.Message);</script>");
                }
            }
        }


        
        /*protected void SubmitForm(object sender, EventArgs e)
        {
            try
            {
                string name = txtName.Text;
                string email = txtEmail.Text;
                string message = txtMessage.Text;

                // Prepare email
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("your-yahoo-email@yahoo.com"); // Your Yahoo email
                mail.To.Add("support@example.com"); // Replace with your recipient email
                mail.Subject = "Contact Form Submission";
                mail.Body = "Name: {name}\nEmail: {email}\nMessage: {message}";

                // Set up Yahoo SMTP server
                SmtpClient smtp = new SmtpClient("smtp.mail.yahoo.com", 587); // Yahoo SMTP settings
                smtp.Credentials = new System.Net.NetworkCredential("your-yahoo-email@yahoo.com", "your-app-password");
                smtp.EnableSsl = true;

                // Send the email
                smtp.Send(mail);

                // Redirect to Thank You page
                Response.Redirect("ThankYou.aspx");
            }
            catch (Exception ex)
            {
                // Handle errors
                Response.Write("<script>alert('An error occurred: {ex.Message}');</script>");
            }
        }*/


    }
}