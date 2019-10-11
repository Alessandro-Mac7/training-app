package persistence;

import model.Evento;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;
import util.HibernateFactory;

import java.util.List;

public class EventoDAO extends AbstractDAO{

    public void create(Evento evento) {
        super.saveOrUpdate(evento);
    }

    public void delete(Evento evento) {
        super.delete(evento);
    }

    public Evento find(Long id)  {
        return (Evento) super.find(Evento.class, id);
    }

    public void update(Evento evento){
        super.saveOrUpdate(evento);
    }

    public List findAll(){
        return super.findAll(Evento.class);
    }

    public List findEventiUtente(Long id) {
            List<Evento> eventi = null;
            try {
                super.startOperation();
                Query query = this.session.createQuery("FROM Evento e " +
                        "                                  where e.prenotazione.id = e.prenotazione.utente.id and " +
                        "                                  e.prenotazione.utente.id in (select u.id from Utente as u where u.id = :id)");
                query.setParameter("id",id);
                eventi = query.getResultList();
                tx.commit();
            } catch (HibernateException e) {
                handleException(e);
            } finally {
            HibernateFactory.close(session);
        }
        return eventi;
    }



}
