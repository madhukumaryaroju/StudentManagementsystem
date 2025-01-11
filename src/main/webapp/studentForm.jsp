<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    // Retrieve the session (use the built-in 'session' object)
 if(session	== null){
	 response.sendRedirect("index.jsp");
	 return;
	 
 }

	String adminId = (String)session.getAttribute("adminId");

	if(adminId==null){
		 response.sendRedirect("index.jsp");
	return;
}

%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Student Registration Form</title>
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
    }

    .login-container {
      background: rgba(0, 0, 0, 0.8);
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
      width: 50%;
      max-width: 700px;
      text-align: left;
    }

    .login-container h1 {
      text-align: center;
      margin-bottom: 30px;
      color: #4CAF50;
    }

    form {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 20px;
    }

    /* Full-width elements */
    .full-width {
      grid-column: 1 / -1;
    }

    label {
      display: block;
      font-size: 14px;
      font-weight: bold;
      margin-bottom: 5px;
    }

    input, select {
      width: 80%;
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

    input:focus, select:focus {
      border-color: #4CAF50;
      outline: none;
      background: rgba(255, 255, 255, 0.2);
    }

    button {
      grid-column: 1 / -1;
      padding: 12px 20px;
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
      .login-container {
        width: 90%;
        padding: 30px;
      }

      form {
        grid-template-columns: 1fr;
      }

      .full-width {
        grid-column: 1 / -1;
      }
    }
  </style>
</head>
<body>

  <div class="login-container">
    <h1>Student Registration</h1>
     <p class="welcome">Welcome, Admin <%= adminId %>!</p>
    <form action="student" method="post">
    	
	    <div>
	    <label for="id">Student ID:</label>
	    <input type="text" id="id" name="id1" placeholder="Enter Student ID" required />
	  </div>
	    
      <div>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name1" placeholder="Enter Your Name" required />
      </div>

      <div>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email1" placeholder="Enter Your Email" required />
      </div>

      <div>
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone1" placeholder="Enter Your Phone Number" required />
      </div>

      <div>
        <label for="department">Department:</label>
        <input type="text" id="department" name="dept1" placeholder="Enter Your Department" required />
      </div>

      <div>
        <label for="year">Select Year:</label>
        <select name="year" id="year" required>
          <option value="" disabled selected>Select your year</option>
          <option value="1st Year">1st Year</option>
          <option value="2nd Year">2nd Year</option>
          <option value="3rd Year">3rd Year</option>
          <option value="4th Year">4th Year</option>
        </select>
      </div>

      <div>
        <label for="location">Location:</label>
        <input type="text" id="location" name="loc1" placeholder="Enter Your Location" required />
      </div>

      <div>
        <label for="DOB">Date of Birth:</label>
        <input type="date" id="DOB" name="dob1" required />
      </div>

      <div>
        <label for="Age">Age:</label>
        <input type="number" id="Age" name="age1" placeholder="Enter Your Age" required />
      </div>

      <div>
        <label for="Fname">Father's Name:</label>
        <input type="text" id="Fname" name="fname1" placeholder="Enter Your Father's Name" required />
      </div>

      <div>
        <label for="Mname">Mother's Name:</label>
        <input type="text" id="Mname" name="mname1" placeholder="Enter Your Mother's Name" required />
      </div>

      <!-- Submit Button -->
      <button type="submit">Add</button>
    </form>
  </div>
</body>
</html>
