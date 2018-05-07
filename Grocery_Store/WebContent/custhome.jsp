
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="utility.*"%>
<%@page import="java.sql.*;"%>


<head>
<title>Insert title here</title>
<%
	String search = request.getParameter("search");
	Connection con = DBManager.connect();
	Statement stmt = con.prepareStatement("select * from product ", ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	ResultSet rs = stmt.executeQuery("select * from product where (pname='" + search + "')");
	int size = 0;
	if (rs.next()) {
		rs.beforeFirst();
%>
</head>
<body>
	<jsp:include page="info.jsp"></jsp:include>
	<jsp:include page="ProductSearch.jsp"></jsp:include>
	<div class="wrap">
		<div class="fleft">
			<table>
				<%
					while (rs.next()) {
				%>
				<tr>
					<th>Product</th>
					<th>Type</th>
					<th>Add to Cart</th>
				</tr>

				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>

					<td><a
						href="addToCartForm.jsp?pname=<%=rs.getString(1)%>&type=<%=rs.getString(2)%>">Add
							to cart</a></td>
				</tr>
				<%
					}
				%>

			</table>
			<%
				} else {
					%>
					<jsp:include page="info.jsp"></jsp:include>
					<jsp:include page="ProductSearch.jsp"></jsp:include>
					<%
					//response.sendRedirect("NoProduct.jsp"); 
					out.print("Product does not EXIST. Houston we reached Mars!!!");
				}
			%>
		</div>

		<div class="fright"><jsp:include page="cart.jsp"></jsp:include></div>
	</div>


</body>
</html>