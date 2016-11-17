package org.db.hibernate;

import java.util.List;

import org.db.dao.AccountingDAO;
import org.db.model.Accounting;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

public class AccountingHibernateImpl extends AbstractDAO implements AccountingDAO {
	private Session session;

	public boolean saveAccounting(Accounting accounting) {
		return save(accounting);
	}

	public List<Accounting> getAllAccountings() {
		return (List<Accounting>) getAllRows(Accounting.class);
	}

	public List<Accounting> getUnitAccountings(String unitName) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			session.getTransaction().begin();
			String query = " SELECT *  FROM accounting where unit_name = '" + unitName + "';";
			SQLQuery sqlQuery = session.createSQLQuery(query);
			sqlQuery.addEntity(Accounting.class);
			List<Accounting> accList = sqlQuery.list();
			session.getTransaction().commit();
			return accList;
		} catch(Exception ex) {
			session.getTransaction().rollback();
			System.out.println("Vakıf işlem kayıtları getirilemedi:" + ex.getMessage());
			return null;
		} finally {
			session.close();
		}
	}

}
