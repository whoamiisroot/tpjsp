<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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
        }

        /* Layout */
        .align {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }

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

        .form input[type='password'],
        .form input[type='text'],
        .form input[type='submit'] {
            width: 100%;
        }

        .form__field {
            display: flex;
            margin: 0.875rem;
        }

        .form__input {
            flex: 1;
        }

        /* Login Styles */
        .login {
            color: #eee;
        }

        .login label,
        .login input[type='text'],
        .login input[type='password'],
        .login input[type='submit'] {
            border-radius: 0.25rem;
            padding: 1rem;
        }

        .login label {
            background-color: #363b41;
            padding-left: 1.25rem;
            padding-right: 1.25rem;
            border-bottom-right-radius: 0;
            border-top-right-radius: 0;
        }

        .login input[type='password'],
        .login input[type='text'] {
            background-color: #3b4148;
            border-bottom-left-radius: 0;
            border-top-left-radius: 0;
        }

        .login input[type='password']:focus,
        .login input[type='password']:hover,
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

        /* Icon Styles */
        .icons {
            display: none;
        }

        .icon {
            display: inline-block;
            fill: #606468;
            height: 1em;
            width: 1em;
            font-size: 1rem;
            vertical-align: middle;
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
        .error-message {
  color: red;
  text-align: center;
  margin-top: 20px;
  margin-bottom: 20px;
}

    </style>
</head>

<body class="align">
  <div class="grid">
    <form class="form login" action="auth" method="POST">
      <div class="form__field">
        <label for="login__username"><svg class="icon"><use xlink:href="#user"></use></svg><span class="hidden">Username</span></label>
        <input id="login__username" type="text" name="email" class="form__input" placeholder="Email" required>
      </div>
      <div class="form__field">
        <label for="login__password"><svg class="icon"><use xlink:href="#lock"></use></svg><span class="hidden">Password</span></label>
        <input id="login__password" type="password" name="password" class="form__input" placeholder="Password" required>
      </div>
      <div class="form__field">
        <input type="submit" value="Login">
      </div>
    </form>
    <div class="error-message">${msg}</div>
    <p class="text--center">Créer un compte? <a href="Inscription.jsp">Inscription</a></p>
    <p class="text--center"><a href="forgotPassword.jsp">Mot de passe oublié ?</a></p>
  </div>
  <svg xmlns="http://www.w3.org/2000/svg" class="icons">
    <symbol id="arrow-right" viewBox="0 0 1792 1792">
      <path d="M1600 960q0 54-37 91l-651 651q-39 37-91 37-51 0-90-37l-75-75q-38-38-38-91t38-91l293-293H245q-52 0-84.5-37.5T128 1024V896q0-53 32.5-90.5T245 768h704L656 474q-38-36-38-90t38-90l75-75q38-38 90-38 53 0 91 38l651 651q37 35 37 90z"/>
    </symbol>
    <symbol id="lock" viewBox="0 0 1792 1792">
      <path d="M640 768h512V576q0-106-75-181t-181-75-181 75-75 181v192zm832 96v576q0 40-28 68t-68 28H416q-40 0-68-28t-28-68V864q0-40 28-68t68-28h32V576q0-184 132-316t316-132 316 132 132 316v192h32q40 0 68 28t28 68z"/>
    </symbol>
    <symbol id="user" viewBox="0 0 1792 1792">
      <path d="M1600 1405q0 120-73 189.5t-194 69.5H459q-121 0-194-69.5T192 1405q0-53 3.5-103.5t14-109T236 1084t43-97.5 62-81 85.5-53.5T538 832q9 0 42 21.5t74.5 48 108 48T896 971t133.5-21.5 108-48 74.5-48 42-21.5q61 0 111.5 20t85.5 53.5 62 81 43 97.5 26.5 108.5 14 109 3.5 103.5zm-320-893q0 159-112.5 271.5T896 896 624.5 783.5 512 512t112.5-271.5T896 128t271.5 112.5T1280 512z"/>
    </symbol>
  </svg>
</body>

</html>
