using System;
using System.Configuration;
using System.Data.SqlClient;


namespace EmployeeSalaryManager
{
    public partial class SalarySlip : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["EmployeeDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null) Response.Redirect("Login.aspx");

            if (!IsPostBack)
            {
                if (Request.QueryString["EmpId"] != null)
                {
                    int empId = Convert.ToInt32(Request.QueryString["EmpId"]);
                    LoadEmployeeSalarySlip(empId);
                }
            }
        }

        private void LoadEmployeeSalarySlip(int empId)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT EmpId, EmpName, Department, Designation, BasicSalary, Bonus, Deduction, NetSalary FROM Employees WHERE EmpId = @EmpId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@EmpId", empId);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblEmpId.Text = reader["EmpId"].ToString();
                            lblEmpName.Text = reader["EmpName"].ToString();
                            lblDepartment.Text = reader["Department"].ToString();
                            lblDesignation.Text = reader["Designation"].ToString();

                            // N2 format use kar rahe hain taaki dollar ya question mark na aaye
                            decimal basic = Convert.ToDecimal(reader["BasicSalary"]);
                            decimal bonus = Convert.ToDecimal(reader["Bonus"]);
                            decimal deduction = Convert.ToDecimal(reader["Deduction"]);
                            decimal netSalary = Convert.ToDecimal(reader["NetSalary"]);

                            lblBasic.Text = basic.ToString("N2");
                            lblBonus.Text = bonus.ToString("N2");
                            lblDeduction.Text = deduction.ToString("N2");
                            lblNetSalary.Text = netSalary.ToString("N2");
                        }
                    }
                }
            }
        }
    }
}