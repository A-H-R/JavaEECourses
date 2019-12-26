package service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import javax.management.Query;
import java.util.List;

public class MonthImpl implements Month{
    @Qualifier("sessionFactory")
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<bean.Month> query(String cityname, String time) {
        String sql = "select * from " + cityname + "_month_" + time;
        System.out.println(sql);
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        List<bean.Month> list = session.createSQLQuery(sql).addEntity(bean.Month.class).list();
        return list;
    }

}
