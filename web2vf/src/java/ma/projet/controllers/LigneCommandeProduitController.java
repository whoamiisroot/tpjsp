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
import ma.projet.entities.Commande;
import ma.projet.entities.LigneCommandeProduit;
import ma.projet.entities.LigneCommandeProduitPK;
import ma.projet.entities.Produit;
import ma.projet.services.CategorieService;
import ma.projet.services.CommandeService;
import ma.projet.services.LigneCommandeProduitService;
import ma.projet.services.ProduitService;

/**
 *
 * @author cherk
 */
@WebServlet(name = "LigneCommandeProduitController", urlPatterns = {"/LigneCommandeProduitController"})
public class LigneCommandeProduitController extends HttpServlet {

 
    private LigneCommandeProduitService ps;

    @Override
    public void init() throws ServletException {
        super.init(); 
        ps = new LigneCommandeProduitService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("op") != null) {
            String op=request.getParameter("op");
               if (op.equals("delete")) {
                     int commandeId = Integer.parseInt(request.getParameter("commandeId"));
                     int produitId = Integer.parseInt(request.getParameter("produitId"));
                ps.delete(commandeId,produitId);
                response.sendRedirect("LigneCommandeProduit.jsp");
            }
            else if (op.equals("update")){
                RequestDispatcher rd= request.getRequestDispatcher("LigneCommandeProduitUpdate.jsp");
                rd.forward(request,response);    
            } else if (op.equals("updateOK")){
                 doUpdate(request, response);   
            }else if(op.equals("Vide")){
               response.sendRedirect("LigneCommandeProduit.jsp");
                
            }
           
                
                
            

        } else {

           
            int produitId = Integer.parseInt(request.getParameter("produitId"));
            ProduitService ps=new ProduitService();
            Produit produit=ps.getById(produitId);
            int commandeId = Integer.parseInt(request.getParameter("commandeId"));
             CommandeService cs=new CommandeService();
             Commande commande=  cs.getById(commandeId);
            int quantite = Integer.parseInt(request.getParameter("quantite"));
            LigneCommandeProduitService cps=new LigneCommandeProduitService();
          LigneCommandeProduit lcpk =new LigneCommandeProduit();
          LigneCommandeProduitPK  ccc= new LigneCommandeProduitPK(produitId,commandeId);
           cps.create(new LigneCommandeProduit(ccc,quantite));
            response.sendRedirect("LigneCommandeProduit.jsp");////la redirection
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
    int commandeIdOK = Integer.parseInt(request.getParameter("commandeIdOK"));
       int produitIdOK = Integer.parseInt(request.getParameter("produitIdOK"));
        int Quantite = Integer.parseInt(request.getParameter("quantiteOK"));
   
        
    LigneCommandeProduitService lcps = new LigneCommandeProduitService();
   
    

    lcps.updateLigneCommandeProduit(commandeIdOK,produitIdOK, Quantite);
    
    response.sendRedirect("LigneCommandeProduit.jsp");
}


    

}
