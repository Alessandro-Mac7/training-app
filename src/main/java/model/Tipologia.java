package model;

import javax.persistence.*;
import java.sql.Date;
import java.util.Set;

@Entity
@Table(name="tipologia")
public class Tipologia {

    private Long id;
    private String nome;
    private Set<Utente> utente;

    public Tipologia(){}

    public Tipologia(Long id, String nome, Set<Utente> utente){
        super();
        this.id = id;
        this.nome = nome;
        this.utente = utente;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idtipologia")
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    @Column(name="nome", nullable = false, unique = true, columnDefinition = "varchar(45)")
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }

    @OneToMany( mappedBy = "tipologia" )
    public Set<Utente> getUtente() {
        return utente;
    }
    public void setUtente(Set<Utente> utente) {
        this.utente = utente;
    }
}
