<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Students</title>
    <% 
  	if(session==null){
  		response.sendRedirect("index.jsp");
  		return ;
  	}
  
  	String adminId = (String) session.getAttribute("adminId");
  	
  	if(adminId == null){
  		response.sendRedirect("index.jsp");
  		return;
  	}
  	
  %>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: url('images/school3.jpg') no-repeat center center fixed;
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
    <p class="welcome">Welcome, Admin <%= adminId %>!</p>
        <h1>Student Records</h1>
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
                <%
                    // Database credentials
                    String DB_URL = "jdbc:mysql://localhost:3306/stmanager_db";
                    String DB_USER = "root";
                    String DB_PASSWORD = "123456789";

                    try {
                        // Load JDBC driver
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        // Establish connection
                        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

                        // Execute query to fetch all student records
                        String query = "SELECT * FROM PROGRESS";
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery(query);

                        // Iterate through the result set and display data in table rows
                        while (rs.next()) {
                %>
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
                <%
                        }
                        conn.close();
                    } catch (Exception e) {
                        out.println("<p>Error: " + e.getMessage() + "</p>");
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
