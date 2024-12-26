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

public class AdminLogin extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/stmanager_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "123456789";

    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String adminId = req.getParameter("adminId");
        String password = req.getParameter("password");

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String createTableSQL = """
                CREATE TABLE IF NOT EXISTS ADMIN (
                    admin_id VARCHAR(50) PRIMARY KEY,
                    password VARCHAR(100) NOT NULL
                )
            """;
            connection.createStatement().execute(createTableSQL);

            PreparedStatement pstmt = connection.prepareStatement(
                "SELECT * FROM ADMIN WHERE admin_id = ? AND password = ?");
            pstmt.setString(1, adminId);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                resp.sendRedirect("options.jsp");
            } else {
                out.println("<h3>Invalid Admin ID or Password!</h3>");
            }

            connection.close();
        } catch (ClassNotFoundException e) {
            out.println("<h3>Error: MySQL JDBC Driver not found.</h3>");
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("<h3>Error: Unable to connect to the database.</h3>");
            e.printStackTrace();
        }
    }
}
