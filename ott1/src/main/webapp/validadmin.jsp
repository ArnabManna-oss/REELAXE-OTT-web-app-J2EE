<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<%
String a=request.getParameter("email");
String p=request.getParameter("pass");

if(a.equals("admin@gmail.com") && p.equals("1111")){
	RequestDispatcher rd=request.getRequestDispatcher("upload.jsp");
	rd.forward(request, response);
}
else{
	RequestDispatcher rd1=request.getRequestDispatcher("AdminLogin.jsp");
	rd1.forward(request, response);
}

%>
