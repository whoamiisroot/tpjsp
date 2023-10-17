/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.projet.services;

import java.util.Date;
import java.util.List;
import ma.projet.dao.IDao;
import ma.projet.entities.Commande;
import ma.projet.entities.Produit;
import ma.projet.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Lachgar
 */
public class CommandeService implements IDao<Commande>{
    @Override
    public boolean create(Commande o) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.save(o);
            tx.commit();
            return true;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            return false;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

   
   

    @Override
    public List<Commande> findAll() {
        List<Commande> commandes = null;
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            commandes = session.createQuery("from Commande").list();
            tx.commit();
            return commandes;
        } catch (HibernateException ex) {
            if(tx != null)
                tx.rollback();
            return commandes;
        } finally {
            if(session != null)
                session.close();
        }
    }



    @Override
    public Commande getById(int id) {
        Commande commande = null;
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            commande = (Commande) session.get(Commande.class, id);
            tx.commit();
            return commande;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            return commande;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
   public boolean update(int id,Date date) {
    Session session = null;
    Transaction tx = null;
    try {
        session = HibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        
       Commande   commande = (Commande) session.get(Commande.class, id);

        
        if (commande != null) {
          
            commande.setDate(date);

         
            tx.commit();
            return true;
        } else {
          
            return false;
        }
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
 
    public boolean delete(Commande o) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.delete(o);
            tx.commit();
            return true;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            return false;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

   
}