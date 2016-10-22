package org.db.dao;

import org.db.model.CommunicationWay;
import org.db.model.Company;

public interface CompanyDAO {

	boolean saveCompany(Company c, CommunicationWay mail, CommunicationWay telephone);
}
