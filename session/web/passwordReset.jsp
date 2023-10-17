<%@page import="ma.projet.entity.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Password Reset</title>
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
            font-size: 14px;
            line-height: 1.5;
            background-color: #2c3338;
            color: #eee;
            height: 100%;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin: 0;
        }

        h1 {
            color: #eee;
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            margin-top: 1rem;
            margin-bottom: 0.5rem;
        }

        input[type="password"] {
            padding: 1rem;
            margin-bottom: 1rem;
            border-radius: 0.25rem;
            width: 250px;
        }

        input[type="submit"] {
            background-color: #ea4c88;
            color: #eee;
            font-weight: 700;
            text-transform: uppercase;
            padding: 1rem;
            border: none;
            border-radius: 0.25rem;
            cursor: pointer;
            width: 250px;
        }

        input[type="submit"]:hover {
            background-color: #d44179;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-top: 20px;
        }
    </style>
    <script>
        function validatePasswords() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var error = document.getElementById("error");

            if (password !== confirmPassword) {
                error.innerText = "Passwords do not match";
                return false;
            } else {
                error.innerText = "";
                return true;
            }
        }
    </script>
</head>

<body>
    <h1>Change Your Password</h1>

    <form action="ChangePassword" method="POST" onsubmit="return validatePasswords()">
        <label for="password">New Password:</label><br>
        <input type="password" id="password" name="password" required><br><br>

        <label for="confirmPassword">Confirm Password:</label><br>
        <input type="password" id="confirmPassword" name="confirmPassword" required><br><br>

        <input type="submit" value="Reset Password">
        <div class="error-message" id="error"></div>
    </form>
</body>

</html>
