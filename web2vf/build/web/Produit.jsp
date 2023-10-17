<%@page import="ma.projet.entities.Categorie"%>
<%@page import="ma.projet.services.CategorieService"%>
<%@page import="ma.projet.services.ProduitService"%>
<%@page import="ma.projet.entities.Produit"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produit Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function getUrlParameter(name) {
        name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
        var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
        var results = regex.exec(location.search);
        return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
    }

    var productInCommand = getUrlParameter('productInCommand');
    
    if (productInCommand === 'true') {
        $(document).ready(function() {
            $('#myModal').modal('show');
        });
    }
</script>


    </head>
    <body>
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Error</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                This product is associated with a command and cannot be deleted.
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


       
         <jsp:include page="index.html" />


        <form action="ProduitController">
            <fieldset>
                <legend>Gestion des Produits</legend>
                <table border="0">
                 
                    
                        <tr>
                            <td>Reference: </td>
                            <td><input type="text" name="reference" value="" /></td>
                        </tr>
                        <tr>
                            <td>Prix : </td>
                            <td><input type="text" name="prix" value="" /></td>
                        </tr>
                    
                         <tr>
    <td>Catégories: </td>
    <td>
        <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="categorie">
             <%
         CategorieService cs = new CategorieService();
         for (Categorie c:cs.findAll()){
        %>
            
            
            <option name ="categorie" value="<%=c.getId()%>"><%=c.getLibelle() %> </option>
           
             <%}%>
        </select>
    </td>
</tr>
                      
               
                </table>
<p style="text-align: center;"><input type="submit" class="btn btn-dark btn-outline-secondary" value="Valider" name="valider" /></p>
            </fieldset>
        </form>
        
        <fieldset>
            <legend>Liste des Produits</legend>
            <table border="0">
                <thead>
                    <tr>
                        <th>Reference:</th>
                        <th>Prix</th>
                        <th>Categories:</th>
                        <th>Supprimer</th>
                        <th>Modifier</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ProduitService ps = new ProduitService();
                      for(Produit p : ps.findAll()){  
                    %>
                    <tr>
                        <td><%= p.getReference() %></td>
                        <td><%= p.getPrix() %></td>
                         <td><%= p.getCategorie() %></td>
<td><a   class="btn btn-outline-danger delete-link"  href="ProduitController?op=delete&id=<%=p.getId() %>">Supprimer</a></td>
<td><a type="button" class="btn btn-outline-success"  href="ProduitController?op=update&id=<%=p.getId()%>">Modifier</a></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </fieldset>
    </body>
</html>
