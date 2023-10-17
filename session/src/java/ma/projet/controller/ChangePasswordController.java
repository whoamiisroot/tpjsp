package ma.projet.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ma.projet.entity.Client;
import ma.projet.service.ClientService;

@WebServlet(name = "ChangePasswordController", urlPatterns = {"/ChangePassword"})
public class ChangePasswordController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
String email = (String) request.getSession().getAttribute("userEmail");
String password = request.getParameter("password"); // Get the new password from the form input

        // Use your ClientService to update the password for the given email
        ClientService clientService = new ClientService();
        Client client = clientService.getByEmail(email);
        // Implement this method in your service
        System.out.println("email: " + email);
        
        System.out.println("Value of client: " + client);
        if (client != null) {
            System.out.println("Client is not null."); // Print statement added to check if the client is not null
            client.setPassword(password);
            clientService.update(client);
            response.sendRedirect("welcomeEmploye.jsp"); // Redirect to a success page
        } else {
            // Handle the case when the client is not found
            System.out.println("Client is null."); // Print statement added to check if the client is null
            request.setAttribute("error", "Client not found. Please try again."); // Set an attribute for error handling

            // Forward the request back to the change password form
            RequestDispatcher dispatcher = request.getRequestDispatcher("changePassword.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Change Password Servlet";
    }
}
