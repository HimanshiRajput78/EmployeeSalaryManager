<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="EmployeeSalaryManager.AddEmployee" %><!DOCTYPE html><html><head runat="server">
    <title>Add Employee</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <style>
        :root {
            --primary-color: #4a90e2;
            --success-color: #27ae60;
            --bg-color: #f4f7f6;
            --card-bg: #ffffff;
            --text-main: #333333;
            --text-muted: #7f8c8d;
            --border-color: #e0e0e0;
            --input-focus: #aed6f1;
        }

        body {
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            background-color: var(--bg-color);
            margin: 0;
            padding: 20px;
            color: var(--text-main);
        }

        .main-wrapper {
            max-width: 850px;
            margin: 40px auto;
        }

        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        h2 {
            margin: 0;
            font-size: 28px;
            font-weight: 700;
            color: var(--text-main);
        }

        .back-btn {
            text-decoration: none;
            color: var(--primary-color);
            font-weight: 600;
            display: flex;
            align-items: center;
            transition: color 0.3s;
        }

        .back-btn:hover {
            color: #357abd;
        }

        /* Form Card */
        .employee-form {
            background: var(--card-bg);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }

        /* Section Titles */
        .form-section {
            margin-bottom: 30px;
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 15px;
        }
        
        .section-title {
            font-size: 18px;
            font-weight: 600;
            color: var(--primary-color);
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .section-title i {
            margin-right: 10px;
        }

        /* Grid Layout */
        .row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .col {
            flex: 1;
            min-width: 300px;
        }

        /* Input Groups */
        .input-group {
            margin-bottom: 20px;
        }

        .input-label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--text-main);
        }

        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }

        .input-wrapper i {
            position: absolute;
            left: 12px;
            color: var(--text-muted);
            font-size: 20px;
        }

        .input-field {
            width: 100%;
            padding: 12px 15px 12px 45px; /* Space for icon */
            border: 2px solid var(--border-color);
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 15px;
            transition: all 0.3s ease;
            background-color: #fafafa;
        }

        .input-field:focus {
            border-color: var(--primary-color);
            background-color: #fff;
            box-shadow: 0 0 0 4px var(--input-focus);
            outline: none;
        }

        .readonly-field {
            background-color: #e9ecef;
            font-weight: bold;
            color: var(--primary-color);
        }

        /* Submit Button */
        .submit-btn {
            width: 100%;
            background-color: var(--success-color);
            color: white;
            border: none;
            padding: 15px;
            font-size: 18px;
            font-weight: 700;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.1s;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .submit-btn:hover {
            background-color: #219150;
        }

        .submit-btn:active {
            transform: scale(0.98);
        }

        .submit-btn i {
            margin-left: 10px;
        }

        .msg {
            text-align: center;
            margin-top: 20px;
            font-weight: 600;
            padding: 10px;
            border-radius: 5px;
        }

        /* Responsive Adjustments */
        @media (max-width: 600px) {
            .employee-form {
                padding: 20px;
            }
            .main-wrapper {
                margin: 10px auto;
            }
            .header-section {
                flex-direction: column;
                gap: 10px;
                text-align: center;
            }
        }
    </style>
    <script type="text/javascript">

        function calculateNetSalary() {
            var basic = parseFloat(document.getElementById('<%= txtBasicSalary.ClientID %>').value) || 0;
            var bonus = parseFloat(document.getElementById('<%= txtBonus.ClientID %>').value) || 0;
            var totalDays = parseFloat(document.getElementById('<%= txtTotalDays.ClientID %>').value) || 0;
            var presentDays = parseFloat(document.getElementById('<%= txtPresentDays.ClientID %>').value) || 0;

            var deduction = 0;
            if (totalDays > 0 && presentDays <= totalDays) {
                var perDaySalary = basic / totalDays;
                var absentDays = totalDays - presentDays;
                deduction = absentDays * perDaySalary;
                document.getElementById('<%= txtDeduction.ClientID %>').value = deduction.toFixed(2);
            }

            var net = basic + bonus - deduction;
            document.getElementById('<%= txtNetSalary.ClientID %>').value = net.toFixed(2);
        }
    </script></head><body>
    <form id="form1" runat="server">
        <div class="main-wrapper">
            <div class="header-section">
                <div>
                    <h2>Add Employee</h2>
                    <div class="small">Add new employee and salary details</div>
                </div>
                <div>
                    <a class="back-btn" href="Default.aspx"><span class="material-icons">arrow_back</span> Back to Dashboard</a>
                </div>
            </div>

            <div class="employee-form">
                <div class="form-section">
                    <div class="section-title"><i class="material-icons">person</i> Employee Details</div>
                    <div class="row">
                        <div class="col">
                            <div class="input-group">
                                <label class="input-label">Employee Name</label>
                                <div class="input-wrapper">
                                    <i class="material-icons">badge</i>
                                    <asp:TextBox ID="txtEmpName" runat="server" CssClass="input-field"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-group">
                                <label class="input-label">Department</label>
                                <div class="input-wrapper">
                                    <i class="material-icons">apartment</i>
                                    <asp:TextBox ID="txtDepartment" runat="server" CssClass="input-field"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-group">
                                <label class="input-label">Designation</label>
                                <div class="input-wrapper">
                                    <i class="material-icons">work</i>
                                    <asp:TextBox ID="txtDesignation" runat="server" CssClass="input-field"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <div class="section-title"><i class="material-icons">attach_money</i> Salary Details</div>
                    <div class="row">
                        <div class="col">
                            <div class="input-group">
                                <label class="input-label">Basic Salary</label>
                                <div class="input-wrapper">
                                    <i class="material-icons">payments</i>
                                    <asp:TextBox ID="txtBasicSalary" runat="server" CssClass="input-field" oninput="calculateNetSalary()"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="col">
                            <div class="input-group">
                                <label class="input-label">Bonus</label>
                                <div class="input-wrapper">
                                    <i class="material-icons">card_giftcard</i>
                                    <asp:TextBox ID="txtBonus" runat="server" CssClass="input-field" oninput="calculateNetSalary()"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="col">
                            <div class="input-group">
                                <label class="input-label">Total Working Days</label>
                                <div class="input-wrapper">
                                    <i class="material-icons">calendar_today</i>
                                    <asp:TextBox ID="txtTotalDays" runat="server" CssClass="input-field" oninput="calculateNetSalary()"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="col">
                            <div class="input-group">
                                <label class="input-label">Present Days</label>
                                <div class="input-wrapper">
                                    <i class="material-icons">check_circle</i>
                                    <asp:TextBox ID="txtPresentDays" runat="server" CssClass="input-field" oninput="calculateNetSalary()"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="col">
                            <div class="input-group">
                                <label class="input-label">Deduction</label>
                                <div class="input-wrapper">
                                    <i class="material-icons">remove_circle</i>
                                    <asp:TextBox ID="txtDeduction" runat="server" CssClass="input-field readonly-field" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="col">
                            <div class="input-group">
                                <label class="input-label">Net Salary</label>
                                <div class="input-wrapper">
                                    <i class="material-icons">trending_up</i>
                                    <asp:TextBox ID="txtNetSalary" runat="server" CssClass="input-field readonly-field" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <asp:Button ID="btnSave" runat="server" Text="Save Employee" OnClick="btnSave_Click" CssClass="submit-btn" />

                <asp:Label ID="lblMsg" runat="server" ForeColor="Green" CssClass="msg"></asp:Label>
            </div>
        </div>
    </form></body></html>
