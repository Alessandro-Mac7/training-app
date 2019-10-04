package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import util.HibernateConfig;

import java.util.List;

public class AbstractDAO {
    private Session session;
    private Transaction transaction;

    public AbstractDAO(){}

    protected void saveOrUpdate(Object obj) {
        try {
            startOperation();
            session.saveOrUpdate(obj);
            transaction.commit();
        } catch (Exception e) {
            handleException(e);
        }
    }

    protected void delete(Object obj) {
        try {
            startOperation();
            session.delete(obj);
            transaction.commit();
        } catch (Exception e) {
            handleException(e);
        }
    }

    protected Object find(Class model, int id) {
        Object obj = null;
        try {
            startOperation();
            obj = session.load(model, id);
            transaction.commit();
        } catch (Exception e) {
            handleException(e);
        }
        return obj;
    }

    protected List findAll(Class model) {
        List objects = null;
        try {
            startOperation();
            Query query = session.createQuery("from " + model.getName());
            objects = query.list();
            transaction.commit();
        } catch (Exception e) {
            handleException(e);
        }
        return objects;
    }

    protected void handleException(Exception e) {
        if (transaction != null) {
            transaction.rollback();
        }
        e.printStackTrace();
    }

    protected void startOperation() throws Exception {
        session = HibernateConfig.getSessionFactory().openSession();
        transaction = session.beginTransaction();
    }

}
