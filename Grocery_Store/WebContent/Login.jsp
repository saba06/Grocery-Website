<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="utility.*"%>
<%@page import="java.sql.*;"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<%@ include file="index.jsp"%>
	<hr />

	<h3>Login Form</h3>

	<br />
	<form action="loginprocess.jsp" method="post">
		<table>
			<tr>
				<td>Name</td>
				<td><input type="text" name="email" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td>Role</td>
				<td><input type="radio" name="role" value="C">C<input
					type="radio" name="role" value="S">S</td>
			</tr>
			<tr>

				<td><input type="submit" value="login" /></td>
			</tr>

		</table>


		<br />

	</form>
</body>
</html>