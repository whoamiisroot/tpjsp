<%@page import="ma.projet.services.LigneCommandeProduitService"%>
<%@page import="ma.projet.entities.LigneCommandeProduit"%>
<%@page import="ma.projet.entities.Commande"%>
<%@page import="ma.projet.services.CommandeService"%>
<%@page import="java.util.List"%>
<%@page import="ma.projet.entities.Produit"%>
<%@page import="ma.projet.services.ProduitService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>filtrage1 Page</title>
</head>
<body>
    <jsp:include page="index.html" />
    <fieldset>
        <form method="post" action="">
             <label for="commandeId">Sélectionnez l'ID de la commande:</label>
           
             <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="commandeId">
             <%
         CommandeService cs = new CommandeService();
         for (Commande c:cs.findAll()){
        %>
            
            
            <option name ="commandeId" value="<%=c.getId() %>"><%=c.getId() %> </option>
           
             <%}%>
        </select>
           <p style="text-align: center;"><input type="submit" class="btn btn-dark btn-outline-secondary" value="Afficher la commande" name="valider" /></p>
         
        </form>
       
        <%
            String commandeIdStr = request.getParameter("commandeId");
            int commandeId = 0;
            
            if (commandeIdStr != null && !commandeIdStr.isEmpty()) {
                try {
                    commandeId = Integer.parseInt(commandeIdStr);
                } catch (NumberFormatException e) {
                    // Gérer les erreurs de conversion si nécessaire
                }
            }
            
            if (commandeId > 0) {
              
                ProduitService ps = new ProduitService();
                LigneCommandeProduitService lcps = new LigneCommandeProduitService();
                List<LigneCommandeProduit> laliste = ps.findProduitByCommandeSansAffichage(cs.getById(commandeId));
        %>
        <table border="0">
            <tr>
                <td>Commande:</td>
                <td><%= cs.getById(commandeId).getId() %></td>
            </tr>
            <tr>
                <td>Date :</td>
                <td><%= cs.getById(commandeId).getDate() %></td>
            </tr>
            <tr> <td>Prix Total:</td>
                
                 <%
                 int i=0;
                    for (LigneCommandeProduit p : laliste) {
                        i+=p.getProduit().getPrix();
                        
                    }
                        %>
                
              
              
                
                <td><%= i %></td></tr>
        </table>
        <legend>Liste des Produits</legend>
        <table border="0">
            <thead>
                <tr>
                    <th>Reference:</th>
                    <th>Prix</th>
                    <th>Quantité</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (LigneCommandeProduit p : laliste) {
                %>
                <tr>
                    <td><%= p.getProduit().getReference() %></td>
                    <td><%= p.getProduit().getPrix() %></td>
                    <td><%= p.getQuantite() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            }
        %>
    </fieldset>
</body>
</html>
