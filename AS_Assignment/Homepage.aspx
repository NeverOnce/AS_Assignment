<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="AS_Assignment.Homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SITConnect Homepage</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <fieldset>
                <legend>Homepage</legend>
                <br />

                <p>Email: <asp:Label ID="lbl_userid" runat="server" EnableViewState="false" /></p>
                <p>Name: <asp:Label ID="lbl_name" runat="server" EnableViewState="false" /></p>
                <p>Image: <asp:Label ID="lbl_image" runat="server" EnableViewState="false" /></p>

                <asp:Label ID="lblMessage" runat="server" EnableViewState="false" />
                <br />
                <br />

                <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="LogoutMe" Visible="false" />

                <p />
            </fieldset>
        </div>
    </form>
</body>
</html>
