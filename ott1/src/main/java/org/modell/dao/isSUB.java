package org.modell.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import org.missc.connectionProvider;
import org.modell.been.userbeen;

public class isSUB {
	public boolean hasSubscription(userbeen u)
	{
		boolean status=false;
		Connection con;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con=connectionProvider.createC();
			ps=con.prepareStatement("select subStrt from user where uemail=?");
			ps.setString(1, u.getUemail());
			rs=ps.executeQuery();
			while(rs.next())
			{
				if(rs.getString(1) != null)
				{
					status=true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public void isOver(userbeen u)
	{
		Connection con;
		PreparedStatement ps,ps1;
		ResultSet rs;
		Date subEnd=new Date();
		Date currentDate = new Date(System.currentTimeMillis());
		try {
			con=connectionProvider.createC();
			ps=con.prepareStatement("select subEnd from user where uemail=?");
			ps.setString(1, u.getUemail());
			rs=ps.executeQuery();
			while(rs.next())
			{
				subEnd=rs.getDate(1);
			}
			if (currentDate.after(subEnd)) {
				ps1=con.prepareStatement("update user set subStrt=NULL, subEnd=NULL where uemail=?");
	 		    ps1.setString(1, u.getUemail());
	 		    int rowsUpdated = ps1.executeUpdate(); 
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
}
