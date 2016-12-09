package org.db.hibernate;

import org.db.dao.UserDAO;
import org.db.model.User;
import org.hibernate.Session;

public class UserHibernateImpl extends AbstractDAO implements UserDAO {
	private Session session;

	public User getUser(String username) { // getObject ile abstract daoya
											// yerleştir
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			session.beginTransaction();
			User user = session.get(User.class, username);
			session.getTransaction().commit();
			return user;
		} catch (Exception ex) {
			System.out.println("kullanıcı getirilemedi");
			session.getTransaction().rollback();
			return null;
		} finally {
			session.close();
		}
	}

	public boolean isUserExist(String username) {
		User user = getUser(username);

		if (user == null) {
			return false;
		} else {
			return true;
		}
	}

	public boolean update(Object user) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			session.beginTransaction();
			session.update(user);
			session.getTransaction().commit();
			return true;
		} catch (Exception ex) {
			System.out.println("kullanıcı bilgileri güncellenemedi");
			session.getTransaction().rollback();
			return false;
		} finally {
			session.close();
		}
	}
}
