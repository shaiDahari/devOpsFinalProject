<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DevOps Final Project - Ofir, Shai, Mishel, Orel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom right, #ff7eb3, #ff758c);
            color: #ffffff;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .container {
            margin-top: 50px;
            padding: 20px;
        }
        h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        h2 {
            font-size: 1.5em;
            margin-bottom: 30px;
        }
        .names {
            font-size: 1.2em;
            margin-bottom: 20px;
        }
        .form-container {
            background-color: #ffffff;
            color: #000000;
            border-radius: 15px;
            padding: 20px;
            max-width: 500px;
            margin: auto;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"] {
            padding: 10px;
            width: calc(100% - 22px);
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        button:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            font-size: 0.9em;
            display: none;
            margin-top: 5px;
        }
        .success {
            color: green;
            font-size: 1.1em;
            display: none;
            margin-top: 15px;
            font-weight: bold;
            padding: 10px;
            background-color: #e8f5e9;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="names">Project by: Ofir, Shai, Mishel, Orel</div>
        <h1>DevOps Final Project</h1>
        <h2>
            Our mission is to deliver our application from development into production,
            leveraging the knowledge we gained in DevOps course: Orchestrate, control, deploy,
            automate, monitor, and performance test/analysis!
        </h2>

        <div class="form-container">
            <form id="validationForm" onsubmit="return validateForm(event)">
                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" maxlength="10" />
                    <div id="phoneError" class="error"></div>
                </div>
                <div class="form-group">
                    <label for="firstName">First Name:</label>
                    <input type="text" id="firstName" name="firstName" maxlength="30" />
                    <div id="nameError" class="error"></div>
                </div>
                <button type="submit">Submit</button>
                <div id="formSuccess" class="success">Form submitted successfully! All fields are valid.</div>
            </form>
        </div>
    </div>

    <script>
        function validateForm(event) {
            event.preventDefault();
            
            const phoneNumber = document.getElementById("phoneNumber").value.trim();
            const firstName = document.getElementById("firstName").value.trim();
            
            const phoneError = document.getElementById("phoneError");
            const nameError = document.getElementById("nameError");
            const formSuccess = document.getElementById("formSuccess");
            
            // Reset all messages
            phoneError.style.display = "none";
            nameError.style.display = "none";
            formSuccess.style.display = "none";
            
            let isValid = true;

            // Phone number validation
            if (phoneNumber === "") {
                phoneError.textContent = "Phone number is required";
                phoneError.style.display = "block";
                isValid = false;
            } else if (!/^\d+$/.test(phoneNumber)) {
                phoneError.textContent = "Phone number must contain only digits";
                phoneError.style.display = "block";
                isValid = false;
            } else if (!phoneNumber.startsWith("0")) {
                phoneError.textContent = "Phone number must start with 0";
                phoneError.style.display = "block";
                isValid = false;
            } else if (phoneNumber.length !== 10) {
                phoneError.textContent = "Phone number must be exactly 10 digits";
                phoneError.style.display = "block";
                isValid = false;
            }

            // First name validation
            if (firstName === "") {
                nameError.textContent = "First name is required";
                nameError.style.display = "block";
                isValid = false;
            } else if (!/^[A-Za-z]+$/.test(firstName)) {
                nameError.textContent = "First name must contain only English letters";
                nameError.style.display = "block";
                isValid = false;
            } else if (firstName.length > 30) {
                nameError.textContent = "First name cannot be longer than 30 characters";
                nameError.style.display = "block";
                isValid = false;
            }

            // Show success message if everything is valid
            if (isValid) {
                formSuccess.style.display = "block";
            }

            return isValid;
        }
    </script>
</body>
</html>