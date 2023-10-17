<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription</title>
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
        .form-container {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            height: 100vh;
        }

        .form {
            max-width: 320px;
            width: 90%;
            margin: 0 auto;
            background-color: #363b41;
            padding: 2rem;
            border-radius: 0.25rem;
            margin-top: 2rem;
        }

        /* Form Styles */
        input[type='submit'] {
            cursor: pointer;
            background-color: #ea4c88;
            color: #eee;
            font-weight: 700;
            text-transform: uppercase;
            border: none;
            border-radius: 0.25rem;
            padding: 1rem;
            margin-top: 1rem;
        }

        input[type='submit']:focus,
        input[type='submit']:hover {
            background-color: #d44179;
        }

        input[type='text'],
        input[type='password'],
        input[type='date'] {
            width: calc(100% - 2rem);
            padding: 1rem;
            margin-bottom: 1rem;
            border-radius: 0.25rem;
            border: 1px solid #606468;
            background-color: #3b4148;
            color: #eee;
        }

        input[type='text']:focus,
        input[type='password']:focus,
        input[type='date']:focus {
            border-color: #434a52;
        }

        /* Text Styles */
        h1 {
            color: #eee;
            margin-bottom: 1.5rem;
        }

        p {
            color: #eee;
            margin-top: 1.5rem;
            text-align: center;
        }

        a {
            color: #eee;
            text-decoration: none;
            margin-top: 1rem;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Icon Styles */
        .icon {
            fill: #606468;
            height: 1em;
            width: 1em;
            font-size: 1rem;
            vertical-align: middle;
            margin-right: 0.5rem;
        }
    </style>
</head>

<body>
    <div class="form-container">
        <h1>Inscription</h1>
        <form class="form" action="Inscription" method="POST">
            <div class="form__field">
                <label for="nom"><svg class="icon"><use xlink:href="#usericon"></use></svg><span class="hidden">Nom</span></label>
                <input type="text" id="nom" name="nom" placeholder="Nom">
            </div>
            <div class="form__field">
                <label for="prenom"><svg class="icon"><use xlink:href="#usericon"></use></svg><span class="hidden">Prénom</span></label>
                <input type="text" id="prenom" name="prenom" placeholder="Prénom">
            </div>
            <div class="form__field">
                <label for="email"><svg class="icon"><use xlink:href="#newemail"></use></svg><span class="hidden">Email</span></label>
                <input type="text" id="email" name="email" placeholder="Email">
            </div>
            <div class="form__field">
                <label for="password"><svg class="icon"><use xlink:href="#passwordnew"></use></svg><span class="hidden">Mot de passe</span></label>
                <input type="password" id="password" name="password" placeholder="Mot de passe">
            </div>
            <div class="form__field">
                <label for="date"><svg class="icon"><use xlink:href="#datenew"></use></svg><span class="hidden">Date de naissance</span></label>
                <input type="date" id="date" name="date" placeholder="Date de naissance">
            </div>
            <input type="submit" value="Valider">
        </form>
        <p>Already have an account? <a href="auth.jsp">Login</a></p>
    </div>
    <svg xmlns="http://www.w3.org/2000/svg" class="icons">
        <symbol id="lock" viewBox="0 0 1792 1792">
            <path d="M640 768h512V576q0-106-75-181t-181-75-181 75-75 181v192zm832 96v576q0 40-28 68t-68 28H416q-40 0-68-28t-28-68V864q0-40 28-68t68-28h32V576q0-184 132-316t316-132 316 132 132 316v192h32q40 0 68 28t28 68z"/>
        </symbol>
        <symbol id="user" viewBox="0 0 1792 1792">
            <path d="M1600 1405q0 120-73 189.5t-194 69.5H459q-121 0-194-69.5T192 1405q0-53 3.5-103.5t14-109T236 1084t43-97.5 62-81 85.5-53.5T538 832q9 0 42 21.5t74.5 48 108 48T896 971t133.5-21.5 108-48 74.5-48 42-21.5q61 0 111.5 20t85.5 53.5 62 81 43 97.5 26.5 108.5 14 109 3.5 103.5zm-320-893q0 159-112.5 271.5T896 896 624.5 783.5 512 512t112.5-271.5T896 128t271.5 112.5T1280 512z"/>
        </symbol>
<symbol id="email" viewBox="0 0 497 511.86">
        <path fill-rule="nonzero" d="M497 227.28c0 29.39-4.56 56.35-13.58 80.75-9.13 24.51-22.07 43.5-38.62 56.98-16.56 13.47-35.66 20.16-57.2 20.16-17.82 0-32.78-5.41-45.09-16.13-12.2-10.82-19.42-24.62-21.75-41.38h-2.44c-8.28 18.04-20.16 32.15-35.66 42.34-15.38 10.07-33.73 15.17-54.85 15.17-31.09 0-55.39-10.62-72.9-31.83-17.5-21.23-26.21-50.08-26.21-86.59 0-42.23 12.21-76.61 36.61-103.03 24.51-26.42 56.66-39.58 96.45-39.58 14.01 0 30.03 1.28 47.86 3.93 17.82 2.55 33.85 6.16 48.17 10.72l-7.75 146v6.79c0 36.92 13.8 55.39 41.28 55.39 18.89 0 34.27-11.14 46.05-33.43 11.78-22.28 17.72-51.24 17.72-86.89 0-37.57-7.64-70.35-23.03-98.58-15.28-28.22-37.13-49.87-65.47-65.15-28.22-15.17-60.69-22.81-97.4-22.81-46.26 0-86.48 9.55-120.64 28.75-34.17 19.21-60.27 46.59-78.31 82.13-18.04 35.54-27.05 76.61-27.05 123.29 0 63.25 16.65 111.84 50.08 145.9 33.32 33.96 81.38 50.93 144.19 50.93 43.51 0 88.71-8.91 135.5-26.74v41.38c-39.79 17.41-84.89 26.11-135.5 26.11-75.23 0-133.58-20.7-175.18-62.08C20.69 408.51 0 350.68 0 276.41c0-53.9 11.04-101.86 33.21-143.99 22.18-42.01 53.8-74.59 94.86-97.72C169.03 11.57 216.14 0 269.19 0c44.56 0 84.14 9.34 118.95 28.12 34.69 18.78 61.53 45.41 80.42 79.9 19 34.48 28.44 74.27 28.44 119.26zm-321.4 40.75c0 52.62 20.17 78.94 60.59 78.94 42.97 0 66.21-32.47 69.93-97.3l4.45-81.07c-14.96-4.14-31.19-6.26-48.81-6.26-26.95 0-48.06 9.34-63.34 28.02-15.18 18.56-22.82 44.56-22.82 77.67z"/>
    </symbol>
<symbol id="newemail" viewBox="0 0 24 24" fill="#080341">
        <path fill-rule="evenodd" clip-rule="evenodd" d="M3.75 5.25L3 6V18L3.75 18.75H20.25L21 18V6L20.25 5.25H3.75ZM4.5 7.6955V17.25H19.5V7.69525L11.9999 14.5136L4.5 7.6955ZM18.3099 6.75H5.68986L11.9999 12.4864L18.3099 6.75Z"/>
    </symbol>
<symbol id="usericon" viewBox="0 0 24 24" fill="#1C274C">
        <circle cx="12" cy="6" r="4" stroke="#1C274C" stroke-width="1.5"/>
        <path d="M19.9975 18C20 17.8358 20 17.669 20 17.5C20 15.0147 16.4183 13 12 13C7.58172 13 4 15.0147 4 17.5C4 19.9853 4 22 12 22C14.231 22 15.8398 21.8433 17 21.5634" stroke="#1C274C" stroke-width="1.5" stroke-linecap="round"/>
    </symbol>
<symbol id="passwordnew" viewBox="0 0 24 24" fill="#1C274C">
        <path fill-rule="evenodd" clip-rule="evenodd" d="M5.25 10.0546V8C5.25 4.27208 8.27208 1.25 12 1.25C15.7279 1.25 18.75 4.27208 18.75 8V10.0546C19.8648 10.1379 20.5907 10.348 21.1213 10.8787C22 11.7574 22 13.1716 22 16C22 18.8284 22 20.2426 21.1213 21.1213C20.2426 22 18.8284 22 16 22H8C5.17157 22 3.75736 22 2.87868 21.1213C2 20.2426 2 18.8284 2 16C2 13.1716 2 11.7574 2.87868 10.8787C3.40931 10.348 4.13525 10.1379 5.25 10.0546ZM6.75 8C6.75 5.10051 9.10051 2.75 12 2.75C14.8995 2.75 17.25 5.10051 17.25 8V10.0036C16.867 10 16.4515 10 16 10H8C7.54849 10 7.13301 10 6.75 10.0036V8ZM14 16C14 17.1046 13.1046 18 12 18C10.8954 18 10 17.1046 10 16C10 14.8954 10.8954 14 12 14C13.1046 14 14 14.8954 14 16Z"/>
    </symbol>
<symbol id="datenew" viewBox="0 0 24 24" fill="#1C274C">
        <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
        <g id="SVGRepo_iconCarrier">
            <path d="M6,22H18a3,3,0,0,0,3-3V7a2,2,0,0,0-2-2H17V3a1,1,0,0,0-2,0V5H9V3A1,1,0,0,0,7,3V5H5A2,2,0,0,0,3,7V19A3,3,0,0,0,6,22ZM5,12.5a.5.5,0,0,1,.5-.5h13a.5.5,0,0,1,.5.5V19a1,1,0,0,1-1,1H6a1,1,0,0,1-1-1Z"></path>
        </g>
    </symbol>
    </svg>
</body>

</html>
