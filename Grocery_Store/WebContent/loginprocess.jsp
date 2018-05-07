
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="utility.*"%>
<%@page import="java.sql.*;"%>
<%
	String name = request.getParameter("email");
	String pass = request.getParameter("password");
	String role = request.getParameter("role");

	Connection con = DBManager.connect();
	Statement stmt = con.createStatement();
	
	String p ="";
	String r = "";
	String u = "";
	ResultSet rs = stmt.executeQuery("select * from login where (username = '"+name+"' and password ='"+pass+"' and role = '"+role+"')");
while(rs.next()){
	u=rs.getString(1);
	p=rs.getString(2);
	r=rs.getString(3);
}
	
	session.setAttribute("session", "TRUE");
	session.setAttribute("name_info", name);
	session.setAttribute("role_info", role);
	if (u.equals(name) && role.equals("C") && pass.equals(p)) {
		out.println("You have successfully logged in");
		session.setAttribute("session", "TRUE");
		session.setAttribute("info", name);
	%>
	<jsp:include page="cust_home.jsp"></jsp:include>
	<%
	} else if (u.equals(name) && role.equals("S") && pass.equals(p)){
		%>
		<jsp:include page="Home.jsp"></jsp:include>
		<%
	}else {
		out.print("Sorry, email or password error");
%>
<jsp:include page="index.jsp"></jsp:include>
<%
	}
%>
