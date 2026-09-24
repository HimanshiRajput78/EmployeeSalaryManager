using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

namespace EmployeeSalaryManager
{
    public partial class Login : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["EmployeeDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Prefill username from cookie if present
                var cookie = Request.Cookies["username"];
                if (cookie != null && !string.IsNullOrEmpty(cookie.Value))
                {
                    txtUsername.Text = Server.UrlDecode(cookie.Value);
                    chkRemember.Checked = true;
                }

                // Add placeholders and autofocus for better UX
                txtUsername.Attributes["placeholder"] = "Enter username";
                txtPassword.Attributes["placeholder"] = "Enter password";
                txtUsername.Attributes["autofocus"] = "autofocus";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT COUNT(1) FROM Users WHERE Username=@Username AND Password=@Password";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    conn.Open();
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    if (count == 1)
                    {
                        // remember username if requested
                        if (chkRemember.Checked)
                        {
                            var cookie = new HttpCookie("username", Server.UrlEncode(txtUsername.Text.Trim()));
                            cookie.Expires = DateTime.Now.AddDays(30);
                            Response.Cookies.Add(cookie);
                        }
                        else
                        {
                            if (Request.Cookies["username"] != null)
                            {
                                var old = new HttpCookie("username") { Expires = DateTime.Now.AddDays(-1) };
                                Response.Cookies.Add(old);
                            }
                        }

                        Session["Username"] = txtUsername.Text.Trim();
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        lblError.Text = "Invalid Username or Password";
                    }
                }
            }
        }
    }
}