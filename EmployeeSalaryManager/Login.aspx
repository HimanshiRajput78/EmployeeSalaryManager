<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EmployeeSalaryManager.Login" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Login - Employee Salary Manager</title>
    <!-- Google Fonts & Material Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #6366f1 0%, #4f46e5 100%);
            --primary-color: #4f46e5;
            --danger-color: #ef4444;
            --text-main: #1e293b;
            --text-muted: #64748b;
            --border-color: #e2e8f0;
            --input-focus: rgba(79, 70, 229, 0.15);
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f1f5f9 0%, #e2e8f0 100%);
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            background: #ffffff;
            width: 400px;
            max-width: calc(100% - 40px);
            padding: 40px 35px;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(15, 23, 42, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.8);
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .logo {
            text-align: center;
            margin-bottom: 15px;
        }

        .logo-icon {
            width: 60px;
            height: 60px;
            background: var(--primary-gradient);
            border-radius: 16px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            color: white;
            box-shadow: 0 8px 20px rgba(79, 70, 229, 0.3);
        }

        .logo-icon .material-icons {
            font-size: 32px;
        }

        h2 {
            margin: 0 0 25px 0;
            font-weight: 700;
            text-align: center;
            color: var(--text-main);
            font-size: 24px;
            letter-spacing: -0.5px;
        }

        .field { 
            margin-bottom: 20px; 
        }

        .field label { 
            display: block; 
            margin-bottom: 8px; 
            color: var(--text-main); 
            font-size: 13px; 
            font-weight: 600;
        }

        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }

        .input-wrapper i {
            position: absolute;
            left: 14px;
            color: var(--text-muted);
            font-size: 20px;
        }

        .input {
            width: 100%;
            box-sizing: border-box;
            padding: 12px 15px 12px 45px;
            border-radius: 10px;
            border: 2px solid var(--border-color);
            font-size: 14px;
            font-family: 'Poppins', sans-serif;
            background-color: #fafafa;
            transition: all 0.3s ease;
        }

        .input:focus { 
            outline: none; 
            border-color: var(--primary-color); 
            background-color: #fff;
            box-shadow: 0 0 0 4px var(--input-focus); 
        }

        .btn {
            width: 100%;
            background: var(--primary-gradient);
            color: #fff;
            border: none;
            cursor: pointer;
            font-weight: 600;
            padding: 14px;
            border-radius: 10px;
            font-size: 15px;
            font-family: 'Poppins', sans-serif;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(79, 70, 229, 0.25);
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(79, 70, 229, 0.35);
        }

        .options { 
            display: flex; 
            align-items: center; 
            justify-content: space-between; 
            margin: 15px 0 20px 0; 
        }

        .error { 
            color: var(--danger-color); 
            margin-top: 15px; 
            text-align: center; 
            font-size: 13px; 
            font-weight: 600;
            background: #fee2e2;
            padding: 10px;
            border-radius: 8px;
        }

        .small { 
            font-size: 13px; 
            color: var(--text-muted); 
            font-weight: 500;
            text-decoration: none;
            transition: color 0.2s;
        }

        .small:hover {
            color: var(--primary-color);
        }

        .checkbox-container {
            display: flex;
            align-items: center;
            gap: 6px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card">
            <div class="logo">
                <div class="logo-icon">
                    <span class="material-icons">admin_panel_settings</span>
                </div>
            </div>
            <h2>Employee Manager</h2>
            
            <div class="field">
                <label for="txtUsername">Username</label>
                <div class="input-wrapper">
                    <i class="material-icons">person</i>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="input" ClientIDMode="Static" placeholder="Enter username" />
                </div>
                <asp:RequiredFieldValidator ID="rfvUser" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required" ForeColor="#ef4444" Display="Dynamic" CssClass="small" style="margin-top: 4px; display: block;" />
            </div>

            <div class="field">
                <label for="txtPassword">Password</label>
                <div class="input-wrapper">
                    <i class="material-icons">lock</i>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input" ClientIDMode="Static" placeholder="Enter password" />
                </div>
                <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" ForeColor="#ef4444" Display="Dynamic" CssClass="small" style="margin-top: 4px; display: block;" />
            </div>

            <div class="options">
                <div class="checkbox-container">
                    <asp:CheckBox ID="chkRemember" runat="server" /> 
                    <span class="small">Remember me</span>
                </div>
                <div>
                    <a href="#" class="small">Forgot?</a>
                </div>
            </div>

            <div>
                <asp:Button ID="btnLogin" runat="server" Text="Sign In" OnClick="btnLogin_Click" CssClass="btn" />
            </div>

            <div>
                <asp:Label ID="lblError" runat="server" CssClass="error" Visible="false"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>