package util;

import model.Utente;

import javax.servlet.http.HttpSession;

public class SessionUtil {

    // Salva le informazioni degli Utenti nella Session
    public static void storeUser(HttpSession session, Utente loginedUser) {
        // accesso a JSP via ${loginedUser}
        session.setAttribute("loginedUser", loginedUser);
    }

    public static Utente getLoginedUser(HttpSession session) {
        Utente loginedUser = (Utente) session.getAttribute("loginedUser");
        return loginedUser;
    }
}
