
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
		String name = request.getParameter("pname");
		Connection con = DBManager.connect();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from product,sale where sale.pname='"+name+"' and  product.PNAME='"+name+"'");
			
		String ptype ="";
		String state ="";
		int size = 0;
		int price = 0;
		
		
	//	ProductBean pb = ProductService.getRecordById(name);
	
	%>
	
	<h1>Edit Form</h1>
	
		<table>
		<tr>
		<th>Product Name:</th>
		<th>Product Type:</th>
		<th>State</th>
		<th>Product Size</th>
		<th>Price</th>
		</tr>
			<%
			while (rs.next()) { 
	//	size = rs.getInt(3);
		//price= rs.getInt(6);
		 %>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(4)%></td>
				<td><input type="text" name="size" value="<%=rs.getInt(3)%>" /></td>
				<td><input type="text" name="price" value="<%=rs.getInt(6)%>" /></td>
				<td><a href="editProduct.jsp?name=<%=rs.getString(1)%>&price=<%=rs.getInt(6)%>&size=<%=rs.getInt(3)%>&state=<%=rs.getString(4)%>">Edit</a></td>
			</tr>
		<%} %>
		
			</table>
	

</body>
</html>
