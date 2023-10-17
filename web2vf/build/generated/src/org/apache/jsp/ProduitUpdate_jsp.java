package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import ma.projet.entities.Produit;
import ma.projet.services.ProduitService;
import ma.projet.entities.Categorie;
import ma.projet.services.CategorieService;

public final class ProduitUpdate_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>ProduitUpdate Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            int id = Integer.parseInt(request.getParameter("id"));
        ProduitService  ps =new ProduitService();
        Produit produit=ps.getById(id);
        
      out.write("\n");
      out.write("        <form action=\"ProduitController?op=updateOK\">\n");
      out.write("            <fieldset>\n");
      out.write("                <legend>Mise a jour des Produits</legend>\n");
      out.write("                <input type=\"hidden\" name=\"idOK\" value=\"");
      out.print( produit.getId() );
      out.write("\" />\n");
      out.write("                \n");
      out.write("                 <table border=\"0\">\n");
      out.write("                 \n");
      out.write("                    \n");
      out.write("                        <tr>\n");
      out.write("                            <td>Reference: </td>\n");
      out.write("                            <td><input type=\"text\" name=\"referenceOK\" value=\"");
      out.print( produit.getReference() );
      out.write("\" /></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Prix : </td>\n");
      out.write("                            <td><input type=\"text\" name=\"prixOK\" value=\"");
      out.print( produit.getPrix() );
      out.write("\" /></td>\n");
      out.write("                        </tr>\n");
      out.write("                    \n");
      out.write("                         <tr>\n");
      out.write("    <td>Catégories: </td>\n");
      out.write("    <td>\n");
      out.write("        <select name=\"categorieOK\">\n");
      out.write("            <option name =\"categorieOK\" value=\"");
      out.print(produit.getCategorie().getId() );
      out.write('"');
      out.write('>');
      out.print(produit.getCategorie() );
      out.write(" </option>\n");
      out.write("    \n");
      out.write("        </select>\n");
      out.write("    </td>\n");
      out.write("</tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td><input type=\"submit\" value=\"Valider\"/></td>\n");
      out.write("                            <td></td>\n");
      out.write("                        </tr>\n");
      out.write("               \n");
      out.write("                </table>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("        \n");
      out.write("        </fieldset>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
