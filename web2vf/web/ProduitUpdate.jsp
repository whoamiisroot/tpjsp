<%-- 
    Document   : ProduitUpdate
    Created on : 06-Oct-2023, 21:14:08
    Author     : cherk
--%>

<%@page import="ma.projet.entities.Produit"%>
<%@page import="ma.projet.services.ProduitService"%>
<%@page import="ma.projet.entities.Categorie"%>
<%@page import="ma.projet.services.CategorieService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ProduitUpdate Page</title>
    </head>
    <body>
        <jsp:include page="index.html"/>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            ProduitService ps = new ProduitService();
            Produit produit = ps.getById(id);
        %>
        <form action="ProduitController?op=updateOK" method="post">
            <fieldset>
                <legend>Mise a jour des Produits</legend>


                <table border="0">


                    <tr>
                        <td>Reference: </td>
                        <td><input type="text" name="referenceOK" value="<%= produit.getReference()%>" /></td>
                    </tr>
                    <tr>
                        <td>Prix : </td>
                        <td><input type="text" name="prixOK" value="<%= produit.getPrix()%>" /></td>
                    </tr>

                    <tr>
                        <td>Catégories: </td>
                        <td>
                            <select name="categorieOK">
                                <option  value="<%=produit.getCategorie().getId()%>"><%=produit.getCategorie()%> </option>
                                <%
                                    CategorieService cs = new CategorieService();
                                    for (Categorie c : cs.findAll()) {
                                        if (c.getId() != produit.getCategorie().getId()) {
                                %>
                                <option  value="<%=c.getId()%>"><%=c.getLibelle()%> </option>
                                <%}
               }%>
                            </select>
                        </td>
                          
                    </tr>

                   
                </table>
<input type="hidden" name="idOK" value="<%= produit.getId()%>" />
  <p style="text-align: center;"><input type="submit" class="btn btn-dark btn-outline-secondary" value="Mise à Jour" /></p>



            </fieldset>
        </form>
    </body>
</html>
