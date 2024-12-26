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

public class StudentLogin extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String id = req.getParameter("id");
        String password = req.getParameter("password");

        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Load the database driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/stmanager_db", "root", "123456789");

            // Prepare the SQL statement
            String sql = "SELECT * FROM studentlogin WHERE id = ? AND password = ?";
            pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, password);

            // Execute query
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Redirect to options page if login is successful
                resp.sendRedirect("optionsstudent.jsp");
            } else {
                // Display error message
                out.print("<html><body><h3>Invalid ID or Password</h3></body></html>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.print("<html><body><h3>An error occurred. Please try again later.</h3></body></html>");
            
        }
        
        try {
			rs.close();
			pstmt.close();
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
    }
}
