<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditEmployee.aspx.cs" Inherits="EmployeeSalaryManager.EditEmployee" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Edit Employee</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        :root{
            --primary-color:#4a90e2;
            --danger-color:#e74c3c;
            --bg-color:#f4f7f6;
            --card-bg:#fff;
            --text-main:#333;
            --border:#e0e0e0;
        }
        body{font-family:'Segoe UI', Roboto, Arial, sans-serif; background:var(--bg-color); margin:0; padding:20px;}
        .container{max-width:820px; margin:30px auto;}
        .header{display:flex; justify-content:space-between; align-items:center; margin-bottom:20px}
        h2{margin:0; font-size:26px; color:var(--text-main)}
        .small{color:#667; font-size:13px}
        .back{color:var(--primary-color); text-decoration:none; font-weight:600; display:inline-flex; align-items:center; gap:8px}
        .card{background:var(--card-bg); padding:28px; border-radius:12px; box-shadow:0 10px 24px rgba(0,0,0,0.06);}
        .row{display:flex; flex-wrap:wrap; gap:20px}
        .col{flex:1; min-width:240px}
        .input-group{margin-bottom:16px}
        .label{display:block; margin-bottom:6px; font-weight:600; color:var(--text-main)}
        .input{width:100%; padding:11px 12px; border:2px solid var(--border); border-radius:8px; box-sizing:border-box; background:#fafafa}
        .input:focus{outline:none; border-color:var(--primary-color); box-shadow:0 0 0 4px rgba(74,144,226,0.08); background:#fff}
        .readonly{background:#eef3fb; color:var(--primary-color); font-weight:600}
        .actions{display:flex; gap:12px; margin-top:12px}
        .btn-update{flex:1; padding:12px; background:linear-gradient(180deg,#27ae60,#19913e); color:#fff; border:none; border-radius:8px; font-weight:700; cursor:pointer}
        .btn-delete{padding:12px 18px; background:var(--danger-color); color:#fff; border:none; border-radius:8px; cursor:pointer}
        .msg{margin-top:12px; font-weight:700}
        @media(max-width:600px){.col{min-width:100%}.actions{flex-direction:column}}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <div>
                    <h2>Employee Details</h2>
                    <div class="small">Edit employee information and salary</div>
                </div>
                <div>
                    <a class="back" href="EmployeeList.aspx"><span class="material-icons">arrow_back</span> Back to List</a>
                </div>
            </div>

            <div class="card">
                <div class="row">
                    <div class="col">
                        <div class="input-group">
                            <label class="label">Employee Name</label>
                            <asp:TextBox ID="txtEmpName" runat="server" CssClass="input" /></asp:TextBox>
                        </div>
                    </div>

                    <div class="col">
                        <div class="input-group">
                            <label class="label">Department</label>
                            <asp:TextBox ID="txtDepartment" runat="server" CssClass="input" /></asp:TextBox>
                        </div>
                    </div>

                    <div class="col">
                        <div class="input-group">
                            <label class="label">Designation</label>
                            <asp:TextBox ID="txtDesignation" runat="server" CssClass="input" /></asp:TextBox>
                        </div>
                    </div>
                </div>

                <hr />

                <div class="row">
                    <div class="col">
                        <div class="input-group">
                            <label class="label">Basic Salary</label>
                            <asp:TextBox ID="txtBasicSalary" runat="server" CssClass="input" /></asp:TextBox>
                        </div>
                    </div>

                    <div class="col">
                        <div class="input-group">
                            <label class="label">Bonus</label>
                            <asp:TextBox ID="txtBonus" runat="server" CssClass="input" /></asp:TextBox>
                        </div>
                    </div>

                    <div class="col">
                        <div class="input-group">
                            <label class="label">Deduction</label>
                            <asp:TextBox ID="txtDeduction" runat="server" CssClass="input readonly" ReadOnly="true" /></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="actions">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CssClass="btn-update" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete this employee?');" CssClass="btn-delete" />
                </div>

                <asp:Label ID="lblMsg" runat="server" CssClass="msg" ForeColor="Green"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
