<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% String v=request.getParameter("v");
       String ti=request.getParameter("ti");
       String des=request.getParameter("des");%>
       <jsp:include page="header.jsp" /> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fullscreen Video Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
        }

        #video-container {
            position: relative;
            width: 100vw;
            height: 80vh;
        }

        video {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        #video-description {
            width: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            color: #fff;
            padding: 20px;
            box-sizing: border-box;
        }
    </style>
</head>
<body>

<div id="video-container">
    <video id="mainVideo" controls autoplay loop>
        <!-- Replace 'your-video.mp4' with your actual video file -->
        <source src="VIDstore\<%=v %>" type="video/mp4">
        Your browser does not support the video tag.
    </video>
</div>

<div id="video-description">
    <h2><%=ti %></h2>
    <p><%=des %></p>
</div>



</body>
</html>
