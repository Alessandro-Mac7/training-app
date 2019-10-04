package model;

import javax.persistence.*;
import java.sql.Date;
import java.util.Set;

public class Utente {

    private int id;
    private String nome;
    private String cognome;
    private Date data;
    private String password;
    private String username;
    private Tipologia tipologia;
    private Set<Prenotazione> prenotazioni;

    Utente(){}

    Utente(String nome, String cognome, Date data, String password, String username, Tipologia tipologia){
        super();
        this.nome = nome;
        this.cognome = cognome;
        this.data = data;
        this.password = password;
        this.username = username;
        this.tipologia = tipologia;
    }

    Utente(int idutente, String nome, String cognome, Date data, String password, String username, Tipologia tipologia){
        super();
        this.id = idutente;
        this.nome = nome;
        this.cognome = cognome;
        this.data = data;
        this.password = password;
        this.username = username;
        this.tipologia = tipologia;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idutente")
    public int getId() {
        return id;
    }
    public void setId(int idutente) {
        this.id = idutente;
    }

    @Column(name="nome")
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }

    @Column(name="cognome")
    public String getCognome() {
        return cognome;
    }
    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    @Column(name="data_nascita")
    public Date getData() {
        return data;
    }
    public void setData(Date data) {
        this.data = data;
    }

    @Column(name="password")
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name="username")
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    @OneToOne( fetch= FetchType.EAGER )
    @JoinColumn( name="idtipologia" )
    public Tipologia getTipologia() {
        return tipologia;
    }
    public void setTipologia(Tipologia tipologia) {
        this.tipologia = tipologia;
    }

    @OneToMany( mappedBy = "utente" )
    public Set<Prenotazione> getPrenotazioni() {
        return prenotazioni;
    }
    public void setPrenotazioni(Set<Prenotazione> prenotazioni) {
        this.prenotazioni = prenotazioni;
    }
}
