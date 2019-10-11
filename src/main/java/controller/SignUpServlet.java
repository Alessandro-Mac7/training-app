package controller;

import model.Tipologia;
import model.Utente;
import persistence.TipologiaDAO;
import persistence.UtenteDAO;
import util.PasswordUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/sign-up")
public class SignUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Tipologia tipologia = null;
        if (request.getParameter("superuser") == null){

            tipologia = new TipologiaDAO().findName("User");
        } else {
            tipologia = new TipologiaDAO().findName("SuperUser");
        }

        Date date = null;
        try {
            date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("born-date"));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Utente utente = new Utente();

        if(request.getParameter("id")!=null)
            utente.setId(Long.parseLong(request.getParameter("id")));

        utente.setCognome(request.getParameter("surname"));
        utente.setData(new java.sql.Date(date.getTime()));
        utente.setNome(request.getParameter("name"));
        utente.setUsername(request.getParameter("email"));
        String salt = PasswordUtils.getSalt(30);
        String encryptedPsw = PasswordUtils.generateSecurePassword(request.getParameter("pwd"), salt);
        utente.setSalt(salt);
        utente.setPassword(encryptedPsw);
        utente.setTipologia(tipologia);

        UtenteDAO dao = new UtenteDAO();
        dao.create(utente);
        response.getWriter().write("success");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
