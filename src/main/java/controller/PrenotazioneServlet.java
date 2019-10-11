package controller;

import model.Evento;
import model.Mezzo;
import model.Prenotazione;
import model.Utente;
import persistence.EventoDAO;
import persistence.MezzoDAO;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/prenotazioni")
public class PrenotazioneServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrenotazioneDAO daoP = new PrenotazioneDAO();
        UtenteDAO daoU = new UtenteDAO();
        MezzoDAO daoM = new MezzoDAO();

        Utente utente = daoU.find(Long.parseLong(request.getParameter("utente")));
        Mezzo mezzo = daoM.find(Long.parseLong(request.getParameter("mezzo")));
        Prenotazione prenotazione = new Prenotazione();

        if(request.getParameter("id")!=null)
            prenotazione.setId(Long.parseLong(request.getParameter( "id")));

        Date data_inizio = null;
        Date data_fine = null;
        try {
            data_inizio = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("data_inizio"));
            data_fine= new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("data_fine"));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        prenotazione.setData_fine(new java.sql.Date(data_fine.getTime()));
        prenotazione.setData_inizio(new java.sql.Date(data_inizio.getTime()));

        if(daoU.utenteMoroso(utente.getId())) {
            if (request.getParameter("approvata") != null)
                prenotazione.setApprovata(Integer.parseInt(request.getParameter("approvata")));
            else {
                prenotazione.setApprovata(0);
            }
        } else
            prenotazione.setApprovata(1);


        prenotazione.setMezzo(mezzo);
        prenotazione.setUtente(utente);

        daoP.create(prenotazione);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utente loginedUser = SessionUtil.getLoginedUser(session);
        PrenotazioneDAO daoP = null;
        String action = request.getParameter("action");

        if(loginedUser!=null){

            if (action != null && action.equalsIgnoreCase("delete")){
                daoP = new PrenotazioneDAO();
                Long prenotazioneId = Long.parseLong(request.getParameter("Id"));
                Prenotazione e = daoP.find(prenotazioneId);
                daoP.delete(e);
                response.getWriter().write("success");
            } else if (action != null && action.equalsIgnoreCase("edit")) {
                UtenteDAO daoU = new UtenteDAO();
                MezzoDAO daoM = new MezzoDAO();


                List<Utente> utenti = daoU.findCustomers();
                List<Mezzo> mezzi = daoM.findAll();

                Long id = Long.parseLong(request.getParameter("Id"));

                daoP = new PrenotazioneDAO();
                Prenotazione prenotazione = daoP.find(id);

                request.setAttribute("editprenotazione", prenotazione);
                request.setAttribute("utenti", utenti);
                request.setAttribute("mezzi", mezzi);
                if(loginedUser.getTipologia().getNome().equals("SuperUser")){
                    RequestDispatcher dispatcher = this.getServletContext()
                            .getRequestDispatcher("/WEB-INF/views/Prenotazioni.jsp");
                    dispatcher.forward(request, response);
                } else {
                    RequestDispatcher dispatcher = this.getServletContext()
                            .getRequestDispatcher("/WEB-INF/views/CustomerHome.jsp");
                    dispatcher.forward(request, response);
                }

            } else{
                daoP = new PrenotazioneDAO();

                List<Prenotazione> prenotazioni = daoP.findAll();


                request.setAttribute("prenotazioni", prenotazioni);

                RequestDispatcher dispatcher = this.getServletContext()
                        .getRequestDispatcher("/WEB-INF/views/Prenotazioni.jsp");
                dispatcher.forward(request, response);
            }
        } else
            response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}
