package persistence;

import model.Prenotazione;

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
}
