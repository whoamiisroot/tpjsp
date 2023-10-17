<%@page import="ma.projet.entity.Client"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        h1 {
            font-size: 24px;
            color: #007BFF;
        }
        p {
            font-size: 16px;
        }
        form {
            margin-top: 20px;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>
</head>
<body>
        <%! Client c;%>
        <%
          if(session==null){
              response.sendRedirect("auth.jsp");
          } else{
              c = (Client)session.getAttribute("client");
          }
        %>
        <h1>Welcome, <%= c.getNom() %></h1>
        
        <!-- You can add specific content for the client here -->

        <form action="logout" method="POST">
            <input type="submit" value="Se déconnecter">
        </form>
    </body>
</html>
