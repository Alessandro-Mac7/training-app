package model;

import javax.persistence.*;

@Entity
@Table(name="evento")
public class Evento {
    private Long id;
    private String tipo;
    private Prenotazione prenotazione;

    public Evento(){}

    public Evento(Long id, String tipo, Prenotazione prenotazione) {
        super();
        this.id = id;
        this.tipo = tipo;
        this.prenotazione = prenotazione;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idevento")
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    @Column(name="tipo", nullable = false, columnDefinition = "varchar(45)")
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
