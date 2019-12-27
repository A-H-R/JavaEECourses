package service;

import bean.YearNanjing;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;

public class DayImpl implements Day{
    @Qualifier("sessionFactory")
    @Autowired
    private SessionFactory sessionFactory;
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<YearNanjing> getdata(String name) {
        //返回9条数据
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        String sql = "select * from year_" + name + " order by data limit 9";
        System.out.println(sql);
        List<YearNanjing> list = session.createSQLQuery(sql).addEntity(YearNanjing.class).list();
        session.close();//关闭数据库连接
        return list;
    }

    @Override
    public List<YearNanjing> getNewOne(String name) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        String sql = "select * from year_" + name + " order by data limit 9,10";
        List<YearNanjing> data = session.createSQLQuery(sql).addEntity(YearNanjing.class).list();
        session.close();//关闭数据库连接
        return data;
    }
}
