package persistence;

import model.Prenotazione;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;
import util.HibernateFactory;
import util.JpaResultHelper;

import java.util.List;

public class PrenotazioneDAO extends AbstractDAO {


    public void create(Prenotazione prenotazione) {
        super.saveOrUpdate(prenotazione);
    }


    public void delete(Prenotazione prenotazione) {
        super.delete(prenotazione);
    }


    public Prenotazione find(Long id)  {
        return (Prenotazione) super.find(Prenotazione.class, id);
    }

    public void update(Prenotazione prenotazione){
        super.saveOrUpdate(prenotazione);
    }


    public List findAll(){
        return super.findAll(Prenotazione.class);
    }

    public List findPrenotazioneNonApprovate() {
        List<Prenotazione> prenotazioni = null;
        try {
            super.startOperation();
            Query query = this.session.createQuery("from Prenotazione where approvata = 0 ");
            prenotazioni = query.getResultList();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return prenotazioni;
    }

    public List findPrenotazioneUtente(Long id) {
        List<Prenotazione> prenotazioni = null;
        try {
            super.startOperation();
            Query query = this.session.createQuery("from Prenotazione where utente.id = :id ");
            query.setParameter("id", id);
            prenotazioni = query.getResultList();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return prenotazioni;
    }

    public List findPrenotazioneNoBuoni() {
        List<Prenotazione> prenotazioni = null;
        try {
            super.startOperation();
            Query query = this.session.createQuery("from Prenotazione where buono = null ");
            prenotazioni = query.getResultList();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return prenotazioni;
    }

    public List findPrenotazioniUtente(Long id) {
        List<Prenotazione> prenotazioni = null;
        try {
            super.startOperation();
            Query query = this.session.createQuery("from Prenotazione as p where p.utente.id = :id ");
            query.setParameter("id", id);
            prenotazioni = query.getResultList();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return prenotazioni;
    }



}
