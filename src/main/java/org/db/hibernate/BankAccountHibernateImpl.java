package org.db.hibernate;

import org.db.dao.BankAccountDAO;
import org.db.model.Accounting;
import org.db.model.BankAccountInfo;

public class BankAccountHibernateImpl extends AbstractDAO implements BankAccountDAO {

	public boolean saveBankAccount(BankAccountInfo bai) {
		return save(bai);
	}

	public BankAccountInfo getAccount(String iban) {
		return (BankAccountInfo) getObject(BankAccountInfo.class, iban);
	}

	public boolean deleteAccount(String iban) {
		return deleteByQuery(Accounting.class, "BankAccountInfo", "iban", iban);
	}

}
