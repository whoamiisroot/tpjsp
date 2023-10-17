/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.projet.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ma.projet.entities.Commande;
import ma.projet.services.CommandeService;
import ma.projet.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author cherk
 */
@WebServlet(name = "CommandeController", urlPatterns = {"/CommandeController"})
public class CommandeController extends HttpServlet {

    private CommandeService cs;

    public CommandeController() throws ServletException {
        super.init();
        cs = new CommandeService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("op") != null) {
            String op = request.getParameter("op");
            if (op.equals("delete")) {
                int commandeId = Integer.parseInt(request.getParameter("id"));

                // Check if the command contains products
                if (hasProductsInCommand(commandeId)) {
                    // Add a parameter to the URL to indicate that the command cannot be deleted
                    response.sendRedirect("Commande.jsp?commandeInUse=true");
                } else {
                    // Continue with command deletion if it doesn't contain products
                    cs.delete(cs.getById(commandeId));
                    response.sendRedirect("Commande.jsp");
                }
            } else if (op.equals("update")) {
                RequestDispatcher rd = request.getRequestDispatcher("CommandeUpdate.jsp");
                rd.forward(request, response);
            } else if (op.equals("updateOK")) {
                doUpdate(request, response);
            } else if (op.equals("Vide")) {
                response.sendRedirect("Commande.jsp");

            }

        } else {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            try {
                Date date = sdf.parse(request.getParameter("date"));
                Commande commande = new Commande(date);
                cs.create(commande);
                response.sendRedirect("Commande.jsp");
            } catch (java.text.ParseException e) {
                e.printStackTrace();
            }

        }
    }

    public boolean hasProductsInCommand(int commandeId) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();

            String hql = "select count(*) from LigneCommandeProduit lcp where lcp.commande.id = :commandeId";
            Query query = session.createQuery(hql);
            query.setParameter("commandeId", commandeId);

            Long count = (Long) query.uniqueResult();
            tx.commit();

            // If the count is greater than 0, the command contains products
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
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date date = sdf.parse(request.getParameter("dateOk"));
            cs.update(id, date);
            response.sendRedirect("Commande.jsp");
        } catch (java.text.ParseException e) {
            e.printStackTrace();}}

}
