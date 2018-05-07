
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="utility.*"%>
<%@page import="java.sql.*;"%>
<%  
String originalname = request.getParameter("name");
String state = request.getParameter("state");
int price = Integer.parseInt(request.getParameter("price"));
int size = Integer.parseInt(request.getParameter("size"));
System.out.println(price);
System.out.println(state);
System.out.println(originalname);

System.out.println(size);

Connection con = DBManager.connect();
Statement stmt = con.createStatement();
 stmt.executeUpdate("update product set psize='"+size+"' where pname='"+originalname+"'");

 stmt.executeUpdate("update sale set price='"+price+"' where state = '"+state+"' and pname='"+originalname+"'");
response.sendRedirect("Home.jsp");  
%>  
</html>