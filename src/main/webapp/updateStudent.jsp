<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Update Student</title>
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

    .update-container {
      background: rgba(0, 0, 0, 0.8);
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
      width: 50%;
      max-width: 700px;
      text-align: left;
    }

    .update-container h1 {
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
      .update-container {
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
  <div class="update-container">
  <p class="welcome">Welcome, Admin <%= adminId %>!</p>
    <h1>Update Student Details</h1>
    <form action="updateStudent" method="post">
      <!-- Row 1: Student ID -->
      <div class="full-width">
        <label for="studentId">Student ID:</label>
        <input type="number" id="studentId" name="studentId" placeholder="Enter Student ID" required />
      </div>

      <!-- Row 2: Name and Email -->
      <div>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" placeholder="Enter New Name" />
      </div>

      <div>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" placeholder="Enter New Email" />
      </div>

      <!-- Row 3: Phone and Department -->
      <div>
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" placeholder="Enter New Phone Number" />
      </div>

      <div>
        <label for="department">Department:</label>
        <input type="text" id="department" name="dept" placeholder="Enter New Department" />
      </div>

      <!-- Row 4: Year and Location -->
      <div>
        <label for="year">Year:</label>
        <select name="year" id="year">
          <option value="" disabled selected>Select Year</option>
          <option value="1st Year">1st Year</option>
          <option value="2nd Year">2nd Year</option>
          <option value="3rd Year">3rd Year</option>
          <option value="4th Year">4th Year</option>
        </select>
      </div>

      <div>
        <label for="location">Location:</label>
        <input type="text" id="location" name="loc1" placeholder="Enter New Location" />
      </div>

      <!-- Row 5: Date of Birth and Age -->
      <div>
        <label for="DOB">Date of Birth:</label>
        <input type="date" id="DOB" name="dob1" />
      </div>

      <div>
        <label for="Age">Age:</label>
        <input type="number" id="Age" name="age1" placeholder="Enter New Age" />
      </div>

      <!-- Row 6: Father's and Mother's Name -->
      <div>
        <label for="Fname">Father's Name:</label>
        <input type="text" id="Fname" name="fname1" placeholder="Enter Father's Name" />
      </div>

      <div>
        <label for="Mname">Mother's Name:</label>
        <input type="text" id="Mname" name="mname1" placeholder="Enter Mother's Name" />
      </div>

      <!-- Submit Button -->
      <button type="submit">Update</button>
    </form>
  </div>
</body>
</html>
