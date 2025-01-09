<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MiniProject.aspx.cs" Inherits="Soil.MiniProject" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
       <title>Bank Management System</title>
     <link href="App_Themes/StyleSheet1.css" rel="stylesheet" type="text/css" /> 
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Bank Management System</h1> 

            <div class="form-section">
                <h2>Insert Customer</h2>
                <label>Account Number: </label>
                <asp:TextBox ID="txtAccountNumber" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAccountNumber" runat="server" ControlToValidate="txtAccountNumber" ErrorMessage="Account Number is required" ForeColor="Red" ValidationGroup="InsertCustomer" /><br />

                <label>Customer Name: </label>
                <asp:TextBox ID="txtCustomerName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCustomerName" runat="server" ControlToValidate="txtCustomerName" ErrorMessage="Customer Name is required" ForeColor="Red" ValidationGroup="InsertCustomer" /><br />

                <label>Initial Bank Balance: </label>
                <asp:TextBox ID="txtBankBalance" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvBankBalance" runat="server" ControlToValidate="txtBankBalance" ErrorMessage="Initial Bank Balance is required" ForeColor="Red" ValidationGroup="InsertCustomer" /><br />

                <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" ValidationGroup="InsertCustomer" />
            </div>

            <div class="form-section">
                <h2>Update Customer Name</h2>
                <label>Select Account Number: </label>
                <asp:DropDownList ID="ddlAccountNumberUpdate" runat="server"></asp:DropDownList><br />

                <label>New Customer Name: </label>
                <asp:TextBox ID="txtNewCustomerName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNewCustomerName" runat="server" ControlToValidate="txtNewCustomerName" ErrorMessage="New Customer Name is required" ForeColor="Red" ValidationGroup="UpdateCustomer" /><br />

                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" ValidationGroup="UpdateCustomer" />
            </div>

            <div class="form-section">
                <h2>Deposit/Withdraw</h2>
                <label>Select Account Number: </label>
                <asp:DropDownList ID="ddlAccountNumber" runat="server"></asp:DropDownList><br />

                <label>Amount: </label>
                <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAmount" runat="server" ControlToValidate="txtAmount" ErrorMessage="Amount is required" ForeColor="Red" ValidationGroup="DepositWithdraw" /><br />

                <asp:Button ID="btnDeposit" runat="server" Text="Deposit" OnClick="btnDeposit_Click" ValidationGroup="DepositWithdraw" />
                <asp:Button ID="btnWithdraw" runat="server" Text="Withdraw" OnClick="btnWithdraw_Click" ValidationGroup="DepositWithdraw" />
            </div>

            <div class="form-section">
                <h2>Delete Customer</h2>
                <label>Select Account Number: </label>
                <asp:DropDownList ID="ddlAccountNumberDelete" runat="server"></asp:DropDownList><br />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" ValidationGroup="DeleteCustomer" />
            </div>

            <div class="form-section">
                <h2>All Customers</h2>
                <asp:Button ID="btnDisplayAll" runat="server" Text="Display All" OnClick="btnDisplayAll_Click" /><br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True"></asp:GridView>
            </div>

            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Please fix the following errors:" />
            <asp:Label ID="lblMessage" runat="server" CssClass="success-message" Visible="false"></asp:Label>
            <asp:Label ID="lblErrorMessage" runat="server" CssClass="error-message" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
