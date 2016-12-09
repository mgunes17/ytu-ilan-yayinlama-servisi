package org.db.hibernate;

import org.db.dao.CompanyDAO;
import org.db.model.Company;

import java.util.HashMap;
import java.util.Map;

public class CompanyHibernateImpl extends AbstractDAO implements CompanyDAO {

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

	public boolean updateCompanyPassword(Company c) {
	    String hql = "UPDATE Company SET password = :password WHERE userName = :userName";
        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("password", c.getPassword());
        parameter.put("userName", c.getUserName());

        return updateByQuery(Company.class, hql, parameter);
    }
}
