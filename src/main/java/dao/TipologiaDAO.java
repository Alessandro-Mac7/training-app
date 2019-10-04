package dao;

import model.Tipologia;
import model.Utente;

import java.util.List;

public class TipologiaDAO extends AbstractDAO {

    public void create(Tipologia tipologia) {
        super.saveOrUpdate(tipologia);
    }

    public void delete(Tipologia tipologia) {
        super.delete(tipologia);
    }

    public Tipologia find(int id)  {
        return (Tipologia) super.find(Tipologia.class, id);
    }

    public void update(Tipologia tipologia){
        super.saveOrUpdate(tipologia);
    }

    public List findAll(){
        return super.findAll(Tipologia.class);
    }
}
