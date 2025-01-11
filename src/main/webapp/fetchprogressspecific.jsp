<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Details</title>
    <% 
        // Check if the session is valid and if the admin is logged in
        if(session == null || session.getAttribute("id") == null) {
            response.sendRedirect("index.jsp"); // Redirect if admin is not logged in
            return;
        }

        // Retrieve admin's ID from session
        String id = (String) session.getAttribute("id");
    %>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: url('images/school.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .fetch-container {
            background: rgba(0, 0, 0, 0.8);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 1200px;
            text-align: center;
        }

        .fetch-container h1 {
            margin-bottom: 20px;
            color: #4CAF50;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
            color: #ffffff;
        }

        th {
            background-color: #4CAF50;
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.1);
        }

        tr:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        @media (max-width: 768px) {
            .fetch-container {
                padding: 20px;
            }

            table {
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="fetch-container">
        <p class="welcome">Welcome, student <%= id %>!</p>
        <h1>Student Details</h1>
        
        <% 
            // Database credentials
            String DB_URL = "jdbc:mysql://localhost:3306/stmanager_db";
            String DB_USER = "root";
            String DB_PASSWORD = "123456789";
            
            try {
                // Load JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

                // Query to fetch specific student based on session ID
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM PROGRESS WHERE id = ?");
                pstmt.setInt(1, Integer.parseInt(id));  // Set the student ID parameter from session

                // Execute the query and get the result
                ResultSet rs = pstmt.executeQuery();
                
                // If student exists, display their details
                if (rs.next()) {
        %>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Maths</th>
                    <th>Chemistry</th>
                    <th>DBMS</th>
                    <th>Web Technology</th>
                    <th>Java Programming</th>
                    <th>Result</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("maths") %></td>
                    <td><%= rs.getString("chemistry") %></td>
                    <td><%= rs.getString("dbms") %></td>
                    <td><%= rs.getString("web") %></td>
                    <td><%= rs.getString("java") %></td>
                    <td><%= rs.getString("full") %></td>
                    
                </tr>
            </tbody>
        </table>

        <%
                } else {
                    out.println("<p>No student found with ID: " + id + "</p>");
                }

                conn.close();
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
                e.printStackTrace();
            }
        %>
    </div>
</body>
</html>
