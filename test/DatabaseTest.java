import model.Categoria;
import model.Mezzo;
import model.Tipologia;
import model.Utente;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import persistence.CategoriaDAO;
import persistence.MezzoDAO;
import persistence.TipologiaDAO;
import persistence.UtenteDAO;
import util.PasswordUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

public class DatabaseTest {

    @Before
    public void insert(){
        //Insert Tipologia test
        Tipologia tipo = new Tipologia();
        tipo.setNome("SuperUser");
        TipologiaDAO dao = new TipologiaDAO();
        dao.create(tipo);

        //Insert Categoria test
        Categoria c = new Categoria();
        c.setNome("SUV");
        CategoriaDAO dao_c = new CategoriaDAO();
        dao_c.create(c);

        //Insert Mezzo test
        Mezzo m = new Mezzo();
        Date date = null;
        try {
            date = new SimpleDateFormat("yyyy-MM-dd").parse("2018-06-13");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        m.setAnno_immatricolazione(new java.sql.Date(date.getTime()));
        m.setCasa_costruttrice("Audi");
        m.setCategoria(c);
        m.setModello("Q3");
        MezzoDAO dao_m = new MezzoDAO();
        dao_m.create(m);

        //Insert Utente test
        Utente u = new Utente();
        u.setUsername("alessandro.macri1995@gmail.com");
        String salt = PasswordUtils.getSalt(30);
        String encryptedPsw = PasswordUtils.generateSecurePassword("ciao", salt);
        u.setSalt(salt);
        u.setPassword(encryptedPsw);
        u.setTipologia(tipo);
        u.setNome("Alex");
        u.setCognome("Cosentino");
        Date date1 = null;
        try {
            date1 = new SimpleDateFormat("yyyy-MM-dd").parse("2018-06-13");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        u.setData(new java.sql.Date(date1.getTime()));
        UtenteDAO dao_u = new UtenteDAO();
        dao_u.create(u);

    }

    @Test
    public void hqlFind(){
        TipologiaDAO dao = new TipologiaDAO();
        Tipologia tipo = dao.findName("SuperUser");
        assertNotNull(tipo);
        Set<Utente> l = tipo.getUtente();
        assertNotNull(l);
    }


}
