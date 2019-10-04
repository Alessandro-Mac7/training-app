package model;

import javax.persistence.*;
import java.sql.Date;
import java.util.Set;

public class Prenotazione {

    private int id;
    private Date data_inizio;
    private Date data_fine;
    private int approvata;

    private Set<Evento> eventi;
    private Utente utente;
    private Mezzo mezzo;
    private BuonoSconto buono;

    Prenotazione(){}

    public Prenotazione(Date data_inizio, Date data_fine, int approvata, Set<Evento> eventi, Utente utente, Mezzo mezzo, BuonoSconto buono) {
        super();
        this.data_inizio = data_inizio;
        this.data_fine = data_fine;
        this.approvata = approvata;
        this.eventi = eventi;
        this.utente = utente;
        this.mezzo = mezzo;
        this.buono = buono;
    }

    public Prenotazione(int id, Date data_inizio, Date data_fine, int approvata, Set<Evento> eventi, Utente utente, Mezzo mezzo, BuonoSconto buono) {
        super();
        this.id = id;
        this.data_inizio = data_inizio;
        this.data_fine = data_fine;
        this.approvata = approvata;
        this.eventi = eventi;
        this.utente = utente;
        this.mezzo = mezzo;
        this.buono = buono;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idprenotazione")
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    @Column(name="data_inizio")
    public Date getData_inizio() {
        return data_inizio;
    }
    public void setData_inizio(Date data_inizio) {
        this.data_inizio = data_inizio;
    }

    @Column(name="data_fine")
    public Date getData_fine() {
        return data_fine;
    }
    public void setData_fine(Date data_fine) {
        this.data_fine = data_fine;
    }

    @Column(name="approvata")
    public int getApprovata() {
        return approvata;
    }
    public void setApprovata(int approvata) {
        this.approvata = approvata;
    }

    @OneToMany( mappedBy = "prenotazione" )
    public Set<Evento> getEventi() {
        return eventi;
    }
    public void setEventi(Set<Evento> eventi) {
        this.eventi = eventi;
    }

    @ManyToOne
    @JoinColumn( name="idutente" )
    public Utente getUtente() {
        return utente;
    }
    public void setUtente(Utente utente) {
        this.utente = utente;
    }

    @ManyToOne
    @JoinColumn( name="idmezzo" )
    public Mezzo getMezzo() {
        return mezzo;
    }
    public void setMezzo(Mezzo mezzo) {
        this.mezzo = mezzo;
    }

    @OneToOne( mappedBy = "prenotazione" )
    public BuonoSconto getBuono() {
        return buono;
    }
    public void setBuono(BuonoSconto buono) {
        this.buono = buono;
    }
}
