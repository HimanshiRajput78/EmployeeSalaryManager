using System;

namespace EmployeeSalaryManager
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                lblWelcome.Text = "Welcome, " + Session["Username"].ToString();
                // small footer label
                if (this.FindControl("lblUserSmall") != null)
                {
                    lblUserSmall.Text = Session["Username"].ToString();
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}