package org.modell.dao;
import org.modell.been.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import org.missc.connectionProvider;


public class userdao {

	public int insert(userbeen u) {
		
		Connection con;
		PreparedStatement ps;
		int i=0;
		try {
			
			con=connectionProvider.createC();
			ps=con.prepareStatement("insert into user(uid, uname, uemail, uage, uphn, ugender, upass) values(?,?,?,?,?,?,?)");
			
			ps.setString(1, u.getUid());
			ps.setString(2, u.getUname());
			ps.setString(3, u.getUemail());
			ps.setString(4, u.getUage());
			ps.setString(5, u.getUphn());
			ps.setString(6, u.getUgender());
			ps.setString(7, u.getUpass());
			
			i=ps.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}
}
	
	
