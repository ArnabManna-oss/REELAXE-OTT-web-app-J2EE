import java.io.*;
import java.sql.*;
import java.util.UUID;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String vid = UUID.randomUUID().toString(); 
        String title = request.getParameter("title");
        String category = request.getParameter("category");
        String description = request.getParameter("description");

        Part videoPart = request.getPart("video");
        String videoFileName = getSubmittedFileName(videoPart); // Get the original video filename
        String videoPath = getServletContext().getRealPath("/VIDstore/") + File.separator + videoFileName;
        videoPart.write(videoPath);

        Part thumbnailPart = request.getPart("thumbnail");
        String thumbnailFileName = getSubmittedFileName(thumbnailPart); // Get the original thumbnail filename
        String thumbnailPath = getServletContext().getRealPath("/IMG/") + File.separator + thumbnailFileName;
        thumbnailPart.write(thumbnailPath);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Replace with your JDBC driver class
            String dbURL = "jdbc:mysql://localhost:3306/ott1"; // Replace with your database URL
            String dbUser = "root"; // Replace with your database username
            String dbPass = "1234"; // Replace with your database password
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String insertQuery = "INSERT INTO Video (vid, title, category, thumb, description, path) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = conn.prepareStatement(insertQuery);
            preparedStatement.setString(1, vid);
            preparedStatement.setString(2, title);
            preparedStatement.setString(3, category);
            preparedStatement.setString(4, thumbnailFileName);
            preparedStatement.setString(5, description);
            preparedStatement.setString(6, videoFileName);
            preparedStatement.executeUpdate();

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("upload.jsp"); // Redirect back to the index page after upload
    }

    // Utility method to extract the original filename from a Part
    private String getSubmittedFileName(Part part) {
        for (String contentDisposition : part.getHeader("content-disposition").split(";")) {
            if (contentDisposition.trim().startsWith("filename")) {
                return contentDisposition.substring(contentDisposition.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
