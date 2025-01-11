package pack1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeleteStudent extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/stmanager_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "123456789";

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
    	HttpSession session = req.getSession(false);

        // Check if session exists
        if (session == null) {
            resp.sendRedirect("index.jsp");
            return;
        }

        // Retrieve adminId from the session
        String adminId = (String) session.getAttribute("adminId");

        // Redirect to login if adminId is not set
        if (adminId == null) {
            resp.sendRedirect("index.jsp");
            return;
        }
    	
    	
    	
    	String studentId = req.getParameter("studentId");

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<title>Delete Student</title>");
        out.println("<style>");
        out.println("body { margin: 0; padding: 0; font-family: 'Poppins', sans-serif; background: url('images/school.jpg') no-repeat center center fixed; background-size: cover; color: #ffffff; display: flex; justify-content: center; align-items: center; height: 100vh; }");
        out.println(".result-container { background: rgba(0, 0, 0, 0.8); padding: 30px; border-radius: 15px; box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2); width: 60%; max-width: 600px; text-align: center; color: #ffffff; }");
        out.println(".result-container h1 { color: #FF6347; margin-bottom: 20px; }");
        out.println("p { font-size: 18px; margin: 10px 0; }");
        out.println(".success { color: #4CAF50; font-size: 18px; font-weight: bold; }");
        out.println(".error { color: #FF6347; font-size: 18px; font-weight: bold; }");
        out.println("button { margin-top: 20px; padding: 10px 20px; font-size: 16px; background-color: #4CAF50; color: #fff; border: none; border-radius: 5px; cursor: pointer; }");
        out.println("button:hover { background-color: #45a049; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");

        if (studentId == null || studentId.isEmpty()) {
            out.println("<div class='result-container'><h1>Delete Student</h1>");
            out.println("<p class='error'>Error: Student ID is required.</p></div>");
            return;
        }

        try {
            int studentIdInt = Integer.parseInt(studentId);

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            PreparedStatement pstmt = connection.prepareStatement("DELETE FROM STUDENT WHERE id = ?");
            pstmt.setInt(1, studentIdInt);

            int rowsDeleted = pstmt.executeUpdate();

            if (rowsDeleted > 0) {
                out.println("<div class='result-container'><h1>Delete Student</h1>");
                out.println("<p class=\"welcome\">Welcome, Admin " + adminId + "!</p>");

                out.println("<p class='success'>Student with ID " + studentId + " deleted successfully!</p>");
            } else {
                out.println("<div class='result-container'><h1>Delete Student</h1>");
                out.println("<p class='error'>Error: No student found with the provided ID.</p>");
            }

            connection.close();
        } catch (NumberFormatException e) {
            out.println("<div class='result-container'><h1>Delete Student</h1>");
            out.println("<p class='error'>Error: Invalid Student ID format. Please enter a valid numeric ID.</p></div>");
        } catch (ClassNotFoundException e) {
            out.println("<div class='result-container'><h1>Delete Student</h1>");
            out.println("<p class='error'>Error: MySQL JDBC Driver not found.</p></div>");
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("<div class='result-container'><h1>Delete Student</h1>");
            out.println("<p class='error'>Error: Unable to connect to the database or execute query.</p></div>");
            e.printStackTrace();
        }

        out.println("<button onclick=\"window.location.href='options.jsp';\">Return to Home Page</button>");
        out.println("</body>");
        out.println("</html>");
    }
}
