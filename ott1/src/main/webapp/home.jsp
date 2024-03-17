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
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>REELAX</title>
    <link rel="stylesheet">
    <style>
        body, html {
    height: 100%;
    margin: 0;
}

.slider {
    width: 100%;
    height: 100%;
    display: flex;
    overflow: hidden;
}

.slide {
    flex-shrink: 0;
    width: 100%;
    height: 100%;
    transition: opacity 0.5s ease-in-out;
    opacity: 0;
    position: absolute;
}

.slide img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}


    </style>
</head>
<body>
<% 
int rowCount = 0;
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
//String cat=request.getParameter("cat");

try {
    // Load the JDBC driver (replace with your database-specific driver)
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Create a database connection (replace with your database URL, username, and password)
    String dbURL = "jdbc:mysql://localhost:3306/ott1";
    String dbUser = "root";
    String dbPass = "1234";
    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

    // Create a SQL query to count the entries in the table (replace "YourTable" with your table name)
    String sql = "SELECT thumb,path,title,description FROM video ORDER BY RAND() LIMIT 4";

    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
   %><div class="slider"><% 
		   int c=1;
   while(rs.next())
    {
	   String v=rs.getString(2);
   	String im=rs.getString(1);
   	String ti=rs.getString(3);
   	String des=rs.getString(4);
    	%>
    <div class="slide" id="slide<%=c++%>">
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

    <script>
        let currentSlide = 1;

function showSlide(slideNumber) {
    const slides = document.querySelectorAll('.slide');
    slides.forEach(slide => {
        slide.style.opacity = 0;
    });
    slides[slideNumber - 1].style.opacity = 1;
}

function nextSlide() {
    currentSlide++;
    if (currentSlide > 4) {
        currentSlide = 1;
    }
    showSlide(currentSlide);
}

setInterval(nextSlide, 4000);

showSlide(currentSlide);

    </script>
</body>
</html>
<jsp:include page="randomBox.jsp" />
    