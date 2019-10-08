package persistence;

import model.Tipologia;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;
import util.HibernateFactory;

import java.util.List;

public class TipologiaDAO extends AbstractDAO {


    public void create(Tipologia tipologia) {
        super.saveOrUpdate(tipologia);
    }


    public void delete(Tipologia tipologia) {
        super.delete(tipologia);
    }


    public Tipologia find(Long id)  {
        return (Tipologia) super.find(Tipologia.class, id);
    }


    public void update(Tipologia tipologia){
        super.saveOrUpdate(tipologia);
    }


    public List findAll(){
        return super.findAll(Tipologia.class);
    }


    public Tipologia findName(String name) {
        Tipologia tipologia = null;
        try {
            super.startOperation();
            Query query = this.session.createQuery("from Tipologia where nome = :name ");
            query.setParameter("name",name);
            tipologia = (Tipologia) query.getSingleResult();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return tipologia;
    }
}
