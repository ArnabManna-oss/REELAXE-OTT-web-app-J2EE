package org.missc;

import java.sql.Connection;
import java.sql.DriverManager;

public class connectionProvider {

	static Connection con;
	
	 public static Connection createC() {
		 
		 
		 String url="jdbc:mysql://localhost:3306/ott1";
		 String uid="root";
		 String upass="1234";
		 try {
			 
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 con=DriverManager.getConnection(url,uid,upass);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	 return con;
	 }
}
