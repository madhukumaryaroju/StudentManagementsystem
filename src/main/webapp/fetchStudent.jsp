<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Fetch Student</title>
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
      background: url('images/school2.jpg') no-repeat center center fixed;
      background-size: cover;
      color: #ffffff;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .fetch-container {
      background: rgba(0, 0, 0, 0.8);
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
      width: 40%;
      max-width: 400px;
      text-align: center;
    }

    .fetch-container h1 {
      margin-bottom: 20px;
      color: #4CAF50;
    }

    label {
      display: block;
      font-size: 14px;
      font-weight: bold;
      margin-bottom: 10px;
    }

    input {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 14px;
      background: rgba(255, 255, 255, 0.1);
      color: #ffffff;
    }

    input::placeholder {
      color: #dddddd;
    }

    input:focus {
      border-color: #4CAF50;
      outline: none;
      background: rgba(255, 255, 255, 0.2);
    }

    button {
      margin-top: 20px;
      padding: 10px 20px;
      background-color: #4CAF50;
      color: #fff;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color: #45a049;
    }

    @media (max-width: 768px) {
      .fetch-container {
        width: 90%;
        padding: 20px;
      }
    }
  </style>
</head>
<body>
  <div class="fetch-container">
    <p class="welcome">Welcome, Admin <%= adminId %>!</p>
    <h1>Fetch Student Details</h1>
    <form action="fetchStudent" method="post">
      <label for="studentId">Student ID:</label>
      <input type="number" id="studentId" name="studentId" placeholder="Enter Student ID" required />
      <button type="submit">Fetch</button>
    </form>
  </div>
</body>
</html>
