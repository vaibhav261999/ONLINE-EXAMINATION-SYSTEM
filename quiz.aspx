<%@ Page Language="VB" %>
<%@ Import namespace="ADODB" %>
<script language="VB" runat="Server">
Dim conn As ADODB.Connection
Dim rs As ADODB._Recordset
Dim strcon As String
Dim ch As String


</script>
<HTML>
<HEAD>
<title> ONLINE EXAMINATION</title>
</HEAD>
<BODY>
<center>

<%
If session("qno") > 10 Then
	session("qno") = ""
End If

If CStr(session("qno")) = "" Then
	session("qno") = 1
	session("cnt") = 0
Else
	conn = New ADODB.Connection
	strcon = "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("quizdet.mdb")
	conn.open(strcon)
	rs = conn.Execute("select * from quiz where qno=" & session("qno") & "")
	ch = Request.Form.Item("opt")
	If CShort(ch) = CShort(session("ans")) Then
		session("cnt") = session("cnt") + 1
	End If
	session("qno") = session("qno") + 1
End If
%>
</center>
<%
conn = New ADODB.Connection
strcon = "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("quizdet.mdb")
conn.open(strcon)
rs = conn.Execute("select * from quiz where qno=" & session("qno") & "")
%>
<html>
<head>
<title>score</title>
</head>
<body bgcolor="rgb:225">
<hr color="#0000ff">
<p align="center"><font color="white" size="20">ONLINE EXAMINATION</p></font>
<hr color="#0000ff">
<p align="center"><font color="white"><b>Instruction-Minimun 5 Marks and Maximum 10 Marks.Please do not Press Back  and Refress Button</b>

<!--<input type=text name=score size=6 value="<%=session("cnt")%>">-->
<hr color="#0000ff">

<form name=frmquiz method=post action="quiz.aspx">

<%
If Not rs.eof Then
	%>
<h3><b>Q<%=IIF(IsDBNull(rs.Fields.Item(0).Value), Nothing, rs.Fields.Item(0).Value) & ". " & IIF(IsDBNull(rs.Fields.Item(1).Value), Nothing, rs.Fields.Item(1).Value)%></b></td>
<br><br>
<input type="radio" value="1" checked name="opt"><font color="white">
<b><%=IIF(IsDBNull(rs.Fields.Item(2).Value), Nothing, rs.Fields.Item(2).Value)%>
<br>
<input type="radio" value="2" checked name="opt"><font color="white">
<b><%=IIF(IsDBNull(rs.Fields.Item(3).Value), Nothing, rs.Fields.Item(3).Value)%></b>
<br>
<input type="radio" value="3" checked name="opt"><font color="white">
<b><%=IIF(IsDBNull(rs.Fields.Item(4).Value), Nothing, rs.Fields.Item(4).Value)%></b>
<br>
<input type="radio" value="4" checked name="opt"><font color="white">
<b><%=IIF(IsDBNull(rs.Fields.Item(5).Value), Nothing, rs.Fields.Item(5).Value)%></b>
<br>

<p align="center"><input type="submit" value="submit" name="b1" style="background-color:#66ccff;border-style:solid:border-color:#0000ff"></p>
<%	
	session("ans") = IIF(IsDBNull(rs.Fields.Item(6).Value), Nothing, rs.Fields.Item(6).Value)
Else
	Response.Write(("<br><br><br><h3 align=center>Thank You</h3>"))%>

<center><h3>Marks Scored : <b><%=session("cnt")%> / 10</b></center>

<%	
	If session("cnt") > 4 Then
		Response.Write(("<h2 align=center>You haved Passed the exam.</h2>"))
	Else
		Response.Write(("<h2 align=center>You must atleast get 5 marks to pass the exam.</h2>"))
	End If
End If
%>

<hr color="#0000ff">
</form>
</BODY>
</HTML>














