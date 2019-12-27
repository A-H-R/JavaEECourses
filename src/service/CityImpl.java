package service;

import bean.City;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;

public class CityImpl implements cityN{
    @Qualifier("sessionFactory")
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<City> getcity() {
        Session session =sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        String sql = "from City";
        List<City> list = session.createQuery(sql).list();
        session.close();
        return list;
    }
}
