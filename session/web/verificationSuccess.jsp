<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Verification Code</title>
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
            font-size: 14px;
            line-height: 1.5;
            background-color: #2c3338;
            color: #606468;
            height: 100%;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin: 0;
        }

        h1, p {
            color: #eee;
            text-align: center;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .form-container input[type="text"] {
            padding: 1rem;
            margin: 1rem 0;
            border-radius: 0.25rem;
        }

        .form-container button {
            background-color: #ea4c88;
            color: #eee;
            font-weight: 700;
            text-transform: uppercase;
            padding: 1rem;
            border: none;
            border-radius: 0.25rem;
            cursor: pointer;
            margin-top: 1rem;
        }

        .form-container button:hover {
            background-color: #d44179;
        }
    </style>
    <script type="text/javascript">
        function verifyCode() {
            var enteredCode = document.getElementById("verificationCode").value;
            var storedCode = "<%= request.getSession().getAttribute("verificationCode") %>"; // Retrieve the stored code from the session

            if (enteredCode === storedCode) {
                // Codes match, show a confirmation
                var confirmation = confirm("Verification code matches. Do you want to proceed?");
                if (confirmation) {
                    // If user confirms, redirect to the next page
                    window.location.href = "passwordReset.jsp"; // Replace with your desired URL
                }
            } else {
                alert("Verification code does not match. Please try again.");
            }
        }
    </script>
</head>

<body>
    <h1>Verification Code</h1>
    <div class="form-container">
        
        <input type="text" id="verificationCode" placeholder="Verification Code">
        <button onclick="verifyCode()">Verify Code</button>
    </div>
</body>

</html>
