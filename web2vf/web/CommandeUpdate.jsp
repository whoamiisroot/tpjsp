
<%@page import="ma.projet.entities.Commande"%>
<%@page import="ma.projet.services.CommandeService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CommandeUpdate Page</title>
    </head>
    <body>
        <jsp:include page="index.html"/>
        <%
            CommandeService cs = new CommandeService();
            Commande commande = cs.getById(Integer.parseInt(request.getParameter("id")));
        %>
        <form action="CommandeController?op=updateOK" method="post">
            <fieldset>
                <legend> Mise_a_jour de la  Commande
                </legend>
                <table border="0">

                    <tr>
                        <td ><strong>Date:</strong> </td>
                       
                    </tr>
                    <tr> <td><input type="date" name="dateOk" value="<%= commande.getDate()%>" /></td></tr>
                    <tr>
                    <input type="hidden" name="idOK" value="<%=commande.getId()%>" /> 
                   <td style="text-align: center;"><input type="submit" class="btn btn-dark btn-outline-secondary" value="Mise à Jour" /></td>
                    </tr>



                </table>
            </fieldset>
        </form>


    </body>
</html>
