package org.db.hibernate;

import org.db.dao.AccountingDAO;
import org.db.model.Accounting;

public class AccountingHibernateImpl extends AbstractDAO implements AccountingDAO {

	public boolean saveAccounting(Accounting accounting) {
		return save(accounting);
	}

}
