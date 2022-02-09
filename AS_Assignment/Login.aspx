<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AS_Assignment.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SITConnect Login</title>

        <script src="https://www.google.com/recaptcha/api.js?render=6LdgXGUeAAAAAE_3aV_y4g6l10m1OOBkm7PIPxF2"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <fieldset>
                <legend>Login</legend>
                <p>Username/Email: <asp:TextBox ID="tb_userid" runat="server" Height="25px" Width="137px" /></p>
                <p>Password: <asp:TextBox ID="tb_pwd" runat="server" Height="25px" Width="137px" TextMode="Password" /></p>
                <p><asp:Button ID="btnSubmit" runat="server" Text="Login" Height="27px" Width="133px" OnClick="LoginMe"/></p>
                <br />
                <br />
                    <input type="hidden" id="g-recaptcha-response" name="g-recaptcha-response"/>

                    <asp:Label ID="lblMessage" runat="server" Visible="false">Error message here (lblMessage)</asp:Label>
              
            </fieldset>
        </div>
    </form>
    <script>
        grecaptcha.ready(function () {
            grecaptcha.execute("6LdgXGUeAAAAAE_3aV_y4g6l10m1OOBkm7PIPxF2", { action: "Login" }).then(function (token) {
                document.getElementById("g-recaptcha-response").value = token;
            });
        });
    </script>
</body>
</html>
