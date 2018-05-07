
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="utility.*"%>
<%@page import="java.sql.*;"%>
<%
	String name = (String) session.getAttribute("name_info");
	Connection con = DBManager.connect();
	Statement stmt = con.createStatement();
%>
<script>
	function removeFunction() {
		alert("Removed from Cart");
	}
</script>

<center>
	<h2>CART</h2>
</center>

<br>

<%
	int total = 0;
	int price = 0;
	int quantity = 0;
	String pname = "";
	/* System.out.println(
			"select * from cart join sale on sale.PNAME= cart.PNAME and sale.STATE=( select state from address join owns on owns.ADDRESS = address.ADDRESS where address.ADDRESS_TYPE ='delivery' and ROWNUM = 1 and owns.CUSTOMER_NAME='"
					+ name + "' and address.ADDRESS in (select address FROM owns where owns.CUSTOMER_NAME='"
					+ name + "' ) )"); */

	ResultSet rs = stmt.executeQuery(
			"select * from cart join sale on sale.PNAME= cart.PNAME and sale.STATE=( select state from address join owns on owns.ADDRESS = address.ADDRESS where address.ADDRESS_TYPE ='delivery' and ROWNUM = 1 and owns.CUSTOMER_NAME='"
					+ name + "' and address.ADDRESS in (select address FROM owns where owns.CUSTOMER_NAME='"
					+ name + "' ) )");
%>
<table>
	<tr>
		<th>Product</th>
		<th>Quantity</th>
		<th>Price</th>
		<th>Remove</th>
	</tr>
	<%
		while (rs.next()) {
			pname = rs.getString(1);
			price = rs.getInt(6);
			quantity = rs.getInt(3);
			total += price * quantity;
	%>
	<tr>
		<td><%=pname%></td>
		<td><%=quantity%></td>
		<td><%=price%></td>
		<td><a onclick="removeFunction()"
			href="RemveFromCart.jsp?pname=<%=rs.getString(1)%>&name=<%=name%>">Remove
				from cart</a></td>

	</tr>

	<%
		}
	%>

</table>

<br><br>
<table>
	<tr>
		<td>Total:  </td><td/>
		<td><%=total%></td>
	</tr>
</table>
<%
	ResultSet rs1 = stmt
			.executeQuery("select current_balance_due from customer where customer_name='" + name + "'");
	int balance = 0;
	while (rs1.next()) {
		balance = rs1.getInt(1);
%>
<form action="purchase.jsp" method="post">
	<input type="hidden" name="total" value="<%=total%>" /> <input
		type="hidden" name="balance" value="<%=balance%>" />

	<center>
		<table>
			<tr>
				<td>Current Balance:</td>
				<td><%=balance%></td>
			</tr>
			<tr>

				<td><input type="submit" value="Purchase" /></td>
			</tr>
		</table>
	</center>
</form>
<%
	}
%>

</body>
</html>