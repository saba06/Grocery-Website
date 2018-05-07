
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="utility.*"%>
<%@page import="java.sql.*;"%>
<%

Connection con = DBManager.connect();
Statement stmt = con.createStatement();

String cname = (String) session.getAttribute("name_info"); 
String address = request.getParameter("address");
String state= request.getParameter("state");
String number = request.getParameter("number");

stmt.execute("INSERT INTO address (address, state, address_type) VALUES ('"+address+"', '"+state+"', 'payment')");
stmt.executeUpdate("INSERT INTO card (id) VALUES ("+number+")");

stmt.execute("INSERT INTO owns (customer_name, address, id) VALUES ('"+cname+"', '"+address+"', "+number+")");

response.sendRedirect("cust_home.jsp");  
%>  
<head></head>
<body></body>
</html>
