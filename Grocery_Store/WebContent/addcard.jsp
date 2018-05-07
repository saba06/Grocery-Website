<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String name = (String) session.getAttribute("name_info"); %>>
<h1>Add New Product</h1>
	<form action="cardAdded.jsp" method="post">
		<table>
			<tr>
				<td>Customer</td>
				<td><%=name %></td>
			</tr>
			<tr>
				<td>Payment Address</td>
				<td><input type="text" name="address" /></td>
			</tr>
			<tr>
				<td>State Code</td>
				<td><input type="text" name="state" /></td>
			</tr>
			<tr>
				<td>Card No</td>
				<td><input type="text" name="number" /></td>
			</tr>
			
			
			<tr>
				<td colspan="2"><input type="submit" value="Add Card" /></td>
			</tr>
		</table>
	</form>
</body>
</html>