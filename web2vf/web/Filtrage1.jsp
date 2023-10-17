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
        
        <legend>Liste des Produits</legend>
        <table border="0">
            <thead>
                <tr>
                    <th>Reference:</th>
                    <th>Prix</th>
                    <th>Categorie</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ProduitService ps = new ProduitService();
                    List<Produit> produits = ps.findProduitsPrixSuperieur();
                    for (Produit p : produits) {
                %>
                <tr>
                    <td><%= p.getReference() %></td>
                    <td><%= p.getPrix() %></td>
                    <td><%= p.getCategorie().getLibelle() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </fieldset>
</body>
</html>
