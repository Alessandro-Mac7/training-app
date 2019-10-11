package controller;

import model.*;
import persistence.BuonoScontoDAO;
import persistence.CategoriaDAO;
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

@WebServlet("/buonisconto")
public class BuoniscontoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BuonoScontoDAO daoB = new BuonoScontoDAO();
        PrenotazioneDAO daoP = new PrenotazioneDAO();

        BuonoSconto buonoSconto = new BuonoSconto();
        if(request.getParameter("id")!=null)
            buonoSconto.setId(Long.parseLong(request.getParameter("id")));

        Prenotazione prenotazione = daoP.find(Long.parseLong(request.getParameter("prenotazione")));

        buonoSconto.setImporto(Integer.parseInt(request.getParameter("importo")));
        buonoSconto.setPrenotazione(prenotazione);

        daoB.create(buonoSconto);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utente loginedUser = SessionUtil.getLoginedUser(session);
        BuonoScontoDAO daoB = null;
        PrenotazioneDAO daoP = null;
        String action = request.getParameter("action");

        if(loginedUser!=null){

            if (action != null && action.equalsIgnoreCase("delete")){
                daoB = new BuonoScontoDAO();
                Long buonoID = Long.parseLong(request.getParameter("Id"));
                BuonoSconto b = daoB.find(buonoID);
                daoB.delete(b);
            } else if(action != null && action.equalsIgnoreCase("edit")) {
                daoB = new BuonoScontoDAO();
                daoP = new PrenotazioneDAO();
                List<Prenotazione> prenotazioni = daoP.findPrenotazioneNoBuoni();

                Long id = Long.parseLong(request.getParameter("Id"));

                BuonoSconto b = daoB.find(id);

                request.setAttribute("editbuono", b);
                request.setAttribute("prenotazioniNoBuoni", prenotazioni);
                RequestDispatcher dispatcher = this.getServletContext()
                        .getRequestDispatcher("/WEB-INF/views/Mezzi.jsp");
                dispatcher.forward(request, response);
            } else {
                daoB = new BuonoScontoDAO();
                List<BuonoSconto> buoni = daoB.findAll();

                daoP = new PrenotazioneDAO();
                List<Prenotazione> prenotazioni = daoP.findPrenotazioneNoBuoni();

                request.setAttribute("buoni", buoni);
                request.setAttribute("prenotazioni", prenotazioni);

                RequestDispatcher dispatcher = this.getServletContext()
                        .getRequestDispatcher("/WEB-INF/views/Buonisconto.jsp");
                dispatcher.forward(request, response);
            }
        } else
            response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}
