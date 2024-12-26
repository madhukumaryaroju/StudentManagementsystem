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

public class StudentAdd extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/stmanager_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "123456789";

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id1"); // Retrieve Student ID
        String name = req.getParameter("name1");
        String email = req.getParameter("email1");
        String phone = req.getParameter("phone1");
        String dept = req.getParameter("dept1");
        String year = req.getParameter("year");
        String loc = req.getParameter("loc1");
        String dob = req.getParameter("dob1");
        String age = req.getParameter("age1");
        String fatherName = req.getParameter("fname1");
        String motherName = req.getParameter("mname1");

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html lang='en'>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
        out.println("<title>Student Addition</title>");
        out.println("<style>");
        out.println("body { font-family: Arial, sans-serif; text-align: center; background-color: #f4f4f9; padding: 20px;background: url('images/school.jpg') no-repeat center center fixed;  }");
        out.println(".message-container {margin-top: 18%;margin-right: 2%; padding: 20px; border: 1px solid #ddd; border-radius: 10px; background-color: rgba(0, 0, 0, 0.8);; box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1); }");
        out.println(".success { color: #28a745; font-weight: bold; }");
        out.println(".error { color: #dc3545; font-weight: bold; }");
        out.println("button { padding: 10px 20px; font-size: 16px; color: #fff; background-color: #007bff; border: none; border-radius: 5px; cursor: pointer; }");
        out.println("button:hover { background-color: #0056b3; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String createTableSQL = """
                CREATE TABLE IF NOT EXISTS STUDENT (
                    id VARCHAR(50) PRIMARY KEY,
                    name VARCHAR(100) NOT NULL,
                    email VARCHAR(100) NOT NULL,
                    phone VARCHAR(15) NOT NULL,
                    dept VARCHAR(50) NOT NULL,
                    year VARCHAR(10) NOT NULL,
                    loc VARCHAR(100) NOT NULL,
                    dob VARCHAR(45) NOT NULL,
                    age INT NOT NULL,
                    father_name VARCHAR(100) NOT NULL,
                    mother_name VARCHAR(100) NOT NULL
                )
            """;
            connection.createStatement().execute(createTableSQL);

            PreparedStatement pstmt = connection.prepareStatement(
                "INSERT INTO STUDENT (id, name, email, phone, dept, year, loc, dob, age, father_name, mother_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            pstmt.setString(1, id); // Set ID
            pstmt.setString(2, name);
            pstmt.setString(3, email);
            pstmt.setString(4, phone);
            pstmt.setString(5, dept);
            pstmt.setString(6, year);
            pstmt.setString(7, loc);
            pstmt.setDate(8, java.sql.Date.valueOf(dob));
            pstmt.setInt(9, Integer.parseInt(age));
            pstmt.setString(10, fatherName);
            pstmt.setString(11, motherName);

            pstmt.executeUpdate();
            connection.close();

            out.println("<div class='message-container'>");
            out.println("<p class='success'>Student information saved successfully!</p>");
            out.println("<button onclick=\"window.location.href='options.jsp';\">Return to Home Page</button>");
            out.println("</div>");
        } catch (ClassNotFoundException e) {
            out.println("<div class='message-container'>");
            out.println("<p class='error'>Error: MySQL JDBC Driver not found.</p>");
            out.println("<button onclick=\"window.location.href='options.jsp';\">Return to Home Page</button>");
            out.println("</div>");
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("<div class='message-container'>");
            out.println("<p class='error'>Error: Unable to connect to the database or execute query.</p>");
            out.println("<button onclick=\"window.location.href='options.jsp';\">Return to Home Page</button>");
            out.println("</div>");
            e.printStackTrace();
        } catch (Exception e) {
            out.println("<div class='message-container'>");
            out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
            out.println("<button onclick=\"window.location.href='options.jsp';\">Return to Home Page</button>");
            out.println("</div>");
            e.printStackTrace();
        }

        out.println("</body>");
        out.println("</html>");
    }
}
