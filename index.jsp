<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Validation</title>
    <style>
        .error {
            color: red;
            margin-top: 5px;
        }
        .success {
            color: green;
            display: none;
            margin-top: 10px;
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 15px;
        }
        input[type="text"] {
            padding: 5px;
            width: 200px;
        }
        button {
            padding: 8px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        function validateForm(event) {
			boolean disable_selenium = false;
			if(disable_selenium) {
				event.preventDefault();

				// Get form values
				const phoneNumber = document.getElementById("phoneNumber").value.trim();
				const firstName = document.getElementById("firstName").value.trim();

				// Error message elements
				const phoneError = document.getElementById("phoneError");
				const nameError = document.getElementById("nameError");
				const successMessage = document.getElementById("successMessage");

				// Reset error messages
				phoneError.innerHTML = "";
				nameError.innerHTML = "";
				successMessage.style.display = "none";

				let valid = true;

				// Validate phone number
				if (!phoneNumber.startsWith("0")) {
					phoneError.innerHTML += "<p>Phone number must start with 0.</p>";
					valid = false;
				}
				if (phoneNumber.length !== 10 || isNaN(phoneNumber)) {
					phoneError.innerHTML += "<p>Phone number must be exactly 10 digits long.</p>";
					valid = false;
				}

				// Validate first name
				if (firstName === "") {
					nameError.innerHTML += "<p>First name cannot be empty.</p>";
					valid = false;
				} else {
					if (!/^[A-Za-z]+$/.test(firstName)) {
						nameError.innerHTML += "<p>First name must contain only English letters.</p>";
						valid = false;
					}
					if (firstName.length > 30) {
						nameError.innerHTML += "<p>First name cannot be longer than 30 characters.</p>";
						valid = false;
					}
				}

				// If valid, display success message
				if (valid) {
					successMessage.textContent = "Form submitted successfully!";
					successMessage.style.display = "block";
				}
			}
        }
    </script>
</head>
<body>
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
</body>
</html>
