<%@page import="ma.projet.entities.Categorie"%>
<%@page import="ma.projet.services.CategorieService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CategorieUpdate Page</title>
</head>
<body>
    <jsp:include page="index.html"/>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    CategorieService cs = new CategorieService();
    Categorie categorie1 = cs.getById(id);
%>
<form action="CategorieController?op=updateOK" method="post">
    
    <fieldset>
        <legend>Mise à Jour des catégories</legend>
        <table border="0">
            <tr>
                <td>Code: </td>
                <td><input type="text" name="codeOK" value="<%= categorie1.getCode() %>" /></td>
            </tr>
            <tr>
                <td>Libelle : </td>
                <td><input type="text" name="libelleOK" value="<%= categorie1.getLibelle() %>" /></td>
            </tr>
            <tr>
                <input type="hidden" name="idOK" value="<%= categorie1.getId() %>">
                <td></td>
                  <td style="text-align: center;"><input type="submit" class="btn btn-dark btn-outline-secondary" value="Mise à Jour" /></td>
         
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
