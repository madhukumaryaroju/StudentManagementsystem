package pack1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProgressFetch extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/stmanager_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "123456789";

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studentId = req.getParameter("studentId");
        String password = req.getParameter("password");

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<title>Fetch Student Details</title>");
        out.println("<style>");
        out.println("body { margin: 0; padding: 0; font-family: 'Poppins', sans-serif; background: url('images/fetch.jpg') no-repeat center center fixed; background-size: cover; color: #ffffff; display: flex; justify-content: center; align-items: center; height: 100vh; }");
        out.println(".result-container { background: rgba(0, 0, 0, 0.9); padding: 40px; border-radius: 20px; box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4); width: 70%; max-width: 800px; color: #ffffff; }");
        out.println(".result-container h1 { text-align: center; font-size: 36px; color: #4CAF50; margin-bottom: 30px; }");
        out.println("table { width: 100%; border-collapse: collapse; margin-top: 20px; }");
        out.println("th, td { text-align: left; padding: 10px; border: 1px solid #ddd; font-size: 18px; }");
        out.println("th { background-color: #4CAF50; color: white; }");
        out.println("td strong { color: #FFD700; }");
        out.println(".error { color: #FF6347; font-size: 24px; text-align: center; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");

        if (studentId == null || studentId.isEmpty()) {
            out.println("<div class='result-container'><h1>Error</h1>");
            out.println("<p class='error'>Student ID is required.</p></div>");
            return;
        }

        if (password == null || password.isEmpty()) {
            out.println("<div class='result-container'><h1>Error</h1>");
            out.println("<p class='error'>Password is required.</p></div>");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Updated query to include password in the WHERE clause
            PreparedStatement pstmt = connection.prepareStatement("SELECT * FROM PROGRESS WHERE id = ? AND password = ?");
            pstmt.setString(1, studentId);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                out.println("<div class='result-container'>");
                out.println("<h1>Student Details</h1>");
                out.println("<table>");
                out.println("<tr><th>Detail</th><th>Value</th></tr>");
                out.println("<tr><td><strong>ID</strong></td><td>" + rs.getString("id") + "</td></tr>");
                out.println("<tr><td><strong>Name</strong></td><td>" + rs.getString("name") + "</td></tr>");
                out.println("<tr><td><strong>Maths</strong></td><td>" + rs.getString("maths") + "</td></tr>");
                out.println("<tr><td><strong>Chemistry</strong></td><td>" + rs.getString("chemistry") + "</td></tr>");
                out.println("<tr><td><strong>DBMS</strong></td><td>" + rs.getString("dbms") + "</td></tr>");
                out.println("<tr><td><strong>Web</strong></td><td>" + rs.getString("web") + "</td></tr>");
                out.println("<tr><td><strong>Java</strong></td><td>" + rs.getString("java") + "</td></tr>");
                out.println("<tr><td><strong>Full</strong></td><td>" + rs.getString("full") + "</td></tr>");
                out.println("</table>");
                out.println("</div>");
            } else {
                out.println("<div class='result-container'><h1>Error</h1>");
                out.println("<p class='error'>No student found with the provided ID and password.</p></div>");
            }

            connection.close();
        } catch (ClassNotFoundException e) {
            out.println("<div class='result-container'><h1>Error</h1>");
            out.println("<p class='error'>MySQL JDBC Driver not found.</p></div>");
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("<div class='result-container'><h1>Error</h1>");
            out.println("<p class='error'>Unable to connect to the database or execute query.</p></div>");
            e.printStackTrace();
        }

        out.println("</body>");
        out.println("</html>");
    }
}
