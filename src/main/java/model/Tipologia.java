package model;

import javax.persistence.*;
import java.sql.Date;

public class Tipologia {

    private int id;
    private String nome;
    private Utente utente;

    Tipologia(){}

    Tipologia(String nome, Utente utente){
        super();
        this.nome = nome;
        this.utente = utente;
    }

    Tipologia(int idtipologia, String nome, Utente utente){
        super();
        this.id = idtipologia;
        this.nome = nome;
        this.utente = utente;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idtipologia")
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    @Column(name="nome")
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }

    @OneToOne( mappedBy = "tipologia" )
    public Utente getUtente() {
        return utente;
    }

    public void setUtente(Utente utente) {
        this.utente = utente;
    }
}
