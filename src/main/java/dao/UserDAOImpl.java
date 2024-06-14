package dao;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import models.User;

@Repository
public class UserDAOImpl implements UserDAO {
    @Autowired
    private SessionFactory sessionFactory;
    
    @Override
    public User findByEmail(String email) {
        Session session = sessionFactory.openSession();
        try {
            User user = (User) session.createQuery("from User where email = :email")
                .setParameter("email", email)
                .uniqueResult();
            System.out.println(user);
            return user;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }
}
