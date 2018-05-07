package utility;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {
public static void main(String[] args) {
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/YYYY HH:mm:ss");
	Date date = new Date();
	//System.out.println(dateFormat.format(date)); //2013/10/15 16:16:39
	System.out.println(java.sql.Date.valueOf(java.time.LocalDate.now()));
	for (int i = 0; i < args.length; i++) {
		
	}
	
}
}
