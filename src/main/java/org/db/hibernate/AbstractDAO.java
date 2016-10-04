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
			System.err.println("Kayıt işlemi başarısız"); // logla 
			session.getTransaction().rollback();
			return false;
		}
		finally {
			session.close();
		}
	}
	
	public boolean delete(Object o) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			session.beginTransaction();
			session.delete(o);
			session.getTransaction().commit();
			return true;
		}
		catch(Exception ex) {
			System.err.println("Silme işlemi başarısız"); // logla 
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
			System.err.println("Veriler okunamadı"); // logla 
			session.getTransaction().rollback();
			return null;
		}
		finally {
			session.close();
		}
	}
	
}