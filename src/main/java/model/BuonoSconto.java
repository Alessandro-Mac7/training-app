package model;

import javax.persistence.*;

public class BuonoSconto {
    private int id;
    private int importo;
    private Prenotazione prenotazione;

    BuonoSconto(){}

    public BuonoSconto(int importo, Prenotazione prenotazione) {
        super();
        this.importo = importo;
        this.prenotazione = prenotazione;
    }

    public BuonoSconto(int id, int importo, Prenotazione prenotazione) {
        super();
        this.id = id;
        this.importo = importo;
        this.prenotazione = prenotazione;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idbuoni_sconto")
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    @Column(name="importo")
    public int getImporto() {
        return importo;
    }
    public void setImporto(int importo) {
        this.importo = importo;
    }

    @OneToOne( fetch= FetchType.EAGER )
    @JoinColumn( name="idprenotazione" )
    public Prenotazione getPrenotazione() {
        return prenotazione;
    }
    public void setPrenotazione(Prenotazione prenotazione) {
        this.prenotazione = prenotazione;
    }
}
