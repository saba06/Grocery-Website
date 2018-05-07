
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@page import="utility.*"%>
<%@page import="java.sql.*;"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	Connection con = DBManager.connect();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from product");

	request.setAttribute("product", rs);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
	<script>
		function myFunction() {
			alert("Product deleted");
		}
	</script>
	<jsp:include page="info.jsp"></jsp:include>
	<table border="1" width="90%">
		<tr>
			<th>name</th>
			<th>Type</th>
			<th>Size</th>
			<th>Edit</th>
			<th>Delete</th>

		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getInt(3)%></td>
			<td><a href="editform.jsp?pname=<%=rs.getString(1)%>">Edit</a></td>
			<td><a onclick="myFunction()"
				href="deletesProduct.jsp?pname=<%=rs.getString(1)%>">Delete</a></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>