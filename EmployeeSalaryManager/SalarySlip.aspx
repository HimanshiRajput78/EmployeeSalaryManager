<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalarySlip.aspx.cs" Inherits="EmployeeSalaryManager.SalarySlip" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Salary Slip</title>
    <style>
        .slip-box { width: 500px; margin: 30px auto; padding: 20px; border: 1px solid #000; font-family: Arial, sans-serif; }
        .table-breakdown { width: 100%; border-collapse: collapse; margin-top: 15px; }
        .table-breakdown th, .table-breakdown td { border: 1px solid #ddd; padding: 8px; text-align: left; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center; margin-top: 20px;">
            <a href="EmployeeList.aspx">Back to List</a> | 
            <asp:Button ID="btnPrint" runat="server" Text="Print Salary Slip" OnClientClick="window.print(); return false;" />
        </div>
        <div class="slip-box">
            <h2 style="text-align:center;">Company Name</h2>
            <h4 style="text-align:center; margin-top:-10px;">Salary Slip</h4>
            <hr />
            <div>
                <strong>Employee ID:</strong> <asp:Label ID="lblEmpId" runat="server"></asp:Label><br />
                <strong>Employee Name:</strong> <asp:Label ID="lblEmpName" runat="server"></asp:Label><br />
                <strong>Department:</strong> <asp:Label ID="lblDepartment" runat="server"></asp:Label><br />
                <strong>Designation:</strong> <asp:Label ID="lblDesignation" runat="server"></asp:Label><br />
            </div>
            
            <table class="table-breakdown">
                <tr>
                    <th>Earnings</th>
                    <th>Amount</th>
                </tr>
                <tr>
                    <td>Basic Salary</td>
                    <td>₹ <asp:Label ID="lblBasic" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Bonus</td>
                    <td>₹ <asp:Label ID="lblBonus" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>Deductions</th>
                    <th>Amount</th>
                </tr>
                <tr>
                    <td>Deduction</td>
                    <td>₹ <asp:Label ID="lblDeduction" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>Net Salary Payable</th>
                    <th>₹ <asp:Label ID="lblNetSalary" runat="server"></asp:Label></th>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>