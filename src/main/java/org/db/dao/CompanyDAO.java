package org.db.dao;

import org.db.model.Company;

public interface CompanyDAO {
    boolean updateCompanyPassword(Company c);
	boolean saveCompany(Company c);
	boolean updateCompanyUser(Company c);
}
