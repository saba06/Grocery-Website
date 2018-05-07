
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="utility.*"%>
<%@page import="java.sql.*;"%>

<head>
<title>Delete</title>
</head>
<body>
	<%  
int id= Integer.parseInt(request.getParameter("id"));
Connection con = DBManager.connect();
Statement stmt = con.createStatement();
stmt.execute("delete from card where id='"+id+"'");



response.sendRedirect("cust_home.jsp");  
%>

</body>
</html>