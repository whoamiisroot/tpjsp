/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.projet.test;

import java.util.List;
import ma.projet.entities.Produit;
import ma.projet.services.ProduitService;
import ma.projet.util.HibernateUtil;
import sun.applet.Main;

/**
 *
 * @author Lachgar
 */
public class Test {
    public static void main (String [] args){
     HibernateUtil.getSessionFactory();
//         ProduitService produitService = new ProduitService();
//List<Produit> produitsPrixSuperieur = produitService.findProduitsPrixSuperieur(); 
    }
}
