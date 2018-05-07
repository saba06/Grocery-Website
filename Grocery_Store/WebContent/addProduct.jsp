
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="utility.*"%>
<%@page import="java.sql.*;"%>
<%


Connection con = DBManager.connect();
Statement stmt = con.createStatement();


String pname = request.getParameter("pname");
String type = request.getParameter("type");
String size = request.getParameter("size");

stmt.execute("INSERT INTO product (pname, ptype, psize) VALUES ('"+pname+"', '"+type+"', '"+size+"')");



response.sendRedirect("Home.jsp");  
%>  
<head></head>
<body></body>
</html>
