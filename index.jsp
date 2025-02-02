<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DevOps Final Project - Ofir, Sha1, Mishel, Orel</title>
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
        }
        .success {
            color: green;
            display: none;
            font-weight: bold;
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
            <form id="validationForm" onsubmit="validateForm(event)">
                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" />
                    <div id="phoneError" class="error"></div>
                </div>
                <div class="form-group">
                    <label for="firstName">First Name:</label>
                    <input type="text" id="firstName" name="firstName" />
                    <div id="nameError" class="error"></div>
                </div>
                <button type="submit">Submit</button>
                <div id="successMessage" class="success"></div>
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
            const successMessage = document.getElementById("successMessage");

            phoneError.innerHTML = "";
            nameError.innerHTML = "";
            successMessage.style.display = "none";

            let valid = true;

            if (phoneNumber === "") {
                phoneError.innerHTML += "<p>Phone number is required.</p>";
                valid = false;
            }
            else if (!/^\d+$/.test(phoneNumber)) {
               phoneError.textContent = "Phone number must contain only digits";
               valid = false;
            }
            else if (!phoneNumber.startsWith("0")) {
                phoneError.innerHTML += "<p>Phone number must start with 0.</p>";
                valid = false;
            }
            else if (phoneNumber.length !== 10) {
                phoneError.innerHTML += "<p>Phone number must be exactly 10 digits long.</p>";
                valid = false;
            }

            if (firstName === "") {
                nameError.innerHTML += "<p>First name is required.</p>";
                valid = false;
            }
            else if (!/^[A-Za-z]+$/.test(firstName)) {
                nameError.innerHTML += "<p>First name must contain only English letters.</p>";
                valid = false;
            }
            else if (firstName.length > 30) {
                nameError.innerHTML += "<p>First name cannot be longer than 30 characters.</p>";
                valid = false;
            }

            if (valid) {
                successMessage.textContent = "Form submitted successfully!";
                successMessage.style.display = "block";
            }
        }
    </script>
</body>
</html>