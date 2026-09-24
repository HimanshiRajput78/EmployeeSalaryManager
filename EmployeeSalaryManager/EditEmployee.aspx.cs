using System;
using System.Configuration;
using System.Data.SqlClient;

namespace EmployeeSalaryManager
{
    public partial class EditEmployee : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["EmployeeDBConnectionString"].ConnectionString;
        int empId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null) Response.Redirect("Login.aspx");

            if (Request.QueryString["EmpId"] != null)
            {
                empId = Convert.ToInt32(Request.QueryString["EmpId"]);
                if (!IsPostBack)
                {
                    LoadEmployeeDetails();
                }
            }
            else
            {
                Response.Redirect("EmployeeList.aspx");
            }
        }

        private void LoadEmployeeDetails()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Employees WHERE EmpId = @EmpId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@EmpId", Convert.ToInt32(Request.QueryString["EmpId"]));
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtEmpName.Text = reader["EmpName"].ToString();
                            txtDepartment.Text = reader["Department"].ToString();
                            txtDesignation.Text = reader["Designation"].ToString();
                            txtBasicSalary.Text = reader["BasicSalary"].ToString();
                            txtBonus.Text = reader["Bonus"].ToString();
                            txtDeduction.Text = reader["Deduction"].ToString();
                        }
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            empId = Convert.ToInt32(Request.QueryString["EmpId"]);
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE Employees SET EmpName=@Name, Department=@Dept, Designation=@Desig, BasicSalary=@Basic, Bonus=@Bonus, Deduction=@Deduction WHERE EmpId=@EmpId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", txtEmpName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Dept", txtDepartment.Text.Trim());
                    cmd.Parameters.AddWithValue("@Desig", txtDesignation.Text.Trim());
                    cmd.Parameters.AddWithValue("@Basic", Convert.ToDecimal(txtBasicSalary.Text.Trim()));
                    cmd.Parameters.AddWithValue("@Bonus", Convert.ToDecimal(txtBonus.Text.Trim()));
                    cmd.Parameters.AddWithValue("@Deduction", Convert.ToDecimal(txtDeduction.Text.Trim()));
                    cmd.Parameters.AddWithValue("@EmpId", empId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Text = "Employee Updated Successfully!";
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            empId = Convert.ToInt32(Request.QueryString["EmpId"]);
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Employees WHERE EmpId=@EmpId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@EmpId", empId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Response.Redirect("EmployeeList.aspx");
                }
            }
        }
    }
}