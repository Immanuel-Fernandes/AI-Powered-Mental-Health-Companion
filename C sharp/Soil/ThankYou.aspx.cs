using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Soil
{
    public partial class ThankYou : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve selected payment method from the session "Payment Successful!!! ";
                string paymentMethod = Session["PaymentMethod"] != null ? Session["PaymentMethod"].ToString() : "Unknown";
                //lblPaymentDetails.Text = "Payment Successful!!! ";
            }
        }

        protected void BackToShop_Click(object sender, EventArgs e)
        {
            // Redirect back to the shop or homepage
            Response.Redirect("LoginForm.aspx");
        }
    }
}