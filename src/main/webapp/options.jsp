<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%

    // Retrieve the session (use the built-in 'session' object)
    if (session == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    // Retrieve adminId from the session
    String adminId = (String) session.getAttribute("adminId");

    // Redirect to login if adminId is not set
    if (adminId == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management</title>
<style>
body {
    margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
    background: url('images/school1.jpg') no-repeat center center fixed;
    background-size: cover;
    color: #ffffff;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    flex-direction: column;
}

.container {
    text-align: center;
    background: rgba(0, 0, 0, 0.7); /* Semi-transparent background */
    padding: 40px;
    border-radius: 15px;
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.5);
    max-width: 600px;
    width: 90%;
}

.container h1 {
    font-size: 36px;
    margin-bottom: 20px;
}

.welcome {
    font-size: 20px;
    margin-bottom: 20px;
    color: #81c784; /* Light green */
}

.button-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
    margin-top: 20px;
}

button {
    padding: 15px 20px;
    font-size: 16px;
    font-weight: bold;
    color: #ffffff;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

button:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 15px rgba(0, 0, 0, 0.3);
}

.add {
    background: linear-gradient(135deg, #4caf50, #81c784);
    /* Green gradient */
}

.update {
    background: linear-gradient(135deg, #2196f3, #64b5f6);
    /* Blue gradient */
}

.delete {
    background: linear-gradient(135deg, #f44336, #e57373);
    /* Red gradient */
}

.fetch {
    background: linear-gradient(135deg, #ff9800, #ffb74d);
    /* Orange gradient */
}

.signout {
    margin-top: 20px;
    background: linear-gradient(135deg, #e91e63, #f06292);
    /* Pink gradient */
    padding: 12px 30px;
    font-size: 18px;
    border-radius: 8px;
    font-weight: bold;
    text-align: center;
}

.signout:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 15px rgba(0, 0, 0, 0.3);
}
</style>
<script type="text/javascript">
    function add() {
        window.location.href = "studentForm.jsp";
    }

    function del() {
        window.location.href = "deleteStudent.jsp";
    }

    function update() {
        window.location.href = "updateStudent.jsp";
    }

    function fetch() {
        window.location.href = "fetchStudent.jsp";
    }

    function fetchAll() {
        window.location.href = "fetch_all_students.jsp";
    }

    function signOut() {
        window.location.href = "index.jsp"; 
    }
    
    function progress() {
        window.location.href = "student_report.jsp"; 
    }
    
    function studentcred() {
        window.location.href = "studentlogincred.jsp"; 
    }
    
    function fullmarks() {
        window.location.href = "fetchallstudentmarks.jsp"; 
    }
</script>
</head>
<body>
    <div class="container">
        <h1>Student Management</h1>
        <p class="welcome">Welcome, Admin <%= adminId %>!</p>
        <div class="button-grid">
            <button class="delete" onclick="studentcred()">Student Credentials</button>
            <button class="add" onclick="add()">Add Student</button>
            <button class="update" onclick="update()">Update Student</button>
            <button class="delete" onclick="del()">Delete Student</button>
            <button class="fetch" onclick="fetch()">Fetch Student</button>
            <button class="update" onclick="fetchAll()">Fetch All Students</button>
            <button class="add" onclick="progress()">Student Marks</button>
            <button class="fetch" onclick="fullmarks()">All Student Marks</button>
        </div>
    </div>
    <button class="signout" onclick="signOut()">Sign Out</button>
</body>
</html>
