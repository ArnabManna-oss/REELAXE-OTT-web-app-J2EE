<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Video Upload Page</title>
    <style>
    body{
        background-color: #7f76b5;
    }
    </style>
</head>
<body>
    <h1>Welcome to the Video Upload Page</h1>
    <p>Upload your videos here:</p>
    <form action="UploadServlet" method="post" enctype="multipart/form-data">
        <label for="video">Video:</label>
        <input type="file" name="video" id="video" accept="video/*" required>
        <br><br>
        <label for="title">Title:</label>
        <input type="text" name="title" id="title" required>
        <br><br>
        <label for="category">Category:</label>
        <input type="text" name="category" id="category" required>
        <br><br>
        <label for="thumbnail">Thumbnail Image:</label>
        <input type="file" name="thumbnail" id="thumbnail" accept="image/*" required>
        <br><br>
        <label for="description">Description:</label>
        <textarea name="description" id="description" required></textarea>
        <br><br>
        <input type="submit" value="Upload">
    </form>
</body>
</html>
    <jsp:include page="DelVid.jsp" />