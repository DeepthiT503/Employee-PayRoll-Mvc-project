<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeRegisterForms.aspx.cs" Inherits="EmployeePayRoll_WebForm.EmployeeRegisterForms" %>


<b<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
background: linear-gradient(to right, 
  #ffcccc, /* lightred */
  #ffd8b8, /* lightorange */
  #ffffcc, /* lightyellow */
  #ccffcc, /* lightgreen */
  /*/#cceeff,  lightblue */
  #4b0082, /* indigo */
  #ffcccc /* violet */
);
color: white;

        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <p style="margin-left: 280px; background-image: inherit; font-family: Arial; color: #FF9900; font-style: normal; font-size: x-large;">
                Enter Employee Details</p>
            <p style="margin-left: 280px">
                <asp:Label ID="Label1" runat="server" Font-Size="Medium" ForeColor="#CC0099" Text="Full Name"></asp:Label>
            </p>
            <p style="margin-left: 280px">
                <asp:TextBox ID="TextBox1" runat="server" BackColor="#CCFFFF" BorderStyle="Ridge"  Width="255px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="FullName is Required" ForeColor="#FF9966"></asp:RequiredFieldValidator>
&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Invalid Name Format" ForeColor="#009900" ValidationExpression="^[A-Za-z\s]+$"></asp:RegularExpressionValidator>
            </p>
            <p style="margin-left: 280px">
                <asp:Label ID="Label2" runat="server" ForeColor="#CC0099" Text="Select Image"></asp:Label>
            </p>
            <p style="margin-left: 280px">
                &nbsp;<asp:FileUpload ID="FileUpload1" runat="server" BackColor="#CCFFFF" BorderStyle="Ridge" ForeColor="#6600CC" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Select Image is Required " ForeColor="#FF9966"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;
                &nbsp;
                </p>
            <p style="margin-left: 280px">
                <asp:Label ID="Label7" runat="server" ForeColor="#CC0099" Text="Gender"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
            <p style="margin-left: 280px">
&nbsp;<asp:RadioButton ID="RadioButton8" runat="server" ForeColor="#9900CC" Text="Male" GroupName="Gender" OnCheckedChanged="rd1" />
&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="RadioButton6" runat="server" ForeColor="#9900FF" Text="Female" GroupName="Gender" OnCheckedChanged="rd2" />
&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="RadioButton7" runat="server" ForeColor="#9900CC" Text="Others" GroupName="Gender" OnCheckedChanged="rd3" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
            <p style="margin-left: 280px">
                <asp:Label ID="Label3" runat="server" ForeColor="#99CCFF" Text="Select Department"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </p>
         <asp:CheckBoxList ID="CheckBoxList1" runat="server" type="checkbox" name="CheckBoxList1" 
    BackColor="#CCFFFF" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" 
    ForeColor="#FF99FF" RepeatDirection="Horizontal" style="margin-left: 281px" Width="365px">
    <asp:ListItem Value="IT"></asp:ListItem>
    <asp:ListItem Value="Sales"></asp:ListItem>
    <asp:ListItem Value="HR"></asp:ListItem> 
    <asp:ListItem Value="Marketing"></asp:ListItem>
</asp:CheckBoxList>

<script>
    // Function to allow only one checkbox to be selected
    function allowOnlyOneCheckbox() {
        var checkBoxList = document.getElementById('<%= CheckBoxList1.ClientID %>');
        var checkBoxes = checkBoxList.getElementsByTagName('input');
        
        for (var i = 0; i < checkBoxes.length; i++) {
            checkBoxes[i].onclick = function () {
                // Uncheck all checkboxes except the one that was clicked
                for (var j = 0; j < checkBoxes.length; j++) {
                    if (checkBoxes[j] != this) {
                        checkBoxes[j].checked = false;
                    }
                }
            };
        }
    }

    // Call the function when the page loads
    window.onload = allowOnlyOneCheckbox;
</script>

<p style="margin-left: 280px">
</p>
 <p style="margin-left: 280px">
                <asp:Label ID="Label4" runat="server" ForeColor="#CC0099" Text="Salary"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
            <p style="margin-left: 280px">
                <asp:TextBox ID="TextBox2" runat="server" BackColor="#CCFFFF" BorderStyle="Ridge" Width="250px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2" ErrorMessage="Salary is Required" ForeColor="#FF9966" Display="Dynamic"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="Invalid NumberFormat" ForeColor="#009900" ValidationExpression="^\d+(\.\d{1,2})?$" Display="Dynamic"></asp:RegularExpressionValidator>
            &nbsp;
                <asp:CompareValidator ID="CompareValidatorSalary" runat="server" ErrorMessage="give valid salary"
                    ControlToValidate="TextBox2" Operator="DataTypeCheck" Type="Double"
                    ></asp:CompareValidator>
            </p>
            <p style="margin-left: 280px">
                <asp:Label ID="Label5" runat="server" ForeColor="#CC0099" Text="Start Date"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
            <p style="margin-left: 280px">
                <asp:TextBox ID="TextBox5" runat="server" type="date" Width="253px" BackColor="#CCFFFF" BorderStyle="Ridge" ForeColor="#6600CC"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="Start Date is Required" ForeColor="#FF9966"></asp:RequiredFieldValidator>
            </p>
            <p style="margin-left: 280px">
                <asp:Label ID="Label6" runat="server" ForeColor="#CC0099" Text="Notes"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
            <p style="margin-left: 280px">
                <asp:TextBox ID="TextBox4" runat="server" BackColor="#CCFFFF" BorderStyle="Ridge" Width="240px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox4" ErrorMessage="Notes Is Required" ForeColor="#FF9966"></asp:RequiredFieldValidator>
            </p>
            <p style="margin-left: 280px">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" BackColor="Maroon" ForeColor="#99CCFF" Text="Register" OnClick="Create" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
            <p style="margin-left: 280px">
                &nbsp;
                </p>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            <p style="margin-left: 280px">
                &nbsp;</p>
            <p style="margin-left: 280px">
                &nbsp;</p>
            <p style="margin-left: 280px">
                &nbsp;</p>
        </div>
</form>
</body>
</html>