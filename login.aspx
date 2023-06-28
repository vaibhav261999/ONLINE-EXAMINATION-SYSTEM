<%@ Import namespace="ADODB" %>
<script language="VB" runat="Server">
Dim frmpass As String
Dim frmname As String

Dim con As ADODB.Connection
Dim strcon As String
Dim rsCheckUser As ADODB.Recordset
Dim strSQL As String
Dim strUserName As Object


</script>
<%frmname = Request.Form.Item("uname")
frmpass = Request.Form.Item("upass")
session("uid") = frmname

con = New ADODB.Connection
strcon = "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("users.mdb")
con.Open(strcon)
rsCheckUser = New ADODB.Recordset
strSQL = "SELECT usersid.upass FROM usersid WHERE usersid.uname ='" & frmname & "'"
rsCheckUser.Open(strSQL, strcon)

If Not rsCheckUser.EOF Then
	
	If (frmpass = IIF(IsDBNull(rsCheckUser.Fields.Item("upass").Value), Nothing, rsCheckUser.Fields.Item("upass").Value)) Then
		Response.Redirect("quiz.aspx")
	End If
End If

Response.Write(("Invalid Username and Password"))

%>
<html>
<body>
<br><br><b>
</body>
</html>


