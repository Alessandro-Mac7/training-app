package persistence;

import model.Categoria;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;
import util.HibernateFactory;
import util.JpaResultHelper;

import java.util.List;

public class CategoriaDAO extends AbstractDAO {

    public void create(Categoria categoria) {
        super.saveOrUpdate(categoria);
    }

    public void delete(Categoria categoria) {
        super.delete(categoria);
    }

    public Categoria find(Long id)  {
        return (Categoria) super.find(Categoria.class, id);
    }

    public void update(Categoria categoria){
        super.saveOrUpdate(categoria);
    }

    public List findAll(){
        return super.findAll(Categoria.class);
    }

    public Categoria findName(String name) {
        Categoria categoria = null;
        try {
            super.startOperation();
            Query query = this.session.createQuery("from Categoria where nome = :name ");
            query.setParameter("name",name);
            categoria = (Categoria) JpaResultHelper.getSingleResultOrNull(query);
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return categoria;
    }

}
