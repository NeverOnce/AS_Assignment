<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="AS_Assignment.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SITConnect Registration</title>
    <style type="text/css">
        .auto-style1 {
            height: 46px;
        }
    </style>
</head>
<body>
        <form id="form1" runat="server">
    <div>
    
    <h2>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Account Registration"></asp:Label>
        <br />
        <br />
   </h2>
        <table class="style1">
            <tr>
                <td class="style3">
        <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tb_fname" runat="server" Height="36px" Width="280px">Jovan</asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_fname" ErrorMessage="Input your first name" EnableClientScript="true" SetFocusOnError="true" Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
        <asp:Label ID="Label7" runat="server" Text="Last Name"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tb_lname" runat="server" Height="36px" Width="280px">Choy</asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tb_lname" ErrorMessage="Input your last name" EnableClientScript="true" SetFocusOnError="true" Text="*" ></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
        <asp:Label ID="Label8" runat="server" Text="Email"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tb_email" runat="server" Height="36px" Width="280px">jovan@gmail.com</asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tb_email" ErrorMessage="Input your email" EnableClientScript="true" SetFocusOnError="true" Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
        <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tb_pwd" runat="server" Height="32px" Width="281px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tb_pwd" ErrorMessage="Input your password" EnableClientScript="true" SetFocusOnError="true" Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
                        <tr>
                <td class="style6">
        <asp:Label ID="Label5" runat="server" Text="Date Of Birth"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tb_birthdate" runat="server" Height="32px" Width="281px" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
                        <tr>
                <td class="auto-style1">
        <asp:Label ID="Label6" runat="server" Text="Credit Card Number"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tb_ccnum" runat="server" Height="32px" Width="281px" placeholder="1234 1234 1234 1234"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
        <asp:Label ID="Label4" runat="server" Text="Credit Card Expiry"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tb_ccexpiry" runat="server" Height="32px" Width="281px" placeholder="12/34"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
        <asp:Label ID="Label9" runat="server" Text="Credit Card CVV"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tb_cccvv" runat="server" Height="32px" Width="281px" placeholder="123"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="imageLabel" runat="server" Text="Upload Image"></asp:Label>
                    </td>
                <td class="auto-style1">
                    <asp:FileUpload ID="imageUpload" runat="server" Height="32px" Width="280px"/>
                </td>
            </tr>
                        <tr>
                <td class="style4">
       
                </td>
                <td class="auto-style1">
    <asp:Button ID="btn_Submit" runat="server" Height="48px" 
         Text="Submit" Width="288px" OnClick="btn_Submit_Click" />
                </td>
            </tr>
    </table>
&nbsp;<asp:ValidationSummary ID="ValidationSummary1" runat="server"  HeaderText="Following error occurs..." ShowMessagebox="false" DisplayMode="BulletList" ShowSummary="true" BackColor="Snow" Width="450" ForeColor="Red" Font-Size="X-Large" Font-Italic="true"/>
        <br />
        <asp:Label ID="lb_error1" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lb_error2" runat="server"></asp:Label>
    <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tb_pwd" ErrorMessage="Minimum 12 characters with at least 1 uppercase, 1 number and 1 special character" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&amp;])[A-Za-z\d$@$!%*?&amp;]{12,16}"></asp:RegularExpressionValidator>
        <br />
    
    </div>
    </form>
   </body>
</html>