package model;

import javax.persistence.*;
import java.sql.Date;
import java.util.Set;


@Entity
@Table(name="categoria")
public class Categoria {
    private int id;
    private String nome;
    private Set<Mezzo> mezzi;

    Categoria(){}

    Categoria(String nome, Set<Mezzo> mezzi){
        super();
        this.nome = nome;
        this.mezzi = mezzi;
    }

    Categoria(int idcategoria, String nome, Set<Mezzo> mezzi){
        super();
        this.id = idcategoria;
        this.nome = nome;
        this.mezzi = mezzi;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idCategoria")
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

    @OneToMany( mappedBy = "categoria" )
    public Set<Mezzo> getMezzi() {
        return mezzi;
    }
    public void setMezzi(Set<Mezzo> mezzi) {
        this.mezzi = mezzi;
    }
}
