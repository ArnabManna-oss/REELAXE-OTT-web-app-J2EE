package org.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.ast.UnionTypeReference;
import org.missc.connectionProvider;

@WebServlet("/valid")
public class valid extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String str=(String)session.getAttribute("EMAIL");
		String su=req.getParameter("subs");
		int ss=Integer.parseInt(su);
		
		
		
		 Calendar calendar = Calendar.getInstance();
		 Date currentDate = new Date();
         calendar.setTime(currentDate); // Get the current date
         java.sql.Date today = new java.sql.Date(calendar.getTime().getTime());
         java.sql.Date end;
         if(ss==1) {
         calendar.add(Calendar.MONTH, 6); // Add 6 months
          end = new java.sql.Date(calendar.getTime().getTime());
         }
         else {
         calendar.add(Calendar.MONTH, 12); // Add 12 months
          end = new java.sql.Date(calendar.getTime().getTime());
         }
         
         
         System.out.println("uemail="+str+"   start date="+today+"   end date="+end);
         Connection con;
 		PreparedStatement ps;
 		int rs;
         
 		try {
 		    con = connectionProvider.createC();
 		    ps = con.prepareStatement("update user set subStrt=?, subEnd=? where uemail=?");
 		    ps.setDate(1, today);
 		    ps.setDate(2, end);
 		    ps.setString(3, str);
 		    int rowsUpdated = ps.executeUpdate(); // Use executeUpdate instead of executeQuery

 		    if (rowsUpdated > 0) {
 		    	res.sendRedirect("home.jsp");
 		    } else {
 		        System.out.println("No rows were updated in the database.");
 		    }
 		} catch (Exception e) {
 		    e.printStackTrace();
 		}
         
         
		
	    
	    
	}

}
