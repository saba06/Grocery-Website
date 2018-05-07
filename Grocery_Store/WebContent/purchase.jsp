<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><%@page import="utility.*"%>
<%@page import="java.sql.*,java.util.Date,java.util.*, java.text.SimpleDateFormat;"%><script>
	function lessBalance() {
		alert("Insufficient Balance");
	}
</script>
<%	


	String name = (String) session.getAttribute("name_info");
	int total = Integer.parseInt(request.getParameter("total"));
	int balance = Integer.parseInt(request.getParameter("balance"));
	Connection con = DBManager.connect();
	Statement stmt = con.createStatement();

	if (balance < total) {
		response.sendRedirect("lowBalance.jsp");

	}else{
		String s = "select * from cart join sale on sale.PNAME= cart.PNAME and sale.STATE=( select state from address join owns on owns.ADDRESS = address.ADDRESS where address_type ='delivery' and owns.CUSTOMER_NAME='"+name+"') join owns on cart.CUSTOMER_NAME = owns.CUSTOMER_NAME where owns.ID = (select id from address 	join owns on owns.ADDRESS = address.ADDRESS where address_type ='delivery' and owns.CUSTOMER_NAME='"+name+"')";
		//System.out.println(s);
		List l = new ArrayList();
		int	c =0;
	
		
		ResultSet rs = stmt.executeQuery(s);
			while(rs.next()){
				c++;
			l.add("INSERT INTO customer_order (id,pname,quantity,issue_date,status) VALUES ("+rs.getInt(9)+",'"+ rs.getString(1)+"','"+rs.getInt(3)+"', CURRENT_TIMESTAMP,'issued')");
			}
			for (int i = 0; i < c; i++) {
				stmt.executeUpdate(l.get(i).toString());
				Thread.sleep(2000);
			}
		Thread.sleep(2000);
		stmt.executeUpdate("update customer set current_balance_due="+(balance-total)+" where customer_name='"+name+"'");

		String delete = "delete from cart where customer_name = '"+name+"' ";
		stmt.execute(delete);
		
		con.close();
		response.sendRedirect("PurchaseFinish.jsp");
	}
	
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>

</body>
</html>