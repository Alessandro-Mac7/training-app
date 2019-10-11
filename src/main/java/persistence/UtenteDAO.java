package persistence;

import model.Tipologia;
import model.Utente;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;
import util.HibernateFactory;
import util.JpaResultHelper;


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
            utente = (Utente) JpaResultHelper.getSingleResultOrNull(query);
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return utente;
    }

    public List findCustomers() {

        List<Utente> utenti = null;
        try {
            super.startOperation();
            Query query = this.session.createQuery("FROM Utente u WHERE u.tipologia.id = :id");
            Long id = new Long(2);
            query.setParameter("id",id);
            utenti = query.getResultList();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return utenti;
    }

    public boolean utenteMoroso(Long id){
        boolean moroso = false;
        try {
            super.startOperation();
            Query query = this.session.createQuery("FROM Utente u, Prenotazione p" +
                    "                                  where :id = p.utente.id and " +
                    "                                  p.id in (select e.prenotazione.id from Evento as e )");
            List<Utente> utenti = query.getResultList();
            if(!utenti.isEmpty())
                moroso=true;
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return moroso;
    }

}
