package model;

import javax.persistence.*;
import java.sql.Date;
import java.util.Set;

@Entity
@Table(name="utente")
public class Utente {

    private Long id;
    private String nome;

    private String cognome;
    private Date data;
    private String password;
    private String username;
    private String salt;
    private Tipologia tipologia;
    private Set<Prenotazione> prenotazioni;

    public Utente(){}

    public Utente(Long id, String nome, String cognome, Date data, String password, String username, Tipologia tipologia){
        super();
        this.id = id;
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
    public Long getId() {
        return id;
    }
    public void setId(Long idutente) {
        this.id = idutente;
    }

    @Column(name="nome", nullable = false, columnDefinition = "varchar(45)")
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }

    @Column(name="cognome", nullable = false, columnDefinition = "varchar(45)")
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

    @Column(name="password", nullable = false)
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name="username", nullable = false, unique = true, columnDefinition = "varchar(45)")
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    @Column(name="salt")
    public String getSalt() {
        return salt;
    }
    public void setSalt(String salt) {
        this.salt = salt;
    }

    @ManyToOne( fetch= FetchType.EAGER )
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
