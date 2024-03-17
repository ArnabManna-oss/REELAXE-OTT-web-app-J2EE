<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String vid=request.getParameter("vid");
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ott1","root","1234");
	PreparedStatement ps=con.prepareStatement("delete from video where vid='"+vid+"'");
	int i=ps.executeUpdate();
	RequestDispatcher rd=request.getRequestDispatcher("upload.jsp");
	rd.forward(request, response);
}
catch (Exception e) {
	e.printStackTrace();
	// TODO: handle exception
} %>
</body>
</html>