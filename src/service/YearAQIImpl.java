package service;

import bean.YearNanjing;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;

public class YearAQIImpl implements YearAQI {

//    Qualifier的意思是合格者，通过这个标示，表明了哪个实现类才是我们所需要的，
//    添加@Qualifier注解，需要注意的是@Qualifier的参数名称为我们之前定义@Service注解的名称之一。
    @Qualifier("sessionFactory")
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<YearNanjing> getYearAQI() {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        String sql = "from YearNanjing";
        Query query = session.createQuery(sql);
        List<YearNanjing> list = query.list();
        tx.commit();    //更新数据库用的

        if (list.size()>0){
            return list;
        }
        return null;
    }

    @Override
    public  List<YearNanjing> queryByName(String name){
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        String sql = "select * from year_"+name;
        List<YearNanjing> list = session.createSQLQuery(sql).addEntity(YearNanjing.class).list();
        return list;
    }



}
