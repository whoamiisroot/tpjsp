<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mot de passe oublié</title>
    <style>
        /* Reset */
        *,
        *::before,
        *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        /* Global Styles */
        body {
            font-family: 'Open Sans', sans-serif;
            font-size: 14px;
            line-height: 1.5;
            background-color: #2c3338;
            color: #606468;
            height: 100%;
            min-height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Layout */
        .grid {
            max-width: 320px;
            width: 90%;
            margin: 0 auto;
        }

        /* Form Styles */
        input[type='submit'] {
            cursor: pointer;
        }

        .form {
            margin: -0.875rem;
        }

        .form input[type='text'],
        .form input[type='submit'] {
            width: 100%;
            border-radius: 0.25rem;
            padding: 1rem;
        }

        /* Login Styles */
        .login {
            color: #eee;
        }

        .login input[type='text'],
        .login input[type='submit'] {
            background-color: #3b4148;
            border-radius: 0.25rem;
            padding: 1rem;
            margin: 0.875rem;
        }

        .login input[type='text']:focus,
        .login input[type='text']:hover {
            background-color: #434a52;
        }

        .login input[type='submit'] {
            background-color: #ea4c88;
            color: #eee;
            font-weight: 700;
            text-transform: uppercase;
        }

        .login input[type='submit']:focus,
        .login input[type='submit']:hover {
            background-color: #d44179;
        }

        /* Text Styles */
        p {
            margin-bottom: 1.5rem;
            margin-top: 1.5rem;
        }

        .text--center {
            text-align: center;
        }

        /* Error message */
        .error-message {
            color: red;
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        /* Hidden Styles */
        .hidden {
            border: 0;
            clip: rect(0 0 0 0);
            height: 1px;
            margin: -1px;
            overflow: hidden;
            padding: 0;
            position: absolute;
            width: 1px;
        }

        /* Anchor Styles */
        a {
            color: #eee;
            outline: 0;
            text-decoration: none;
        }

        a:focus,
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body class="align">
    <div class="grid">
        <form class="form login" action="forgotPassword" method="POST">
    <div class="form__field">
        <input type="text" name="resetEmail" class="form__input" placeholder="Email" required>
    </div>
    <div class="form__field">
        <input type="submit" value="Envoyer le code de vérification">
    </div>
</form>

        <div class="error-message">${msg}</div>
        <p class="text--center">Créer un compte? <a href="Inscription.jsp">Inscription</a></p>
        <!--<p class="text--center"><a href="forgotPassword.jsp">Mot de passe oublié ?</a></p>-->
    </div>
</body>

</html>
