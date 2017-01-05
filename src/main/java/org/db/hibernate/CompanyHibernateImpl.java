package org.db.hibernate;

import org.db.dao.CompanyDAO;
import org.db.model.Company;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import java.util.HashMap;
import java.util.Map;

public class CompanyHibernateImpl extends AbstractDAO implements CompanyDAO {
    private Session session;

	public boolean saveCompany(Company company) {
		return save(company);
	}

	public boolean updateCompanyUser(Company c) {
		String hql = "UPDATE Company " +
                "SET name = :name, surname = :surname, contactMail = :contactMail, contactTel = :contactTel" +
                " WHERE userName = :userName";
		Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("name", c.getName());
        parameter.put("surname", c.getSurname());
        parameter.put("contactMail", c.getContactMail());
        parameter.put("contactTel", c.getContactTel());
        parameter.put("userName", c.getUserName());

        return updateByQuery(Company.class, hql, parameter);
	}

    public boolean deleteCompany(Company c) {
        try {
            String query1 = "DELETE FROM company WHERE user_name = '" + c.getUserName() + "' ";
            String query2 = "DELETE FROM users WHERE user_name = '" + c.getUserName() + "' ";
            session = HibernateSessionFactory.getSessionFactory().openSession();
            session.getTransaction().begin();
            SQLQuery q1 = session.createSQLQuery(query1);
            SQLQuery q2 = session.createSQLQuery(query2);
            q1.executeUpdate();
            q2.executeUpdate();
            session.getTransaction().commit();
            return  true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
            session.getTransaction().rollback();
            return false;
        } finally {
            session.close();
        }
    }

    public boolean updateCompanyPassword(Company c) {
	    String hql = "UPDATE Company SET password = :password WHERE userName = :userName";
        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("password", c.getPassword());
        parameter.put("userName", c.getUserName());

        return updateByQuery(Company.class, hql, parameter);
    }
}
