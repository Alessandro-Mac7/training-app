package persistence;

import model.Evento;

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

}
