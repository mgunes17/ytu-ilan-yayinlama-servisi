package org.db.hibernate;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;

public abstract class AbstractDAO {
	private Session session;
	
	public <T> Object getObject(Class<T> c, Object primaryKey) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			session.beginTransaction();
			Object object = session.get(c, (Serializable) primaryKey);
			session.getTransaction().commit();
			return object;
		} catch(Exception ex) {
			System.err.println("Obje getirilemedi"); // logla
			session.getTransaction().rollback();
			return false;
		} finally {
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
		} catch (Exception ex) {
			System.err.println("Silme işlemi başarısız"); // logla
			session.getTransaction().rollback();
			return false;
		} finally {
			session.close();
		}
	}

	public <T> List<T> getAllRows(Class<T> c) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			session.beginTransaction();
			return session.createCriteria(c).list();

		} catch (Exception ex) {
			System.err.println("Veriler okunamadı: "+ ex.getMessage()); // logla
			session.getTransaction().rollback();
			return null;
		} finally {
			session.close();
		}
	}

	public boolean save(Object o) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			session.beginTransaction();
			session.save(o);
			session.getTransaction().commit();
			return true;
		} catch (Exception ex) {
			System.err.println("Kayıt işlemi başarısız " + ex.getMessage()); // logla
			session.getTransaction().rollback();
			return false;
		} finally {
			session.close();
		}
	}

}
