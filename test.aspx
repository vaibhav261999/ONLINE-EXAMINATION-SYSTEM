<%@ Page Language="VB" AutoEventWireup="false" CodeFile="test.aspx.vb" Inherits="test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;
        <asp:Button ID="Button1" runat="server" Style="z-index: 100; left: 702px; position: absolute;
            top: 122px" Text="submit" />
        <asp:TextBox ID="TextBox1" runat="server" Style="z-index: 101; left: 519px; position: absolute;
            top: 125px"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" BackColor="White" Font-Bold="True" ForeColor="Tomato" style="z-index: 102; left: 436px; position: absolute; top: 130px">Name</asp:Label>
        <asp:Label ID="Label2" runat="server" Style="z-index: 104; left: 452px; position: absolute;
            top: 39px"></asp:Label>
    </div>
    </form>
</body>
</html>
