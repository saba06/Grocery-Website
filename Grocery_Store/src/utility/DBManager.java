package utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBManager {
	public static Connection connect()
	{
	
		try{Class.forName("oracle.jdbc.driver.OracleDriver");  
		  
		//step2 create  the connection object  
		Connection con=DriverManager.getConnection(  
		"jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","kkolhatkar","infy123"); 
		return con;
			
		}
		catch(Exception e){
			return null;
			
		}
	}

	public static boolean close(Connection c)
	{
		try{
			c.close();
			return true;
		}catch(Exception e)
		{
			return false;
		}

	
}
}
