package dao;

import model.Utente;

import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateConfig;

import java.util.List;

public class UtenteDAO extends AbstractDAO{

    public void create(Utente utente) {
        super.saveOrUpdate(utente);
    }

    public void delete(Utente utente) {
        super.delete(utente);
    }

    public Utente find(int id)  {
        return (Utente) super.find(Utente.class, id);
    }

    public void update(Utente utente){
        super.saveOrUpdate(utente);
    }

    public List findAll(){
        return super.findAll(Utente.class);
    }

}
