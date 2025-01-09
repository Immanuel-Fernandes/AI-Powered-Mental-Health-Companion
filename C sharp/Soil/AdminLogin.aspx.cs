using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Soil
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (username == "IAF" && password == "siws")
            {
                // Redirect to the ManageProducts page upon successful login
                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
            }
        }
    }
}