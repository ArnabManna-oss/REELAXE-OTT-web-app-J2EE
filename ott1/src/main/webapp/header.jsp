<%@page import="org.apache.catalina.webresources.Cache"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
    <%String str=(String)session.getAttribute("EMAIL");
    //str=(str==null)?"":str;
    if(str==null)
    {
    	response.sendRedirect("login.jsp");
    }
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>REELAX</title>
<link rel="icon" href="images\reelaxe.png" type="image/x-icon">
<style>
body {
    background: url(https://wallpaperaccess.com/full/396538.jpg);
    background-size: cover;
}

* {
    padding: 0;
    margin: 0;
    font-family: monospace;
}

ul {

	padding: 0px;
    margin: -4px;
    font-family: monospace;
    padding-bottom: 0px;
    padding-top: 6px;
    list-style: none;
    background: rgb(202 51 113 / 23%); /* Transparent background color with some opacity */
}

ul li {
    display: inline-block;
    position: relative;
}

ul li a {
    display: block;
    padding: 24px 28px;
    color: #FFF;
    text-decoration: none;
    text-align: center;
    font-size: 20px;
    padding-bottom: 37px;
}

ul li ul.dropdown li {
    display: block;
}

ul li ul.dropdown {
    width: 100%;
    background: rgb(202 51 113 / 23%); /* Transparent background color with some opacity */
    position: absolute;
    z-index: 999;
    display: none;
    margin-left: 0px;
}

ul li a:hover {
    background: rgb(202 51 113 / 23%); /* Hover color with some opacity */
}

ul li:hover ul.dropdown {
    display: block;
}

.srcbar {
    height: 38px;
    width: 523px;
    border-radius: 25px;
    background-color: rgb(201 193 196 / 52%);
   
}

button {
    height: 38px;
    width: 90px;
    border-radius: 25px;
    color: white;
    background-color: rgb(215 25 81 / 86%);
}

.spair {
       padding-left: 81px;
}

.lgt {
    padding-right: 50px; /* Added padding */
}

.nme {
    padding-left: 50px;
    color: white;
    font-size: larger;
}

/* Added styles for the logo */
.logo {
    width: 88px;
    height: auto;
    vertical-align: middle;
    margin-right: 10px;
    margin-left: 34px;
 /* Add some spacing between the logo and HOME */
}
</style>

</head>
<body>
	<ul>
	<li><img class="logo" src="images/reelaxe.png" alt="Logo"></li>
	<li><a href="home.jsp">HOME</a></li>
	<li><a href="#">Categories</a>
	<%
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ott1","root","1234");
		String sql="Select distinct category from video";
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		out.print("<ul class=\"dropdown\">");
		while(rs.next())
		{
			String category=rs.getString(1);
			out.print("<li><a href=\"display.jsp?cat="+category+"\">"+category+"</a></li>");
		}
		out.print("</ul>");
	}
	catch(Exception e)
	{
			e.printStackTrace();
	}
		%>
		</li>
		<li>
		<form class="spair" action="search.jsp" method="post">
				<input class="srcbar" type="text" name="search">
				<button type="submit" value="submit" >Search</button>
			</form>
		</li>
		<li class="nme"><%=str %></li>
		<li class="lgt"><a href="Logout.jsp">LOG OUT</a></li>
		
	</ul>

</body>
</html>
