package controller;

import model.Categoria;
import model.Evento;
import model.Prenotazione;
import model.Utente;
import persistence.CategoriaDAO;
import persistence.EventoDAO;
import persistence.PrenotazioneDAO;
import persistence.UtenteDAO;
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

@WebServlet("/admin-home")
public class AdminHomeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Utente loginedUser = SessionUtil.getLoginedUser(session);
        PrenotazioneDAO dao = null;
        CategoriaDAO daoC = null;
        UtenteDAO daoU = null;

        String action = request.getParameter("action");


        if(loginedUser!=null){

            daoU = new UtenteDAO();
            dao = new PrenotazioneDAO();
            daoC = new CategoriaDAO();

            List<Prenotazione> prenotazioni = dao.findPrenotazioneNonApprovate();
            List<Categoria> categorie = daoC.findAll();
            List<Utente> customers = daoU.findCustomers();

            request.setAttribute("customers", customers);
            request.setAttribute("prenotazioni", prenotazioni);
            request.setAttribute("categorie", categorie);

            if (action != null && action.equalsIgnoreCase("eventi")){
                Long id = Long.parseLong(request.getParameter("Id"));
                EventoDAO daoE = new EventoDAO();
                List<Evento> eventiUtente = daoE.findEventiUtente(id);
                request.setAttribute("eventiUtente", eventiUtente);

                RequestDispatcher dispatcher = this.getServletContext()
                        .getRequestDispatcher("/WEB-INF/views/SuperUserHome.jsp");
                dispatcher.forward(request, response);

            } else if (action != null && action.equalsIgnoreCase("prenotazioni")){
                Long id = Long.parseLong(request.getParameter("Id"));
                List<Prenotazione> prenotazioniUtente = dao.findPrenotazioniUtente(id);
                request.setAttribute("prenotazioniUtente", prenotazioniUtente);

                RequestDispatcher dispatcher = this.getServletContext()
                        .getRequestDispatcher("/WEB-INF/views/SuperUserHome.jsp");
                dispatcher.forward(request, response);

            } else {
                RequestDispatcher dispatcher = this.getServletContext()
                        .getRequestDispatcher("/WEB-INF/views/SuperUserHome.jsp");
                dispatcher.forward(request, response);
            }
        } else
            response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}
