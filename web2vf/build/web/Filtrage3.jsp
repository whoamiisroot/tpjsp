<%@page import="java.text.ParseException"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="ma.projet.services.ProduitService"%>
<%@page import="ma.projet.entities.Produit"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Liste des produits commandés</title>
</head>
<body>
    <jsp:include page="index.html" />
    <fieldset>
        <legend>Liste des produits commandés entre deux dates</legend>
        
        <form method="post" action="">
    <label for="dateDebut">Date de début :</label>
    <input  class="date-input" type="date" name="dateDebut" required>
    
    <label for="dateFin">Date de fin :</label>
    <input  class="date-input" type="date" name="dateFin" required>

    <br>
     <p style="text-align: center;"><input type="submit" class="btn btn-dark btn-outline-secondary" value="Afficher les produits" name="valider" /></p>
</form>

        
        <table border="1">
            <thead>
                <tr>
                    <th>Référence</th>
                    <th>Nom</th>
                    <th>Prix</th>
                    <th>Quantité</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String dateDebutStr = request.getParameter("dateDebut");
                    String dateFinStr = request.getParameter("dateFin");

                    if (dateDebutStr != null && dateFinStr != null) {
                        try {
                            Date dateDebut = new SimpleDateFormat("yyyy-MM-dd").parse(dateDebutStr);
                            Date dateFin = new SimpleDateFormat("yyyy-MM-dd").parse(dateFinStr);

                            ProduitService produitService = new ProduitService();
                            List<Produit> produits = produitService.findBetweenDate(dateDebut, dateFin);

                            for (Produit produit : produits) {
                %>
                <tr>
                    <td><%= produit.getReference() %></td>
                    <td><%= produit.getCategorie() %></td>
                    <td><%= produit.getPrix() %></td>
                    <td><%= produit.getId() %></td>
                </tr>
                <%
                            }
                        } catch (ParseException e) {
                            
                        }
                    }
                %>
            </tbody>
        </table>
    </fieldset>
</body>
</html>
