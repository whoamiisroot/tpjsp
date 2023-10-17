/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.projet.services;

import java.util.List;
import ma.projet.dao.IDao;
import ma.projet.entities.LigneCommandeProduit;
import ma.projet.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;


import java.util.List;
import ma.projet.dao.IDao;
import ma.projet.entities.Commande;
import ma.projet.entities.LigneCommandeProduit;
import ma.projet.entities.Produit;
import ma.projet.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Lachgar
 */
public class LigneCommandeProduitService implements IDao<LigneCommandeProduit> {
     @Override
    public boolean create(LigneCommandeProduit o) {
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
    public List<LigneCommandeProduit> findAll() {
        List<LigneCommandeProduit> ligneCommandeProduits = null;
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            ligneCommandeProduits = session.createQuery("from LigneCommandeProduit").list();
            tx.commit();
            return ligneCommandeProduits;
        } catch (HibernateException ex) {
            if(tx != null)
                tx.rollback();
            return ligneCommandeProduits;
        } finally {
            if(session != null)
                session.close();
        }
    }



    @Override
    public LigneCommandeProduit getById(int id) {
        LigneCommandeProduit ligneCommandeProduit = null;
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            ligneCommandeProduit = (LigneCommandeProduit) session.get(LigneCommandeProduit.class, id);
            tx.commit();
            return ligneCommandeProduit;
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            return ligneCommandeProduit;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
    

    
    
       public boolean update(int id ,int quantite,Commande commande,Produit produit) {
    Session session = null;
    Transaction tx = null;
    try {
        session = HibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        
       LigneCommandeProduit   ligneCommandeProduit = (LigneCommandeProduit) session.get(LigneCommandeProduit.class, id);

        
        if (ligneCommandeProduit != null) {
          
            ligneCommandeProduit.setQuantite(quantite);
            ligneCommandeProduit.setProduit(produit);
            ligneCommandeProduit.setCommande(commande);

         
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
    
    public boolean delete(LigneCommandeProduit o) {
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
   public boolean updateLigneCommandeProduit(int commandeId, int produitId, int nouvelleQuantite) {
    Session session = null;
    Transaction tx = null;
    try {
        session = HibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        String hql = "from LigneCommandeProduit lcp where lcp.commande.id = :commandeId and lcp.produit.id = :produitId";
        Query query = session.createQuery(hql);
        query.setParameter("commandeId", commandeId);
        query.setParameter("produitId", produitId);
        
        LigneCommandeProduit ligne = (LigneCommandeProduit) query.uniqueResult();
        if (ligne != null) {
            ligne.setQuantite(nouvelleQuantite);
            session.update(ligne);
            tx.commit();
            return true;
        }
        return false;
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

    
 public boolean delete(int commandeId, int produitId) {
    Session session = null;
    Transaction tx = null;
    try {
        session = HibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        Commande commande = (Commande) session.get(Commande.class, commandeId);
        Produit produit = (Produit) session.get(Produit.class, produitId);

       
        if (commande != null && produit != null) {
           
            String hql = "delete from LigneCommandeProduit lcp where commande = :commande and produit = :produit";
            Query query = session.createQuery(hql);
            query.setParameter("commande", commande);
            query.setParameter("produit", produit);

            int rowsAffected = query.executeUpdate();

           
            if (rowsAffected > 0) {
                tx.commit();
                return true;
            }
        }
        
        return false;
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

   
}

