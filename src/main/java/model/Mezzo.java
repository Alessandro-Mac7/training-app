package model;

import javax.persistence.*;
import java.sql.Date;
import java.util.Set;

@Entity
@Table(name="mezzo")
public class Mezzo {
    private Long id;
    private String targa;
    private String casa_costruttrice;
    private String modello;
    private Date anno_immatricolazione;
    private Categoria categoria;
    private Set<Prenotazione> prenotazioni;

    public Mezzo(){}

    public Mezzo(String targa, String casa_costruttrice, String modello, Date anno_immatricolazione, Categoria categoria){
        super();
        this.targa = targa;
        this.casa_costruttrice = casa_costruttrice;
        this.modello = modello;
        this.anno_immatricolazione = anno_immatricolazione;
        this.categoria = categoria;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idmezzo")
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    @Column(name="targa", columnDefinition = "varchar(45)")
    public String getTarga() {
        return targa;
    }
    public void setTarga(String targa) {
        this.targa = targa;
    }

    @Column(name="casa_costruttrice", columnDefinition = "varchar(45)")
    public String getCasa_costruttrice() {
        return casa_costruttrice;
    }
    public void setCasa_costruttrice(String casa_costruttrice) {
        this.casa_costruttrice = casa_costruttrice;
    }

    @Column(name="modello", columnDefinition = "varchar(45)")
    public String getModello() {
        return modello;
    }
    public void setModello(String modello) {
        this.modello = modello;
    }

    @Column(name="anno_immatricolazione")
    public Date getAnno_immatricolazione() {
        return anno_immatricolazione;
    }
    public void setAnno_immatricolazione(Date anno_immatricolazione) {
        this.anno_immatricolazione = anno_immatricolazione;
    }

    @ManyToOne
    @JoinColumn( name="idcategoria" )
    public Categoria getCategoria() {
        return categoria;
    }
    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    @OneToMany( mappedBy = "mezzo" )
    public Set<Prenotazione> getPrenotazioni() {
        return prenotazioni;
    }
    public void setPrenotazioni(Set<Prenotazione> prenotazioni) {
        this.prenotazioni = prenotazioni;
    }
}
