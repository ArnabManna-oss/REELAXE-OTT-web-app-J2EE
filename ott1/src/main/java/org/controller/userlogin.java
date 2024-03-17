package org.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.modell.been.userbeen;
import org.modell.dao.isSUB;
import org.modell.dao.logindao;


@WebServlet("/userlogin")
public class userlogin extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String uemail=req.getParameter("uemail");
		String upass=req.getParameter("upass");
		
		userbeen ul=new userbeen();
		
		ul.setUemail(uemail);
		ul.setUpass(upass);
		
		HttpSession session=req.getSession();
		
		PrintWriter p=res.getWriter();
		logindao l=new logindao();
		
		isSUB s=new isSUB();
		
		
		if(l.check(ul)) {
			
			
			session.setAttribute("EMAIL", uemail);
			s.isOver(ul);
			if(s.hasSubscription(ul))
			{
			res.sendRedirect("home.jsp");
			}
			else {
				res.sendRedirect("subscribe.jsp");
			}
			
		}
		else {
			res.sendRedirect("login.jsp?msg=invalid");
		}
				
	}

}
