<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmployeeSalaryManager.Default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Dashboard - Employee Salary Manager</title>
    <link href="https://fonts.googleapis.com/css2?family=Segoe+UI:wght@400;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4a90e2;
            --success-color: #27ae60;
            --danger-color: #e74c3c;
            --bg-color: #f4f7f6;
            --card-bg: #ffffff;
            --text-main: #333333;
            --text-muted: #7f8c8d;
            --border-color: #e0e0e0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--bg-color);
            margin: 0;
            padding: 0;
            color: var(--text-main);
        }

        .dashboard-container {
            max-width: 800px;
            margin: 60px auto;
            background: var(--card-bg);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
        }

        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid var(--border-color);
            padding-bottom: 20px;
            margin-bottom: 30px;
        }

        h2 {
            margin: 0;
            font-size: 26px;
            color: var(--text-main);
            display: flex;
            align-items: center;
            gap: 10px;
        }

        h2 span {
            color: var(--primary-color);
        }

        .welcome-msg {
            font-size: 16px;
            color: var(--text-muted);
            font-weight: 600;
        }

        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .menu-card {
            background: #fafafa;
            border: 2px solid var(--border-color);
            border-radius: 12px;
            padding: 25px;
            text-align: center;
            text-decoration: none;
            color: var(--text-main);
            transition: all 0.3s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 12px;
        }

        .menu-card:hover {
            border-color: var(--primary-color);
            background: #fff;
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(74, 144, 226, 0.15);
        }

        .menu-card .material-icons {
            font-size: 40px;
            color: var(--primary-color);
        }

        .menu-card span.title {
            font-size: 18px;
            font-weight: 700;
        }

        .menu-card span.desc {
            font-size: 13px;
            color: var(--text-muted);
        }

        .logout-btn {
            background-color: var(--danger-color);
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 15px;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .logout-btn:hover {
            background-color: #c0392b;
        }

        .footer-actions {
            text-align: right;
            border-top: 1px solid var(--border-color);
            padding-top: 20px;
        }

        @media (max-width: 600px) {
            .dashboard-container {
                margin: 20px;
                padding: 20px;
            }
            .header-section {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
            .footer-actions {
                text-align: center;
            }
            .logout-btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <div class="header-section">
                <div>
                    <h2><span class="material-icons">dashboard</span> Dashboard</h2>
                    <div class="welcome-msg"><asp:Label ID="lblWelcome" runat="server"></asp:Label></div>
                </div>
                <div>
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="logout-btn" />
                </div>
            </div>

            <div class="menu-grid">
                <a href="AddEmployee.aspx" class="menu-card">
                    <span class="material-icons">person_add</span>
                    <span class="title">Add Employee</span>
                    <span class="desc">Create a new employee record and assign salary details.</span>
                </a>

                <a href="EmployeeList.aspx" class="menu-card">
                    <span class="material-icons">format_list_bulleted</span>
                    <span class="title">Employee List</span>
                    <span class="desc">View, edit or remove existing employees.</span>
                </a>

           <%--     <a href="SalaryReport.aspx" class="menu-card">
                    <span class="material-icons">bar_chart</span>
                    <span class="title">Salary Reports</span>
                    <span class="desc">Generate monthly and annual salary reports.</span>
                </a>

                <a href="Settings.aspx" class="menu-card">
                    <span class="material-icons">settings</span>
                    <span class="title">Settings</span>
                    <span class="desc">Application settings and user preferences.</span>
                </a>--%>
            </div>

            <div class="footer-actions">
                <span class="small">Logged in as: <strong><asp:Label ID="lblUserSmall" runat="server" Text="₹" /></strong></span>

            </div>
        </div>
    </form>
</body>
</html>