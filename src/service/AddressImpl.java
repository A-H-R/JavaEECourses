package service;

import bean.Addresslist;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;

public class AddressImpl implements Address {
    @Qualifier("sessionFactory")
    @Autowired
    private SessionFactory sessionFactory;
    public void setSessionFactory(SessionFactory sessionFactory){
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void add(Addresslist al){
        Session s = sessionFactory.openSession();
        Transaction tx = s.beginTransaction();
        s.save(al);
        tx.commit();
    }
    public List<Addresslist> query_all(){
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        String sql = "from Addresslist";
        Query query = session.createQuery(sql);
        List<Addresslist> list = query.list();
        tx.commit();    //更新数据库用的

        if (list.size()>0){
            return list;
        }
        return null;
    }
    public boolean login(String name,String phone){
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        String sql = "from Addresslist where name=? and phone= ?";
        Query query = session.createQuery(sql);
        query.setParameter(0,name);
        query.setParameter(1,phone);
        int x = query.list().size();
        System.out.println(x);
        if(x>0){
            tx.commit();
            return true;
        }
        tx.commit();
        return false;
    }
}
