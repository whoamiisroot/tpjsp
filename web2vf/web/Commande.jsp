<%@page import="ma.projet.services.CommandeService" %>
<%@page import="ma.projet.entities.Commande"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commande Page</title>
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

    var commandeInUse = getUrlParameter('commandeInUse');
    
    if (commandeInUse === 'true') {
        $(document).ready(function() {
            $('#myModal').modal('show');
        });
    }
</script>

    </head>
    <body>
        <jsp:include page="index.html"/>
          <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Error</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">
                    Command contain products
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
 
        <form action="CommandeController" method="post">
            <fieldset>
                <legend>
                    Gestions des Commandes
                </legend>
                <table>
                    <thead>
                        <tr>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tr>
                        <td ><input  class="date-input" type="date" name="date" value=""></td>
                    </tr>
                    
                
                </table>
             <p style="text-align: center;"><input type="submit" class="btn btn-dark btn-outline-secondary" value="Valider" name="valider" /></p>
            </fieldset>



        </form>
        <fieldset>
            <legend>Liste des Commandes</legend>
                <table>
                    <thead>
                        <tr><th>date</th>
                        <th>Supprimer</th>
                        <th>Modifier</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            CommandeService cs = new CommandeService();
                            for (Commande c : cs.findAll()) {
                        %>
                        <tr><td><%= c.getDate() %></td>
                            <td><a type="button" class="btn btn-outline-danger"  href="CommandeController?op=delete&id=<%=c.getId() %>">Supprimer </a> </td>
                         <td><a type="button" class="btn btn-outline-success" href="CommandeController?op=update&id=<%=c.getId()%>"> Modifier</a> </td>
                        
                        </tr>



                        <%}
                        %>

                    </tbody>


                </table>
            
        </fieldset>


    </body>
</html>
