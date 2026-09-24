<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="EmployeeSalaryManager.EmployeeList" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Employee List</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #6366f1 0%, #4f46e5 100%);
            --card-gradient: linear-gradient(145deg, #ffffff 0%, #f8fafc 100%);
            --primary-color: #4f46e5;
            --accent-color: #818cf8;
            --success-color: #10b981;
            --danger-color: #ef4444;
            --bg-color: #0f172a;
            --card-bg: #ffffff;
            --text-main: #1e293b;
            --text-muted: #64748b;
            --border-color: #e2e8f0;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f1f5f9 0%, #e2e8f0 100%);
            margin: 0;
            padding: 0;
            color: var(--text-main);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .dashboard-container {
            width: 100%;
            max-width: 850px;
            margin: 20px;
            background: var(--card-bg);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(15, 23, 42, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.8);
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid var(--border-color);
            padding-bottom: 24px;
            margin-bottom: 35px;
        }

        h2 {
            margin: 0;
            font-size: 28px;
            font-weight: 700;
            color: var(--text-main);
            display: flex;
            align-items: center;
            gap: 12px;
            letter-spacing: -0.5px;
        }

        h2 .material-icons {
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-size: 34px;
        }

        .welcome-msg {
            font-size: 15px;
            color: var(--text-muted);
            font-weight: 500;
            background: #f1f5f9;
            padding: 8px 16px;
            border-radius: 30px;
            border: 1px solid var(--border-color);
        }

        .logout-btn {
            background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
            color: white;
            border: none;
            padding: 12px 28px;
            font-size: 15px;
            font-weight: 600;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            box-shadow: 0 4px 12px rgba(239, 68, 68, 0.25);
        }

        .logout-btn:hover {
            background: linear-gradient(135deg, #dc2626 0%, #b91c1c 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(239, 68, 68, 0.35);
        }

        .search-bar { display:flex; gap:12px; align-items:center; margin-top:8px; }
        .search-input { flex:1; padding:10px 12px; border-radius:10px; border:1px solid var(--border-color); background:#fff; }
        .btn-primary { padding:10px 14px; background:linear-gradient(135deg,#6366f1,#4f46e5); color:#fff; border:none; border-radius:10px; cursor:pointer; font-weight:600; }
        .btn-secondary { padding:10px 12px; background:#f3f4f6; border:1px solid var(--border-color); border-radius:10px; cursor:pointer; }

        .gv-table { width:100%; border-collapse:collapse; font-size:14px; margin-top: 15px; }
        .gv-table th, .gv-table td { padding:12px 14px; border-bottom:1px solid var(--border-color); text-align:left; }
        .gv-table th { background:#fbfcfe; font-weight:700; color:var(--text-main); }
        .gv-table tr:hover td { background:#fbfbff; }
        .action-link { color:var(--primary-color); font-weight:600; text-decoration:none; margin-right:8px; }
        .action-link:hover { text-decoration:underline; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <div class="header-section">
                <div>
                    <h2><span class="material-icons">people</span> Employee List</h2>
                    <div class="welcome-msg">Manage employees and salary records</div>
                </div>
                <div>
                    <a class="logout-btn" href="Default.aspx">Back to Dashboard</a>
                </div>
            </div>
            
            <div class="search-bar">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input" Placeholder="Search by Name or Department"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn-primary" />
                <asp:Button ID="btnViewAll" runat="server" Text="View All" OnClick="btnViewAll_Click" CssClass="btn-secondary" />
            </div>
            
            <asp:GridView ID="gvEmployees" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" CssClass="gv-table">
                <Columns>
                    <asp:BoundField DataField="EmpId" HeaderText="ID" />
                    <asp:BoundField DataField="EmpName" HeaderText="Name" />
                    <asp:BoundField DataField="Department" HeaderText="Department" />
                    <asp:BoundField DataField="Designation" HeaderText="Designation" />
                    
                    <asp:TemplateField HeaderText="Net Salary">
                        <ItemTemplate>
                            ₹ <%# Eval("NetSalary", "{0:N2}") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <a class="action-link" href='EditEmployee.aspx?EmpId=<%# Eval("EmpId") %>'>Edit</a>
                            <a class="action-link" href='SalarySlip.aspx?EmpId=<%# Eval("EmpId") %>'>Salary Slip</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>