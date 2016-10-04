package org.db.hibernate;

import org.db.dao.UserDAO;
import org.db.model.User;
import org.hibernate.Session;

public class UserHibernateImpl extends AbstractDAO implements UserDAO {
	private Session session;
	
	public User getUser(String username) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			session.beginTransaction();
			User user = session.get(User.class, username);
			session.getTransaction().commit();
			return user;
		}
		catch(Exception ex) {
			System.out.println("kullanıcı getirilemedi");
			session.getTransaction().rollback();
			return null;
		}
		finally {
			session.close();
		}
	}

}