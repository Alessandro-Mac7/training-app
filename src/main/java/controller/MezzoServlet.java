package controller;

import model.Categoria;
import model.Mezzo;
import model.Prenotazione;
import model.Utente;
import persistence.CategoriaDAO;
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

@WebServlet("/mezzi")
public class MezzoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CategoriaDAO daoC = new CategoriaDAO();
        MezzoDAO daoM = new MezzoDAO();

        Mezzo mezzo = new Mezzo();
        Categoria categoria = daoC.find(Long.parseLong(request.getParameter("categoria")));

        Date date = null;
        try {
            date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("annoImmatricolazione"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if(request.getParameter("id")!=null)
            mezzo.setId(Long.parseLong(request.getParameter("id")));

        mezzo.setModello(request.getParameter("modello"));
        mezzo.setCasa_costruttrice(request.getParameter("casaCostruttrice"));
        mezzo.setTarga(request.getParameter("targa"));
        mezzo.setAnno_immatricolazione(new java.sql.Date(date.getTime()));
        mezzo.setCategoria(categoria);

        daoM.create(mezzo);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utente loginedUser = SessionUtil.getLoginedUser(session);
        MezzoDAO daoM = null;
        String action = request.getParameter("action");

        if(loginedUser!=null){

            if (action != null && action.equalsIgnoreCase("delete")){
                daoM = new MezzoDAO();
                Long mezzoId = Long.parseLong(request.getParameter("Id"));
                Mezzo m = daoM.find(mezzoId);
                daoM.delete(m);
                response.getWriter().write("success");
            } else if (action != null && action.equalsIgnoreCase("edit")) {
                CategoriaDAO daoC = new CategoriaDAO();
                List<Categoria> categorie = daoC.findAll();
                Long id = Long.parseLong(request.getParameter("Id"));

                daoM = new MezzoDAO();
                Mezzo m = daoM.find(id);

                request.setAttribute("categorie", categorie);
                request.setAttribute("editmezzo", m);

                RequestDispatcher dispatcher = this.getServletContext()
                        .getRequestDispatcher("/WEB-INF/views/Mezzi.jsp");
                dispatcher.forward(request, response);

            } else{
                daoM = new MezzoDAO();
                List<Mezzo> mezzi = daoM.findAll();

                CategoriaDAO daoC = new CategoriaDAO();
                List<Categoria> categorie = daoC.findAll();

                request.setAttribute("mezzi", mezzi);
                request.setAttribute("categorie", categorie);

                if(loginedUser.getTipologia().getNome().equals("SuperUser")){
                    RequestDispatcher dispatcher = this.getServletContext()
                            .getRequestDispatcher("/WEB-INF/views/Mezzi.jsp");
                    dispatcher.forward(request, response);
                } else {
                    RequestDispatcher dispatcher = this.getServletContext()
                            .getRequestDispatcher("/WEB-INF/views/MezziCustomer.jsp");
                    dispatcher.forward(request, response);
                }

            }
        } else
            response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}
