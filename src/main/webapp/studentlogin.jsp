<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	font-family: 'Poppins', sans-serif;
	background: url('images/schoollogin.jpg') no-repeat center center fixed;
	/* Adjust the path to your image */
	background-size: cover;
	color: #ffffff;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.login-container {
	background: rgba(0, 0, 0, 0.7); /* Semi-transparent background */
	padding: 40px;
	border-radius: 15px;
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
	max-width: 400px;
	width: 100%;
	text-align: center;
}

.login-container h2 {
	margin-bottom: 20px;
	font-size: 28px;
	font-weight: 700;
	color: white;
}

.login-container label {
	display: block;
	text-align: left;
	font-size: 14px;
	margin: 10px 0 5px;
	color: white;
	font-weight: 700;
}

.login-container input[type="text"], .login-container input[type="password"]
	{
	width: 80%;
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid #dfe6e9;
	border-radius: 8px;
	font-size: 16px;
	color: #2c3e50;
	background-color: #f8f9fa;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
	transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.login-container input[type="text"]:focus, .login-container input[type="password"]:focus
	{
	border-color: #0984e3;
	outline: none;
	box-shadow: 0 0 10px rgba(9, 132, 227, 0.3);
}

.login-container button {
	width: 100%;
	padding: 12px;
	background: linear-gradient(135deg, #74b9ff, #0984e3);
	color: white;
	border: none;
	border-radius: 8px;
	font-size: 18px;
	font-weight: bold;
	cursor: pointer;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.login-container button:hover {
	transform: translateY(-2px);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.login-container p {
	margin-top: 20px;
	font-size: 15px;
	color: #636e72;
}

.login-container a {
	color: #0984e3;
	text-decoration: none;
	font-weight: 500;
	transition: color 0.2s ease;
}

.login-container a:hover {
	color: #74b9ff;
}

@media ( max-width : 768px) {
	.login-container {
		padding: 25px;
	}
	.login-container h2 {
		font-size: 24px;
		margin-bottom: 15px;
	}
	.login-container input[type="text"], .login-container input[type="password"]
		{
		padding: 14px;
		font-size: 15px;
	}
	.login-container button {
		font-size: 16px;
	}
	.login-container p {
		font-size: 14px;
	}
}
</style>
</head>
<body>
	<div class="login-container">
		<h2>Student Login</h2>
		<form action="studentLogin" method="post">
			<label for="studentid"><b>Student ID:</b></label> <input type="text"
				id="studentId" name="id" placeholder="Enter Student ID" required />

			<label for="password"><b>Password:</b></label> <input type="password"
				id="password" name="password" placeholder="Enter Password" required />

			<button type="submit">Login</button>
		</form>
	</div>
</body>
</html>
