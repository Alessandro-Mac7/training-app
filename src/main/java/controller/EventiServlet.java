package controller;

import model.*;
import persistence.CategoriaDAO;
import persistence.EventoDAO;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/eventi")
public class EventiServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrenotazioneDAO daoP = new PrenotazioneDAO();
        EventoDAO daoE = new EventoDAO();

        Evento evento = new Evento();
        Prenotazione prenotazione = daoP.find(Long.parseLong(request.getParameter("prenotazione")));

        if(request.getParameter("id")!=null)
            evento.setId(Long.parseLong(request.getParameter("id")));

        evento.setTipo(request.getParameter("tipo"));
        evento.setPrenotazione(prenotazione);

        daoE.create(evento);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utente loginedUser = SessionUtil.getLoginedUser(session);
        EventoDAO daoE = null;
        String action = request.getParameter("action");

        if(loginedUser!=null){

            if (action != null && action.equalsIgnoreCase("delete")){
                daoE = new EventoDAO();
                Long eventoId = Long.parseLong(request.getParameter("Id"));
                Evento e = daoE.find(eventoId);
                daoE.delete(e);
                response.getWriter().write("success");
            } else if (action != null && action.equalsIgnoreCase("edit")) {
                PrenotazioneDAO daoP = new PrenotazioneDAO();
                List<Prenotazione> prenotazioni = daoP.findAll();
                Long id = Long.parseLong(request.getParameter("Id"));

                daoE = new EventoDAO();
                Evento e = daoE.find(id);

                request.setAttribute("prenotazioni", prenotazioni);
                request.setAttribute("editevento", e);
                RequestDispatcher dispatcher = this.getServletContext()
                        .getRequestDispatcher("/WEB-INF/views/Eventi.jsp");
                dispatcher.forward(request, response);

            } else{
                daoE = new EventoDAO();
                List<Evento> eventi = daoE.findAll();

                PrenotazioneDAO daoP = new PrenotazioneDAO();
                List<Prenotazione> prenotazioni = daoP.findAll();

                request.setAttribute("eventi", eventi);
                request.setAttribute("prenotazioni", prenotazioni);

                if(loginedUser.getTipologia().getNome().equals("SuperUser")){
                    RequestDispatcher dispatcher = this.getServletContext()
                            .getRequestDispatcher("/WEB-INF/views/Eventi.jsp");
                    dispatcher.forward(request, response);
                } else {
                    RequestDispatcher dispatcher = this.getServletContext()
                            .getRequestDispatcher("/WEB-INF/views/EventiCustomer.jsp");
                    dispatcher.forward(request, response);
                }

            }
        } else
            response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}
