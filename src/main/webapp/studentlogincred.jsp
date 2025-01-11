<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Login</title>
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
    }

    .login-container {
        background: rgba(0, 0, 0, 0.8); /* Semi-transparent background */
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.5);
        max-width: 400px;
        width: 100%;
        text-align: center;
    }

    .login-container h2 {
        margin-bottom: 20px;
        font-size: 28px;
        font-weight: bold;
        color: #ffffff;
    }

    .login-container label {
        display: block;
        text-align: left;
        font-size: 18px;
        margin: 10px 0 5px;
        color: #ffffff;
        font-weight: 600;
    }

    .login-container input[type="text"], 
    .login-container input[type="password"] {
        width: 80%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 16px;
        background-color: #f9f9f9;
        color: #333;
        box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    .login-container input[type="text"]:focus, 
    .login-container input[type="password"]:focus {
        border-color: #74b9ff;
        box-shadow: 0 0 5px rgba(116, 185, 255, 0.5);
        outline: none;
    }

    .login-container button {
        width: 100%;
        padding: 12px;
        background: linear-gradient(135deg, #74b9ff, #0984e3);
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .login-container button:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
    }

    .login-container p {
        margin-top: 15px;
        font-size: 14px;
        color: #b2bec3;
    }

    .login-container a {
        color: #74b9ff;
        text-decoration: none;
        font-weight: bold;
        transition: color 0.3s ease;
    }

    .login-container a:hover {
        color: #0984e3;
    }

    @media (max-width: 768px) {
        .login-container {
            padding: 25px;
        }
        .login-container h2 {
            font-size: 24px;
        }
        .login-container input[type="text"], 
        .login-container input[type="password"] {
            padding: 10px;
            font-size: 14px;
        }
        .login-container button {
            font-size: 14px;
        }
        .login-container p {
            font-size: 12px;
        }
    }
</style>
</head>
<body>
<div class="login-container">
    <h2>Student Login</h2>
    <form action="cred" method="post">
        <label for="id">Create Student ID:</label>
        <input type="text" name="id" id="id" required />
        <label for="password">Create Student Password:</label>
        <input type="password" name="password" id="password" required />
        <button type="submit">Submit</button>
    </form>
</div>
</body>
</html>
