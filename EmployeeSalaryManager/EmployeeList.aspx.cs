using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EmployeeSalaryManager
{
    public partial class EmployeeList : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["EmployeeDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null) Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid(string search = "")
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT EmpId, EmpName, Department, Designation, NetSalary FROM Employees";
                if (!string.IsNullOrEmpty(search))
                {
                    query += " WHERE EmpName LIKE @Search OR Department LIKE @Search";
                }
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (!string.IsNullOrEmpty(search))
                    {
                        cmd.Parameters.AddWithValue("@Search", "%" + search + "%");
                    }
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        gvEmployees.DataSource = dt;
                        gvEmployees.DataBind();
                    }
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid(txtSearch.Text.Trim());
        }

        protected void btnViewAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            BindGrid();
        }
    }
}