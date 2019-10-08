package persistence;

import model.Tipologia;
import model.Utente;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;
import util.HibernateFactory;


import java.util.List;

public class UtenteDAO extends AbstractDAO {


    public void create(Utente utente) {
        super.saveOrUpdate(utente);
    }


    public void delete(Utente utente) {
        super.delete(utente);
    }


    public Utente find(Long id)  {
        return (Utente) super.find(Utente.class, id);
    }


    public void update(Utente utente){
        super.saveOrUpdate(utente);
    }


    public List findAll(){
        return super.findAll(Utente.class);
    }


    public Utente login(String username) {
        Utente utente = null;
        try {
            super.startOperation();
            Query query = this.session.createQuery("from Utente where username = :username ");
            query.setParameter("username",username);
            utente = (Utente) query.getSingleResult();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return utente;
    }

}
