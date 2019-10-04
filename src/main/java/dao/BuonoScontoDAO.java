package dao;

import model.BuonoSconto;

import java.util.List;

public class BuonoScontoDAO extends AbstractDAO {

    public void create(BuonoSconto buonoSconto) {
        super.saveOrUpdate(buonoSconto);
    }

    public void delete(BuonoSconto buonoSconto) {
        super.delete(buonoSconto);
    }

    public BuonoSconto find(int id)  {
        return (BuonoSconto) super.find(BuonoSconto.class, id);
    }

    public void update(BuonoSconto buonoSconto){
        super.saveOrUpdate(buonoSconto);
    }

    public List findAll(){
        return super.findAll(BuonoSconto.class);
    }
}
