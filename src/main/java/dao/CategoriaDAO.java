package dao;

import model.Categoria;


import java.util.List;

public class CategoriaDAO extends AbstractDAO{

    public void create(Categoria categoria) {
        super.saveOrUpdate(categoria);
    }

    public void delete(Categoria categoria) {
        super.delete(categoria);
    }

    public Categoria find(int id)  {
        return (Categoria) super.find(Categoria.class, id);
    }

    public void update(Categoria categoria){
        super.saveOrUpdate(categoria);
    }

    public List findAll(){
        return super.findAll(Categoria.class);
    }

}
