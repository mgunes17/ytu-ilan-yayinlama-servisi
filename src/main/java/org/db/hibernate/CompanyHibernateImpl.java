package org.db.hibernate;

import org.db.dao.CompanyDAO;
import org.db.model.CommunicationWay;
import org.db.model.Company;
import org.hibernate.Session;

public class CompanyHibernateImpl extends AbstractDAO implements CompanyDAO {
	private Session session;

	public boolean saveCompany(Company c, CommunicationWay mail, CommunicationWay telephone) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			session.beginTransaction();
			session.save(c);
			session.save(mail);
			session.save(telephone);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			session.getTransaction().rollback();
			System.err.println("Şirket kaydedilemedi." + e.getMessage());
			return false;
		} finally {
			session.close();
		}

	}

}
