package controller;

import model.Mezzo;
import model.Prenotazione;
import model.Utente;
import persistence.MezzoDAO;
import persistence.PrenotazioneDAO;
import util.SessionUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/customer-home")
public class CustomerHomeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utente loginedUser = SessionUtil.getLoginedUser(session);
        PrenotazioneDAO daoP = null;
        MezzoDAO daoM = null;


        if(loginedUser!=null){
            daoP = new PrenotazioneDAO();
            daoM = new MezzoDAO();

            List<Prenotazione> prenotazioni = daoP.findPrenotazioneUtente(loginedUser.getId());
            List<Mezzo> mezzi = daoM.findAll();

            request.setAttribute("prenotazioni", prenotazioni);
            request.setAttribute("mezzi", mezzi);
            RequestDispatcher dispatcher = this.getServletContext()
                    .getRequestDispatcher("/WEB-INF/views/CustomerHome.jsp");
            dispatcher.forward(request, response);
        }


    }
}
