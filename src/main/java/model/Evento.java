package model;

import javax.persistence.*;

public class Evento {
    private int id;
    private String tipo;
    private Prenotazione prenotazione;

    Evento(){}

    public Evento(String tipo, Prenotazione prenotazione) {
        super();
        this.tipo = tipo;
        this.prenotazione = prenotazione;
    }

    public Evento(int id, String tipo, Prenotazione prenotazione) {
        super();
        this.id = id;
        this.tipo = tipo;
        this.prenotazione = prenotazione;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idevento")
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    @Column(name="tipo")
    public String getTipo() {
        return tipo;
    }
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    @ManyToOne
    @JoinColumn( name="idprenotazione" )
    public Prenotazione getPrenotazione() {
        return prenotazione;
    }
    public void setPrenotazione(Prenotazione prenotazione) {
        this.prenotazione = prenotazione;
    }
}
