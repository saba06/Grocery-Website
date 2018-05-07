<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@page import="utility.*"%>
<%@page import="java.sql.*;"%>
<title>Insert title here</title>
</head>
<body>
<%
		int id= Integer.parseInt(request.getParameter("id"));
		String name = (String) session.getAttribute("name_info");
		Connection con = DBManager.connect();
		Statement stmt = con.createStatement();
	
	
	%>
	
<h1>Edit CARD</h1>
	<form action="editcard.jsp" method="post">
		<input type="hidden" name="name" value="<%=name%>" />
		<input type="hidden" name="originalid" value="<%=id%>" />
		<table>
		
			<tr>
				<td>Name:</td>
				<td><%=name%></td>
			</tr>
			
			<tr>
				<td>Card Id</td>
				<td><input type="text" name="idnew" value="<%=id%>" /></td>
			</tr>
		
			<tr>
				<td colspan="2"><input type="submit" value="Save Card" /></td>
			</tr>
			</table>
	</form>

</body>
</html>