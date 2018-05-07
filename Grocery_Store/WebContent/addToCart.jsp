
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="utility.*"%>
<%@page import="java.sql.*;"%>
<%  
String originalname = request.getParameter("cust");
String pname = request.getParameter("pname");
int q= Integer.parseInt(request.getParameter("quantity"));

Connection con = DBManager.connect();
Statement stmt = con.createStatement();
try{
int i = stmt.executeUpdate("INSERT INTO cart (pname, customer_name, quantity) VALUES ('"+pname+"', '"+originalname+"', '"+q+"')");
response.sendRedirect("addcartfinish.jsp");  
}catch(Exception e){
	response.sendRedirect("AlreadyExist.jsp"); 
}


%>  
</html>