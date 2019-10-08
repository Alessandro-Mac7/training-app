package persistence;

import model.Mezzo;

import java.util.List;

public class MezzoDAO extends AbstractDAO {

    public void create(Mezzo mezzo) {
        super.saveOrUpdate(mezzo);
    }

    public void delete(Mezzo mezzo) {
        super.delete(mezzo);
    }

    public Mezzo find(String id) {
        return null;
    }

    public void update(Mezzo mezzo) {
        super.saveOrUpdate(mezzo);
    }

    public List findAll() {
        return super.findAll(Mezzo.class);
    }
}
