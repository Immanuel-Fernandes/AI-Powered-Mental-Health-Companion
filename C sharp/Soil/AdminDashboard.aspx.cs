using System;
using System.Web.UI;

namespace Soil
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Any initialization code, if needed
            }
        }

        protected void btnManageProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageProducts.aspx");
        }

        protected void btnViewOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("Orders.aspx");
        }


    }
}
