<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="utility.*"%>
<%@page import="java.sql.*;"%>

<html>
<link href="home.css" rel="stylesheet" type="text/css">
<head>
<title>Customer Home</title>

</head>
<body>
	<jsp:include page="info.jsp"></jsp:include>
	<jsp:include page="ProductSearch.jsp"></jsp:include>		
			
	<div class="wrap">
    <div class="fleft">
			</div>
 
    <div class="fright"><jsp:include page="cart.jsp"></jsp:include></div>
</div>
			
			
			
	
		
</body>
</html>