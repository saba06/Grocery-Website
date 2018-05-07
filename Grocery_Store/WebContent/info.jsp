
<%@page import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="utility.*"%>
<%@page import="java.sql.*;"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<%	Connection con = DBManager.connect();
		Statement stmt = con.createStatement();
		String name = (String) session.getAttribute("name_info");
		String role = (String) session.getAttribute("role_info");
		if(role.equalsIgnoreCase("S")){
	//	Staff_MemberBean sb = Staff_MemberService.getRecordById(name);
			ResultSet rs = stmt.executeQuery("select * from staff_member where (staff_name='"+name+"')");
			
	%>
	<table>
	<tr>
			<th>Name</th>
			<th>Address</th>
			<th>Job Title</th>
		</tr>
	<%while (rs.next()) { %>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(4)%></td>
		</tr>
		<%
			}
		%>
		<tr>
			<td>
				<form method="link" action="addform.jsp">
					<input type="submit" value="Add Product" />
				</form>
			</td>
			<td><form method="link" action="logout.jsp">
					<input type="submit" value="Logout" />
				</form></td>
		</tr>
	</table>

	<%
		}
	
		else{
		//List<CardEntity> lc = 	CardService.getRecordByCustomer(name);
		ResultSet rs = stmt.executeQuery("select * from owns where (customer_name = '"+name+"' )");
		request.setAttribute("clc", rs);
	%>
	<table>
		<tr><td>
		Welcome Customer 
		</td>
		<td><h1><%=name %></h1></td>
			<td>
				<form method="link" action="logout.jsp">
					<input type="submit" value="Logout" />
				</form>
			</td>
			
	</tr>
	</table>
	<br>
	<table>
	
	<tr>
			<td><form method="link" action="addcard.jsp">
					<input type="submit" value="Add Card" />
				</form>
				
			</td>
		</tr>
	</table>
	<br>
	<table>
	
		<tr>
			<th>Card Number</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<%while (rs.next()) { %>
		<tr>
			<td><%=rs.getInt(3)%></td>
			<td><a href="editcardform.jsp?id=<%=rs.getInt(3)%>">Edit</a></td>
			<td><a href="deletecard.jsp?id=<%=rs.getInt(3)%>">Delete</a></td>
		</tr>
		<%
			}
		%>
	</table>
	<%		
		}
	%>
</body>
</html>