package model;

import javax.persistence.*;
import java.sql.Date;
import java.util.Set;


@Entity
@Table(name="categoria")
public class Categoria {
    private Long id;
    private String nome;
    private Set<Mezzo> mezzi;

    public Categoria(){}

    public Categoria(Long idcategoria, String nome, Set<Mezzo> mezzi){
        super();
        this.id = idcategoria;
        this.nome = nome;
        this.mezzi = mezzi;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idCategoria")
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    @Column(name="nome", nullable = false, columnDefinition = "varchar(45)")
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
