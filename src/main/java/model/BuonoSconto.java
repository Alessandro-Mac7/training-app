package model;

import javax.persistence.*;

@Entity
@Table(name="buoni_sconto")
public class BuonoSconto {
    private Long id;
    private int importo;
    private Prenotazione prenotazione;

    public BuonoSconto(){}

    public BuonoSconto(Long id, int importo, Prenotazione prenotazione) {
        super();
        this.id = id;
        this.importo = importo;
        this.prenotazione = prenotazione;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idbuoni_sconto")
    public Long getId() {
        return id;
    }
    public void setId(Long id) { this.id = id;
    }

    @Column(name="importo", nullable = false)
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
