<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Video List</title>
<style>
/* Style the table */
        table {
            width: 78%;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
        }

        /* Style the table header */
        th {
            background-color: #f2f2f2;
        }

        /* Style table rows */
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* Style table cells */
        td, th {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        /* Add hover effect on table rows */
        tr:hover {
            background-color: #ddd;
        }
</style>
</head>
<body>
	<%
	Connection con;
	PreparedStatement ps,ps1;
	ResultSet rs,rs1;
	try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ott1","root","1234");
	ps=con.prepareStatement("select vid, title, category from video");
	rs=ps.executeQuery();
	%><table><caption>AVAILABLE Video LIST</caption><%
	%><tr>
			<th>Video Id</th>
			<th>Title</th>
			<th>Category</th>
			<th>Action</th>
			<%
	
	while(rs.next()){
		out.println("<tr><td> "+rs.getString(1));out.print("</td>");
		out.println("<td> "+rs.getString(2));out.print("</td>");
		out.println("<td> "+rs.getString(3));out.print("</td>");
		
		%><td><a  href="Delete.jsp?vid=<%=rs.getString(1)%>"><button>remove</button></a>
		</tr><%
		
		
	}
	out.print("</table>");
	
	
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}%>
</body>
</html>