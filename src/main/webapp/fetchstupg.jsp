<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Student Details</title>
</head>
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
        height: 100vh;
    }

    .insert-container {
        background: rgba(0, 0, 0, 0.8);
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        width: 80%;
        max-width: 600px;
        text-align: center;
    }

    .insert-container h1 {
        margin-bottom: 20px;
        color: #FF6347;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    table td {
        padding: 10px;
        text-align: left;
        color: #ffffff;
    }

    table td label {
        font-size: 14px;
        font-weight: bold;
    }

    table td input {
        width: 100%;
        padding: 12px;
        border: 1px solid rgba(255, 255, 255, 0.3);
        border-radius: 5px;
        font-size: 16px;
        background: rgba(255, 255, 255, 0.15);
        color: #ffffff;
        transition: background 0.3s ease, border-color 0.3s ease;
    }

    table td input::placeholder {
        color: #dddddd;
    }

    table td input:focus {
        border-color: #4CAF50;
        outline: none;
        background: rgba(255, 255, 255, 0.25);
    }

    button {
        margin-top: 20px;
        padding: 12px 30px;
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
        .insert-container {
            width: 90%;
            padding: 20px;
        }
    }
</style>
<body>
<div class="insert-container">
    <h1>Insert Student Details</h1>
    <form action="insertStudent" method="post">
        <table>
            <tr>
                <td><label for="studentId">Student ID:</label></td>
                <td><input type="text" name="studentId" id="studentId" placeholder="Enter Student ID" required /></td>
            </tr>
            <tr>
                <td><label for="name">Name:</label></td>
                <td><input type="text" name="name" id="name" placeholder="Enter Name" required /></td>
            </tr>
            <tr>
                <td><label for="email">Email:</label></td>
                <td><input type="email" name="email" id="email" placeholder="Enter Email" required /></td>
            </tr>
            <tr>
                <td><label for="phone">Phone:</label></td>
                <td><input type="text" name="phone" id="phone" placeholder="Enter Phone" required /></td>
            </tr>
            <tr>
                <td><label for="dept">Department:</label></td>
                <td><input type="text" name="dept" id="dept" placeholder="Enter Department" required /></td>
            </tr>
            <tr>
                <td><label for="year">Year:</label></td>
                <td><input type="text" name="year" id="year" placeholder="Enter Year" required /></td>
            </tr>
            <tr>
                <td><label for="dob">Date of Birth:</label></td>
                <td><input type="date" name="dob" id="dob" required /></td>
            </tr>
            <tr>
                <td><label for="fatherName">Father's Name:</label></td>
                <td><input type="text" name="fatherName" id="fatherName" placeholder="Enter Father's Name" /></td>
            </tr>
            <tr>
                <td><label for="motherName">Mother's Name:</label></td>
                <td><input type="text" name="motherName" id="motherName" placeholder="Enter Mother's Name" /></td>
            </tr>
        </table>
        <button type="submit">Insert Data</button>
    </form>
</div>
</body>
</html>
