/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.projet.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cherk
 */
@WebServlet(name = "FiltrageController", urlPatterns = {"/FiltrageController"})
public class FiltrageController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String filter = request.getParameter("filter");
        
        if (filter != null) {
            if (filter.equals("filtrage1")) {
                response.sendRedirect("Filtrage1.jsp");
            } else if (filter.equals("filtrage2")) {
                
                response.sendRedirect("Filtrage2.jsp");
            } else if (filter.equals("filtrage3")) {
               response.sendRedirect("Filtrage3.jsp");
            }
        } else {
          
           response.sendRedirect("Filtrage1.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
