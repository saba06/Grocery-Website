
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="utility.*"%>
<%@page import="java.sql.*;"%>
<head>
<title>Edit Form</title>
</head>
<body>

	<%
		String cust = (String) session.getAttribute("name_info");
		String name = request.getParameter("pname");
			
		String ptype =request.getParameter("type");
		//int size = Integer.parseInt(request.getParameter("size"));
		String q = request.getParameter("quantity");
	%>
	
	<h1>Add to cart</h1>

	<form action="addToCart.jsp" method="post">
		<input type="hidden" name="cust" value="<%=cust%>" />
		<table>
		
			<tr>
				<td>Product Name:</td>
				<td><input type="text" name="pname" value="<%=name%>"/></td>
			</tr>
			<tr>
				<td>Product Type:</td>
				<td><input type="text" name="ptype" value="<%=ptype%>"/></td>
			</tr>
			
			
			<tr>
				<td>Quantity</td>
				<td><input type="text" name="quantity"/></td>
			<tr>
				<td colspan="2"><input type="submit" value="Add to Cart" /></td>
			</tr>
			</table>
	</form>

</body>
</html>
