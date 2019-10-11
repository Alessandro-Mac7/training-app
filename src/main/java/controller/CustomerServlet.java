package controller;

import model.Utente;
import persistence.EventoDAO;
import persistence.PrenotazioneDAO;
import persistence.UtenteDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import util.SessionUtil;

@WebServlet("/customers")
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utente loginedUser = SessionUtil.getLoginedUser(session);

        if (loginedUser != null) {
            UtenteDAO daoU = null;
            PrenotazioneDAO daoP = null;
            EventoDAO daoE = null;
            Long id = null;
            String action = request.getParameter("action");

            if (action.equalsIgnoreCase("delete")){
                daoU = new UtenteDAO();
                id = Long.parseLong(request.getParameter("Id"));
                Utente u = daoU.find(id);
                daoU.delete(u);
                response.getWriter().write("success");
            } else if (action != null && action.equalsIgnoreCase("edit")){
                id = Long.parseLong(request.getParameter("Id"));

                daoU = new UtenteDAO();
                Utente e = daoU.find(id);
                request.setAttribute("editCustomer", e);
                if(loginedUser.getTipologia().getNome().equals("SuperUser")){
                    RequestDispatcher dispatcher = this.getServletContext()
                            .getRequestDispatcher("/WEB-INF/views/SuperUserHome.jsp");
                    dispatcher.forward(request, response);
                } else {
                    RequestDispatcher dispatcher = this.getServletContext()
                            .getRequestDispatcher("/WEB-INF/views/CustomerHome.jsp");
                    dispatcher.forward(request, response);
                }
            }
        }
    }
}

