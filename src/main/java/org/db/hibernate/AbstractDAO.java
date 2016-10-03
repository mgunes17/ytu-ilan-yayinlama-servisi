package org.db.hibernate;

import java.util.List;

import org.hibernate.Session;

public abstract class AbstractDAO {
	private Session session;
	
	public boolean save(Object o) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			session.beginTransaction();
			session.save(o);
			session.getTransaction().commit();
			return true;
		}
		catch(Exception ex) {
			System.err.println("Kayıt işlemi edilemedi"); // logla 
			session.getTransaction().rollback();
			return false;
		}
		finally {
			session.close();
		}
	}
	
	public <T>List<T> getAllRows(Class<T> c) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			session.beginTransaction();
			return session.createCriteria(c).list();

		}
		catch(Exception ex) {
			System.err.println("Kayıt işlemi edilemedi"); // logla 
			session.getTransaction().rollback();
			return null;
		}
		finally {
			session.close();
		}
	}
	
}
