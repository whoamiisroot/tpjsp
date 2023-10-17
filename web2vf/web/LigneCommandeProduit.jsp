<%@page import="ma.projet.entities.LigneCommandeProduit"%>
<%@page import="ma.projet.services.LigneCommandeProduitService"%>
<%@page import="ma.projet.entities.Commande"%>
<%@page import="ma.projet.services.CommandeService"%>
<%@page import="ma.projet.entities.Categorie"%>
<%@page import="ma.projet.services.CategorieService"%>
<%@page import="ma.projet.services.ProduitService"%>
<%@page import="ma.projet.entities.Produit"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CommandeProduit Page</title>
    </head>
    <body>
        
       
         <jsp:include page="index.html" />


        <form action="LigneCommandeProduitController">
            <fieldset>
                <legend>Gestion des Produits</legend>
                <table border="0">
                 
                          <tr>
    <td>Produit </td>
    <td>
        <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="produitId">
             <%
         ProduitService ps = new ProduitService();
         for (Produit p:ps.findAll()){
        %>
            
            
            <option name ="produitId" value="<%=p.getId() %>"><%=p.getId() %> </option>
           
             <%}%>
        </select>
    </td>
</tr>
                                     <tr>
    <td>Commande : </td>
    <td>
        <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="commandeId">
             <%
         CommandeService cs = new CommandeService();
         for (Commande c:cs.findAll()){
        %>
            
            
            <option name ="commandeId" value="<%=c.getId() %>"><%=c.getId() %> </option>
           
             <%}%>
        </select>
    </td>
</tr>   
 
                    
                        <tr>
                            <td>Quantité : </td>
                            <td><input type="text" name="quantite" value="" /></td>
                        </tr>
                    
                        
                        
               
                </table>
<p style="text-align: center;"><input type="submit" class="btn btn-dark btn-outline-secondary" value="Valider" name="valider" /></p>
            </fieldset>
        </form>
        
        <fieldset>
            <legend>Liste des Relations Commande & Produit</legend>
            <table border="0">
                <thead>
                    <tr>
                        <th>Commande</th>
                        <th>Produit</th>
                        <th>Quantité</th>
                        <th>Supprimer</th>
                       <th>Modifier</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        LigneCommandeProduitService cps = new LigneCommandeProduitService();
                      for(LigneCommandeProduit cp : cps.findAll()){  
                    %>
                    <tr>
                        <td><%=cp.getCommande().getId()  %></td>
                        <td><%= cp.getProduit().getId() %></td>
                         <td><%= cp.getQuantite() %></td>
                        <td>
    <a type="button" class="btn btn-outline-danger" href="LigneCommandeProduitController?op=delete&commandeId=<%= cp.getCommande().getId() %>&produitId=<%= cp.getProduit().getId() %>">
        Supprimer
    </a>
</td>
 <td>
    <a type="button" class="btn btn-outline-success" href="LigneCommandeProduitController?op=update&commandeId=<%= cp.getCommande().getId() %>&produitId=<%= cp.getProduit().getId() %>&quantite=<%= cp.getQuantite() %>">
        Modifier
    </a>
</td>
    
                    
                    </tr>
                            
                    <%}%>
                </tbody>
            </table>

        </fieldset>
    </body>
</html>
