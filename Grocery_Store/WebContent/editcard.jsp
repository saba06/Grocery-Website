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

<%  
int idnew= Integer.parseInt(request.getParameter("idnew"));
int id= Integer.parseInt(request.getParameter("originalid"));
String name = request.getParameter("name");

Connection con = DBManager.connect();
Statement stmt = con.createStatement();

stmt.executeUpdate("INSERT INTO card (id) VALUES ("+idnew+")");
int i = stmt.executeUpdate("update owns set id="+idnew+" where id = "+id+" and customer_name='"+name+"'");
response.sendRedirect("cust_home.jsp");
  
%>

</body>
</html>