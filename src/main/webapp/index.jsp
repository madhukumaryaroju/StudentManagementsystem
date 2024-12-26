<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management System</title>
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

.fetchall {
    background: linear-gradient(135deg, #9c27b0, #ba68c8);
    /* Purple gradient */
    width: 100%;
    padding: 12px;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    margin-left: 50%;
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
    function admin() {
        window.location.href = "admin.jsp";
    }

    function student() {
        window.location.href = "studentlogin.jsp";
    }

</script>
</head>
<body>
    <div class="container">
        <h1>Student Management</h1>
        <div class="button-grid">
            <button class="add" onclick="admin()">Admin Login</button>
            <button class="update" onclick="student()">Student Login</button>

        </div>
    </div>
    
</body>
</html>
