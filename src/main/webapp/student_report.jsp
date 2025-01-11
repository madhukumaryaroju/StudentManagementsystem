<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Progress Report</title>
    <link rel="stylesheet" href="styles.css">
    <script>
        // Client-side form validation
        document.querySelector("form").onsubmit = function() {
            var isValid = true;
            var fields = document.querySelectorAll("input[required], select[required]");
            fields.forEach(function(field) {
                if (!field.value) {
                    isValid = false;
                    alert("Please fill all required fields.");
                }
            });
            return isValid;
        };
    </script>
    
    <style type="text/css">/* Apply the background image to the whole page */
body {
    background: url('images/school3.jpg') no-repeat center center fixed;
    background-size: cover;
    font-family: Arial, sans-serif;
    color: white;
    margin: 0;
    padding: 0;
}

/* Style the container to make it stand out */
.container {
    background: rgba(0, 0, 0, 0.8); /* Semi-transparent black background */
    padding: 40px;
    border-radius: 15px;
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
    width: 50%;
    max-width: 700px;
    margin: 50px auto; /* Center the container */
    text-align: left;
    position: relative;
}

/* Style the form labels */
form label {
    font-size: 1.1em;
    margin: 10px 0;
    display: block;
}

/* Flexbox layout for the input fields side by side */
.form-row {
    display: flex;
    justify-content: space-between;
    gap: 20px; /* Space between the input fields */
}

/* Style the form input fields */
form input, form select {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #fff;
    color: #333;
    font-size: 1em;
}

/* Make input fields within the form-row take up 48% of the container width */
.form-row input {
    width: 48%; /* Adjust the width for side-by-side layout */
}

/* Focus styles for input fields */
form input:focus, form select:focus {
    border-color: #4CAF50;
    outline: none;
}

/* Style the submit button */
form button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 15px 20px;
    font-size: 1.2em;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

/* Button hover effect */
form button:hover {
    background-color: #45a049;
}

/* Add a subtle animation to the form */
.container h1 {
    font-size: 2.5em;
    text-align: center;
    color: white;
    margin-bottom: 20px;
}

form {
    animation: fadeIn 1s ease-in-out;
}

/* Fade in effect */
@keyframes fadeIn {
    0% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}
    </style>
</head>
<body>
    <div class="container">
        <h1>Student Progress Report</h1>
        <form action="progress" method="post">
            <label for="id">Student ID:</label>
            <input type="number" id="id" name="id" required />
            <br>

            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required />
            <br>

            <label for="maths">Maths Marks:</label>
            <input type="number" id="maths" name="maths" required />
            <br>

            <label for="chemistry">Chemistry Marks:</label>
            <input type="number" id="chemistry" name="chemistry" required />
            <br>

            <label for="dbms">DBMS Marks:</label>
            <input type="number" id="dbms" name="dbms" required />
            <br>

            <label for="web">Web Technologies Marks:</label>
            <input type="number" id="web" name="web" required />
            <br>

            <label for="java">Java Marks:</label>
            <input type="number" id="java" name="java" required />
            <br>

            <label for="full">OverAll:</label>
            <select name="full" id="full" required>
                <option value="" disabled selected>P/F</option>
                <option value="Pass">Pass</option>
                <option value="Fail">Fail</option>
            </select>
            <br>

            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
