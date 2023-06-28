<%@ Import namespace="ADODB" %>
<script language="VB" runat="Server">
Dim cell As String
Dim con As ADODB.Connection
Dim uname As String
Dim lname As String
Dim v As Byte
Dim pass1 As String
Dim phone As String
Dim u As Byte
Dim strSQL As String
Dim rscheckuser As ADODB.Recordset
Dim mail As String
Dim fname As String
Dim mysql As String
Dim strCon As String


</script>
<%

uname = Trim(request.Form.Item("uname"))
pass1 = Trim(request.Form.Item("pass1"))
fname = Trim(request.Form.Item("fname"))
lname = Trim(request.Form.Item("lname"))
mail = Trim(request.Form.Item("mail"))
phone = Trim(request.Form.Item("phone"))
cell = Trim(request.Form.Item("cell"))

con = New ADODB.Connection
strCon = "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("users.mdb")
con.Open(strCon)

u = 1
If Len(uname) = 0 Or Len(pass1) = 0 Or Len(fname) = 0 Then
	response.Redirect("register.html")
	u = 0
End If
If Len(lname) = 0 Or Len(mail) = 0 Or Len(phone) = 0 Then
	response.Redirect("register.html")
	u = 0
End If
If Len(cell) = 0 Then
	cell = "None"
End If

If u > 0 Then
	v = 0
	rscheckuser = New ADODB.Recordset
	strSQL = "SELECT usersid.uname FROM usersid"
	rscheckuser.Open(strSQL, strCon)
	While Not rscheckuser.EOF
		If (uname = IIF(IsDBNull(rscheckuser.Fields.Item("uname").Value), Nothing, rscheckuser.Fields.Item("uname").Value)) Then
			v = 1
		End If
		rscheckuser.MoveNext()
	End While
	
	If (v > 0) Then
		
		response.Redirect(("err1.aspx"))
	Else
		mysql = "insert into uinfo(uname,fname,lname,email,phone,cell) values ('" & uname & "','" & fname & "','" & lname & "','" & mail & "','" & phone & "','" & cell & "')"
		con.execute(mysql)
		mysql = "insert into usersid(uname,upass) values ('" & uname & "','" & pass1 & "')"
		con.execute(mysql)
		response.Write("<center><font size=+2 color='blue'>Thank you for Registering!</font></center>")
	End If
	
End If
%>
<html>
<body>
<a href="index.htm">Click Here</a> to log in.
</body>
</html>


