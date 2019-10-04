package util;

import java.util.Properties;

import model.*;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

// Equivalente a hibernate.cfg.xml
public class HibernateConfig {

    private static SessionFactory factory;

    public static SessionFactory getSessionFactory(){
        //Singleton Factory
        if(factory == null){
                try {
                    Configuration configuration = new Configuration();

                    Properties settings = new Properties();
                    settings.put(Environment.DRIVER, "com.mysql.jdbc.Driver");
                    settings.put(Environment.URL, "jdbc:mysql://localhost:3306/training_db?useSSL=false");
                    settings.put(Environment.USER, "root");
                    settings.put(Environment.PASS, "root");
                    settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQL5Dialect");
                    settings.put(Environment.SHOW_SQL, "true");
                    settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");
                    settings.put(Environment.HBM2DDL_AUTO, "create-drop");

                    configuration.setProperties(settings);
                    configuration.addAnnotatedClass(BuonoSconto.class);
                    configuration.addAnnotatedClass(Categoria.class);
                    configuration.addAnnotatedClass(Evento.class);
                    configuration.addAnnotatedClass(Mezzo.class);
                    configuration.addAnnotatedClass(Prenotazione.class);
                    configuration.addAnnotatedClass(Tipologia.class);
                    configuration.addAnnotatedClass(Utente.class);

                    // ServiceRegistry --> Ospita i servizi di Hibernate necessari durante il bootstrapping e il runtime
                    // StandardServiceRegistryBuilder è il builder dell'istanze ServiceRegistry
                    ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
                            .applySettings(configuration.getProperties()).build();
                    System.out.println("Configurazione Hibernate creata");
                    factory = configuration.buildSessionFactory(serviceRegistry);

                    return factory;
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        return factory;
    }

}
