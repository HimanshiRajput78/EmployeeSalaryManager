using System;
using System.Configuration;
using System.Data.SqlClient;

namespace EmployeeSalaryManager
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["EmployeeDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null) Response.Redirect("Login.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Working days aur present days ke hisaab se deduction calculation
            decimal basicSalary = Convert.ToDecimal(txtBasicSalary.Text.Trim());
            int totalDays = Convert.ToInt32(txtTotalDays.Text.Trim()); // Total working days (jaise 30)
            int presentDays = Convert.ToInt32(txtPresentDays.Text.Trim()); // Jitne din employee ne kaam kiya
            decimal bonus = Convert.ToDecimal(txtBonus.Text.Trim());

            // Per day salary aur absent days se deduction nikalna
            decimal perDaySalary = totalDays > 0 ? (basicSalary / totalDays) : 0;
            int absentDays = totalDays - presentDays;
            decimal calculatedDeduction = absentDays * perDaySalary;

            // Optional: Agar aap Net Salary bhi calculate karke dikhana ya save karna chahte hain
            decimal netSalary = basicSalary + bonus - calculatedDeduction;

            // TextBox mein calculated deduction auto-fill karne ke liye (agar txtDeduction textbox hai)
            txtDeduction.Text = calculatedDeduction.ToString("0.00");

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Employees (EmpName, Department, Designation, BasicSalary, Bonus, Deduction) VALUES (@Name, @Dept, @Desig, @Basic, @Bonus, @Deduction)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", txtEmpName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Dept", txtDepartment.Text.Trim());
                    cmd.Parameters.AddWithValue("@Desig", txtDesignation.Text.Trim());
                    cmd.Parameters.AddWithValue("@Basic", basicSalary);
                    cmd.Parameters.AddWithValue("@Bonus", bonus);
                    cmd.Parameters.AddWithValue("@Deduction", calculatedDeduction);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Text = "Employee Saved Successfully! Net Salary: ₹ " + netSalary.ToString("0.00");
                    ClearFields();
                }
            }
        }

        private void ClearFields()
        {
            txtEmpName.Text = "";
            txtDepartment.Text = "";
            txtDesignation.Text = "";
            txtBasicSalary.Text = "";
            txtBonus.Text = "";
            txtDeduction.Text = "";
            txtTotalDays.Text = "";
            txtPresentDays.Text = "";
            txtNetSalary.Text = "";
        }
    }
}