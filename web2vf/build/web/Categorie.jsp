<%@page import="ma.projet.services.CategorieService"%>
<%@page import="ma.projet.entities.Categorie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorie Page</title>
           <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/js/bootstrap.bundle.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Application titre</title>
    <link rel="stylesheet" href="styles.css"> <!-- Lien vers votre fichier CSS externe -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

    </head>
    <body>
         <jsp:include page="index.html" />


         <form action="CategorieController" method="get">
            <fieldset>
                <legend>Gestion des catégories</legend>
                <table border="0">
                   
                        <tr>
                            <td>Code: </td>
                            <td><input type="text" name="code" value="" /></td>
                        </tr>
                        <tr>
                            <td>Libelle : </td>
                            <td><input type="text" name="libelle" value="" /></td>
                        </tr>






               
                </table>
<p style="text-align: center;"><input type="submit" class="btn btn-dark btn-outline-secondary" value="Valider" name="valider" /></p>
            </fieldset>
        </form>
        
        <fieldset>
            <legend>Liste des catégories</legend>
            <table border="0">
                <thead>
                    <tr>
                        <th>Code</th>
                        <th>Libelle</th>
                        <th>Supprimer</th>
                        <th>Modifier</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        CategorieService cs = new CategorieService();
                      for(Categorie c : cs.findAll()){  
                    %>
                    <tr>
                        <td><%= c.getCode() %></td>
                        <td><%= c.getLibelle() %></td>
                        <td><a type="button" class="btn btn-outline-danger" href="CategorieController?op=delete&id=<%=c.getId() %>">Supprimer</a></td>
                        <td><a type="button" class="btn btn-outline-success" href="CategorieController?op=update&id=<%=c.getId()%>">Modifier</a></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </fieldset>
    </body>
</html>
