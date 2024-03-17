package org.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.modell.been.userbeen;
import org.modell.dao.userdao;
import org.*;
/**
 * Servlet implementation class usereg
 */
@WebServlet("/usereg")
public class usereg extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String uid=req.getParameter("uid");
		String uname=req.getParameter("name");
		String uemail=req.getParameter("email");
		String uage=req.getParameter("birthday");
		String uphn=req.getParameter("phone");
		String ugender=req.getParameter("gender");
//		String subStrt=req.getParameter("uid");
//		String subEnd=req.getParameter("uid");
//		String SubAmt=req.getParameter("uid");
		String upass=req.getParameter("pass");
		
		userbeen u=new userbeen();
		u.setUid(uid);
		u.setUname(uname);
		u.setUemail(uemail);
		u.setUage(uage);
		u.setUphn(uphn);
		u.setUgender(ugender);
		u.setUpass(upass);
		
		userdao us=new userdao();
		int i=us.insert(u);
		
		if(i!=0) {
			res.sendRedirect("sign_up.jsp?status=valid");
		}
		else {
			res.sendRedirect("sign_up.jsp?status=invalid");
		}
	}

}
