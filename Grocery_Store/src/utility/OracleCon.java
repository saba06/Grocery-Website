package utility;

import java.sql.*;  
class OracleCon{  
public static void main(String args[]){  
try{  
//step1 load the driver class  
Class.forName("oracle.jdbc.driver.OracleDriver");  
  
//step2 create  the connection object  
Connection con=DriverManager.getConnection(  
"jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","kkolhatkar","infy123");  
  
//step3 create the statement object  
//Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE);  
Statement stmt = con.prepareStatement("select * from customer", ResultSet.TYPE_SCROLL_SENSITIVE,
	    ResultSet.CONCUR_READ_ONLY);
  
//step4 execute query  
String name = "bhargav";
String pass = "infy";
String role = "C";
ResultSet rs=stmt.executeQuery("select * from customer where customer_name='"+name+"'");
if(!rs.next()){
	System.out.println("sdjf");
}else{
	rs.beforeFirst();
	while(rs.next()){
	System.out.println(rs.getString(1)+"  "+rs.getInt(2)); 
}
 
}
//step5 close the connection object  
con.close();  
  
}catch(Exception e){ System.out.println(e);}  
  
}  
}  