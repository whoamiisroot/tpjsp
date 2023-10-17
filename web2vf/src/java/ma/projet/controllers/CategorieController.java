/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.projet.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ma.projet.entities.Categorie;
import ma.projet.services.CategorieService;

/**
 *
 * @author Lachgar
 */
@WebServlet(name = "CategorieController", urlPatterns = {"/CategorieController"})
public class CategorieController extends HttpServlet {

    private CategorieService cs;

    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        cs = new CategorieService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("op") != null) {
            String op = request.getParameter("op");
            if (op.equals("delete")) {
                cs.delete(cs.getById(Integer.parseInt(request.getParameter("id"))));
                response.sendRedirect("Categorie.jsp");////la redirection
            }
            else if (op.equals("update")){
                RequestDispatcher rd= request.getRequestDispatcher("CategorieUpdate.jsp");
                rd.forward(request,response);    
            } else if (op.equals("updateOK")){
                 doUpdate(request, response);   
            }else if(op.equals("Vide")){
                response.sendRedirect("Categorie.jsp");
                
            }

        } else {

            String code = request.getParameter("code");
            String libelle = request.getParameter("libelle");
            cs.create(new Categorie(code, libelle));
            response.sendRedirect("Categorie.jsp");////la redirection
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
        return "Short description";
    }
    
        
  protected void doUpdate(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("idOK"));
    String code = request.getParameter("codeOK");
    String libelle = request.getParameter("libelleOK");
     cs.update(id,code,libelle);
   response.sendRedirect("Categorie.jsp");
}


    

}
