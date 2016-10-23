package org.db.hibernate;

import org.db.dao.CompanyDAO;
import org.db.model.Company;

public class CompanyHibernateImpl extends AbstractDAO implements CompanyDAO {

	public boolean saveCompany(Company company) {
		return save(company);
	}

}
