package controller;

import model.Utente;
import persistence.UtenteDAO;
import util.PasswordUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/auth")
public class AuthServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("mail");
        String psw = req.getParameter("password");
        UtenteDAO dao = new UtenteDAO();
        Utente utente = dao.login(email);

        if(utente!= null){
            String securePassword = utente.getPassword();
            String salt = utente.getSalt();
            boolean match = PasswordUtils.verifyUserPassword(psw, securePassword, salt);

            if(match){
                if (utente.getTipologia().getNome().equals("SuperUser"))
                    resp.sendRedirect(req.getContextPath() + "/admin-home");
                else
                    resp.sendRedirect(req.getContextPath() + "/customer-home");
            }
        }
    }
}
