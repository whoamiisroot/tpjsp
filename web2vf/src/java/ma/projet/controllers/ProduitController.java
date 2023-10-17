/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.projet.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ma.projet.entities.Categorie;
import ma.projet.entities.LigneCommandeProduit;
import ma.projet.services.CategorieService;
import ma.projet.services.ProduitService;
import ma.projet.entities.Produit;
import ma.projet.services.LigneCommandeProduitService;
import ma.projet.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Lachgar
 */
@WebServlet(name = "ProduitController", urlPatterns = {"/ProduitController"})
public class ProduitController extends HttpServlet {

    private ProduitService ps;

    @Override
    public void init() throws ServletException {
        super.init(); 
        ps = new ProduitService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("op") != null) {
            String op = request.getParameter("op");
           if (op.equals("delete")) {
            int productId = Integer.parseInt(request.getParameter("id"));
            
     if (isProductInCommand(productId)) {
   response.sendRedirect("Produit.jsp?productInCommand=true");
} else {
    ps.delete(ps.getById(productId));
    response.sendRedirect("Produit.jsp");
}
        } else if (op.equals("update")){
                RequestDispatcher rd= request.getRequestDispatcher("ProduitUpdate.jsp");
                rd.forward(request,response);    
            } else if (op.equals("updateOK")){
                 doUpdate(request, response);   
            }else if(op.equals("Vide")){
                response.sendRedirect("Produit.jsp");
                
            }

        } else {

            String reference = request.getParameter("reference");
            Double prix = Double.parseDouble(request.getParameter("prix"));
            int categ = Integer.parseInt(request.getParameter("categorie"));
            CategorieService cs=new CategorieService();
            Categorie categorie=  cs.getById(categ);
            ps.create(new Produit(reference, prix,categorie));
            response.sendRedirect("Produit.jsp");////la redirection
        }

    }

public boolean isProductInCommand(int productId) {
    Session session = null;
    Transaction tx = null;
    try {
        session = HibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        
        String hql = "select count(*) from LigneCommandeProduit lcp where lcp.produit.id = :productId";
        Query query = session.createQuery(hql);
        query.setParameter("productId", productId);
        
        Long count = (Long) query.uniqueResult();
        tx.commit();
        
        // If the count is greater than 0, the product is in a command
        return count > 0;
    } catch (HibernateException ex) {
        if (tx != null) {
            tx.rollback();
        }
        ex.printStackTrace();
        return false;
    } finally {
        if (session != null) {
            session.close();
        }
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
    
    String reference = request.getParameter("referenceOK");
    Double prix = Double.parseDouble(request.getParameter("prixOK"));
    int categ = Integer.parseInt(request.getParameter("categorieOK"));
    CategorieService cs = new CategorieService();
    Categorie categorie = cs.getById(categ);
    

    ps.update(id, reference, prix, categorie);
    
    response.sendRedirect("Produit.jsp");
}


}
