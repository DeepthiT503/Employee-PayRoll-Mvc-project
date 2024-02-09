<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDetails.aspx.cs"  Inherits="EmployeePayRoll_WebForm.EmployeeDetails" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
background: linear-gradient( lightgreen, lightblue, pink);
color: white; 

        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
            <p style="font-family: Arial, Helvetica, sans-serif; font-style: italic; color: #008080; font-size: xx-large">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; ALL EMPLOYEE DETAILS&nbsp;</p>
            <p style="font-family: Arial, Helvetica, sans-serif; font-style: italic; color: #008080; font-size: xx-large">
                &nbsp;</p>
        <p style="font-family: Arial, Helvetica, sans-serif; font-style: italic; color: #008080; font-size: xx-large">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        </p>
            <p style="font-family: Arial, Helvetica, sans-serif; font-style: italic; color: #008080; font-size: xx-large">
            &nbsp;<asp:GridView ID="GridView1" runat="server" ForeColor="#FF0066" style="margin-left: 254px" Width="538px">
             <Columns>
     <asp:BoundField DataField="EmployeeId" HeaderText="Employee ID" />
       <asp:BoundField DataField="FullName" HeaderText="Full Name" />
     <asp:TemplateField HeaderText="Image">
         <ItemTemplate>
             <asp:Image ID="imgEmployee" runat="server" ImageUrl='<%# Eval("ImagePath") %>' Height="65px" Width="65px" />

         </ItemTemplate>

     </asp:TemplateField>
     <asp:BoundField DataField="Gender" HeaderText="Gender" />
    <asp:BoundField DataField="Department" HeaderText="Department" />
    <asp:BoundField DataField="Salary" HeaderText="Salary" />
    <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:MM/dd/yyyy}" />
    <asp:BoundField DataField="Notes" HeaderText="Notes" />

 </Columns>
   </asp:GridView>
            
        </p>
                    </form>
</body>
</html>

