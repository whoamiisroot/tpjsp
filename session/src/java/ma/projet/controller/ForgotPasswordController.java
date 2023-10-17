package ma.projet.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Random;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@WebServlet(name = "ForgotPasswordServlet", urlPatterns = {"/forgotPassword"})
public class ForgotPasswordController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("resetEmail");
                System.out.println("email new : " + email);
                request.getSession().setAttribute("userEmail", email);
        
        // Vérifier si l'adresse e-mail existe (utilisez votre service ClientService pour cela)
        boolean emailExists = true; // Mettez votre logique de vérification ici

        if (emailExists) {
            // Générer un code de vérification aléatoire (par exemple, un code à 6 chiffres)
            String verificationCode = generateVerificationCode();

            // Envoyer le code de vérification par e-mail
            sendVerificationCodeByEmail(email, verificationCode);

            // Stocker le code de vérification dans the session
            request.getSession().setAttribute("verificationCode", verificationCode);

            // Rediriger vers la page "verifyCode.jsp"
response.sendRedirect("verificationSuccess.jsp");
        } else {
            // L'adresse e-mail n'existe pas, renvoyer un message d'erreur vers la page "forgotPassword.jsp"
            request.setAttribute("msg", "Email n'existe pas");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
        }
    }

    private String generateVerificationCode() {
        // Générer un code aléatoire (par exemple, un code à 6 chiffres)
        Random random = new Random();
        int code = 100000 + random.nextInt(900000);
        return String.valueOf(code);
    }

    private void sendVerificationCodeByEmail(String email, String verificationCode) {
        // Utilisez JavaMail pour envoyer le code de vérification par e-mail
        final String username = ""; // Replace with your email
        final String password = ""; // Replace with your email password

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Code de vérification");
            message.setText("Votre code de vérification : " + verificationCode);
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
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
}
