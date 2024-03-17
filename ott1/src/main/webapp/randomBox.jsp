
<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%String str=(String)session.getAttribute("EMAIL");
    //str=(str==null)?"":str;
    if(str==null)
    {
    	response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Four Cards</title>
    
    <style>
    body{
    	 background: url(https://wallpaperaccess.com/full/396538.jpg);
         background-size: cover;
    }
     .card-container {
            display: flex;
            flex-wrap: wrap; /* Allow cards to wrap to the next line */
            justify-content: space-between;
            margin: 20px;
        }

        /* Individual card styles */
        .card {
            width: calc(33.33% - 20px); /* Adjust the width for three cards per line */
            height: 300px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px; /* Add margin at the bottom of each card */
        }

        /* Image inside the card */
        .card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    </style>
</head>
<body>
	<%
    // Initialize variables
    int rowCount = 0;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String cat=request.getParameter("cat");

    try {
        // Load the JDBC driver (replace with your database-specific driver)
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Create a database connection (replace with your database URL, username, and password)
        String dbURL = "jdbc:mysql://localhost:3306/ott1";
        String dbUser = "root";
        String dbPass = "1234";
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        // Create a SQL query to count the entries in the table (replace "YourTable" with your table name)
        String sql = "SELECT path,thumb,title,description FROM video order by rand() limit 6";

        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        %>
       <div class="card-container">
        	<%
        while(rs.next())
        {
        	String v=rs.getString(1);
        	String im=rs.getString(2);
        	String ti=rs.getString(3);
        	String des=rs.getString(4);
        	%>
        <div class="card">
           <a href="videoShow.jsp?v=<%=v%>&ti=<%=ti%>&des=<%=des%>"><img src="IMG/<%=im%>" alt="Image 1"></a> 
        </div>
        <%
        }
        // Retrieve the count
        //if (rs.next()) {
        //    rowCount = rs.getInt(1);
        //}
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close the resources
        try { if (rs != null) rs.close(); } catch (Exception e) { /* ignored */ }
        try { if (pstmt != null) pstmt.close(); } catch (Exception e) { /* ignored */ }
        try { if (conn != null) conn.close(); } catch (Exception e) { /* ignored */ }
    }
%>

    </div>
</body>
</html>
