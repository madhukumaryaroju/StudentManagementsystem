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

public class UpdateStudent extends HttpServlet {

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
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String dept = req.getParameter("dept");
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
        out.println("<title>Update Student</title>");
        out.println("<style>");
        out.println("body { font-family: Arial, sans-serif; text-align: center; background-color: #f4f4f9; padding: 20px;background: url('images/school2.jpg') no-repeat center center fixed; }");
        out.println(".message-container { margin-top: 18%;margin-right: 2%;  padding: 20px; border: 1px solid #ddd; border-radius: 10px; background-color: rgba(0, 0, 0, 0.7); box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1); }");
        out.println(".success { color: #28a745; font-weight: bold; }");
        out.println(".error { color: #dc3545; font-weight: bold; }");
        out.println("button { padding: 10px 20px; font-size: 16px; color: #fff; background-color: #007bff; border: none; border-radius: 5px; cursor: pointer; }");
        out.println("button:hover { background-color: #0056b3; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");

        if (studentId == null || studentId.isEmpty()) {
            out.println("<div class='message-container'>");
            out.println("<p class='error'>Error: Student ID is mandatory.</p>");
            out.println("<button onclick=\"window.location.href='options.jsp';\">Return to Home Page</button>");
            out.println("</div>");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            StringBuilder query = new StringBuilder("UPDATE STUDENT SET ");
            boolean hasFieldsToUpdate = false;

            if (name != null && !name.isEmpty()) {
                query.append("name = ?, ");
                hasFieldsToUpdate = true;
            }
            if (email != null && !email.isEmpty()) {
                query.append("email = ?, ");
                hasFieldsToUpdate = true;
            }
            if (phone != null && !phone.isEmpty()) {
                query.append("phone = ?, ");
                hasFieldsToUpdate = true;
            }
            if (dept != null && !dept.isEmpty()) {
                query.append("dept = ?, ");
                hasFieldsToUpdate = true;
            }
            if (year != null && !year.isEmpty()) {
                query.append("year = ?, ");
                hasFieldsToUpdate = true;
            }
            if (loc != null && !loc.isEmpty()) {
                query.append("loc = ?, ");
                hasFieldsToUpdate = true;
            }
            if (dob != null && !dob.isEmpty()) {
                query.append("dob = ?, ");
                hasFieldsToUpdate = true;
            }
            if (age != null && !age.isEmpty()) {
                query.append("age = ?, ");
                hasFieldsToUpdate = true;
            }
            if (fatherName != null && !fatherName.isEmpty()) {
                query.append("father_name = ?, ");
                hasFieldsToUpdate = true;
            }
            if (motherName != null && !motherName.isEmpty()) {
                query.append("mother_name = ?, ");
                hasFieldsToUpdate = true;
            }

            if (!hasFieldsToUpdate) {
                out.println("<div class='message-container'>");
                out.println("<p class='error'>Error: No fields provided to update.</p>");
                out.println("<button onclick=\"window.location.href='options.jsp';\">Return to Home Page</button>");
                out.println("</div>");
                return;
            }

            query.setLength(query.length() - 2);
            query.append(" WHERE id = ?");

            PreparedStatement pstmt = connection.prepareStatement(query.toString());

            int paramIndex = 1;
            if (name != null && !name.isEmpty()) pstmt.setString(paramIndex++, name);
            if (email != null && !email.isEmpty()) pstmt.setString(paramIndex++, email);
            if (phone != null && !phone.isEmpty()) pstmt.setString(paramIndex++, phone);
            if (dept != null && !dept.isEmpty()) pstmt.setString(paramIndex++, dept);
            if (year != null && !year.isEmpty()) pstmt.setString(paramIndex++, year);
            if (loc != null && !loc.isEmpty()) pstmt.setString(paramIndex++, loc);
            if (dob != null && !dob.isEmpty()) pstmt.setDate(paramIndex++, java.sql.Date.valueOf(dob));
            if (age != null && !age.isEmpty()) pstmt.setInt(paramIndex++, Integer.parseInt(age));
            if (fatherName != null && !fatherName.isEmpty()) pstmt.setString(paramIndex++, fatherName);
            if (motherName != null && !motherName.isEmpty()) pstmt.setString(paramIndex++, motherName);
            pstmt.setInt(paramIndex, Integer.parseInt(studentId));

            int rowsUpdated = pstmt.executeUpdate();

            out.println("<div class='message-container'>");
            if (rowsUpdated > 0) {
                out.println("<p class=\"welcome\">Welcome, Admin " + adminId + "!</p>");
                out.println("<p class='success'>Student details updated successfully!</p>");
            } else {
                out.println("<p class='error'>Error: No student found with the provided ID.</p>");
            }
            out.println("<button onclick=\"window.location.href='options.jsp';\">Return to Home Page</button>");
            out.println("</div>");

            connection.close();
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
