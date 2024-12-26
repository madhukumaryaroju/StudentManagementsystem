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

public class Progress extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/stmanager_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "123456789";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        // Retrieve form parameters
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String maths = req.getParameter("maths");
        String chemistry = req.getParameter("chemistry");
        String dbms = req.getParameter("dbms");
        String web = req.getParameter("web");
        String java = req.getParameter("java");
        String full = req.getParameter("full");
        out.println("<!DOCTYPE html>");
        out.println("<html lang='en'>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
        out.println("<title>Student Addition</title>");
        out.println("<style>");
        out.println(":root {");
        out.println("  --success-color: #28a745;");
        out.println("  --error-color: #dc3545;");
        out.println("  --primary-color: #007bff;");
        out.println("  --primary-color-hover: #0056b3;");
        out.println("}");
        out.println("body { font-family: Arial, sans-serif; background: url('images/school.jpg') no-repeat center center fixed;");
        out.println("      background-size: cover; margin: 0; padding: 0; display: flex; justify-content: center; align-items: center; min-height: 100vh; color: #fff; }");
        out.println(".container { background-color: rgba(0, 0, 0, 0.85); padding: 20px; border-radius: 10px; text-align: center; box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2); max-width: 500px; width: 90%; }");
        out.println(".success { color: var(--success-color); font-weight: bold; margin-bottom: 20px; }");
        out.println(".error { color: var(--error-color); font-weight: bold; margin-bottom: 20px; }");
        out.println("button { padding: 12px 24px; font-size: 16px; color: #fff; background-color: var(--primary-color); border: none; border-radius: 5px; cursor: pointer; transition: background-color 0.3s ease; }");
        out.println("button:hover { background-color: var(--primary-color-hover); }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='container'>");

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Update student progress data in the database
            PreparedStatement pstmt = connection.prepareStatement(
                "UPDATE PROGRESS SET name = ?, maths = ?, chemistry = ?, dbms = ?, web = ?, java = ?, full = ? WHERE id = ?");
            pstmt.setString(1, name);
            pstmt.setString(2, maths);
            pstmt.setString(3, chemistry);
            pstmt.setString(4, dbms);
            pstmt.setString(5, web);
            pstmt.setString(6, java);
            pstmt.setString(7, full);
            pstmt.setString(8, id);  // Use the ID to identify the record to update

            pstmt.executeUpdate();
            connection.close();

            // Success message
            out.println("<p class='success'>Data successfully submitted!</p>");
            out.println("<button onclick=\"window.location.href='options.jsp';\">Return to Home Page</button>");

        } catch (ClassNotFoundException e) {
            out.println("<p class='error'>Error: MySQL JDBC Driver not found.</p>");
            out.println("<button onclick=\"window.location.href='options.jsp';\">Return to Home Page</button>");
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("<p class='error'>Error: Unable to connect to the database or execute query.</p>");
            out.println("<button onclick=\"window.location.href='options.jsp';\">Return to Home Page</button>");
            e.printStackTrace();
        } catch (Exception e) {
            out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
            out.println("<button onclick=\"window.location.href='options.jsp';\">Return to Home Page</button>");
            e.printStackTrace();
        }

        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }
}
