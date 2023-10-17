<%-- 
    Document   : LigneCommandeProduitUpdate
    Created on : 07-Oct-2023, 13:06:47
    Author     : cherk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>commandeProduit Page</title>
    </head>
    <body>
        <jsp:include page="index.html"/>
        <%
      int commandeId = Integer.parseInt(request.getParameter("commandeId"));
      int produitId = Integer.parseInt(request.getParameter("produitId"));
       int quantite = Integer.parseInt(request.getParameter("quantite"));
       
        %>
        
        <form action="LigneCommandeProduitController?op=updateOK" method="post">
            <fieldset>
                <legend> Liste des commandes produits</legend>
                
          
            <table>
                 <tr>
                <td>La commande :</td>
                <td>
                    <input name="commandeIdOK" value="<%= commandeId %>" readonly/>
                </td>
            </tr>
                  <tr>
                <td>Le produit :</td>
                <td>
                    <input name="produitIdOK" value="<%= produitId %>" readonly/>
                </td>
                
            </tr>
            <tr>
                <td>Quantité</td>
                <td>
                    <input name="quantiteOK" value="<%= quantite%>">
                </td>
            
            </tr>
            </table>
            
            <p style="text-align: center;"><input type="submit" class="btn btn-dark btn-outline-secondary" value="Mise à Jour" /></p>
      
              </fieldset>
        </form>
    </body>
</html>
