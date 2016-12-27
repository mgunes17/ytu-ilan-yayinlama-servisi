package org.db.hibernate;

import org.db.dao.BankAccountDAO;
import org.db.model.Accounting;
import org.db.model.BankAccountInfo;

import java.util.List;

public class BankAccountHibernateImpl extends AbstractDAO implements BankAccountDAO {

	public boolean saveBankAccount(BankAccountInfo bai) {
		return save(bai);
	}

	public BankAccountInfo getAccount(String iban) {
		return (BankAccountInfo) getObject(BankAccountInfo.class, iban);
	}

	public List<BankAccountInfo> getSiblingAccounts(String iban) {
		String query = "select * \n" +
                "from bank_account_info b ,bank_account_info b2\n" +
                "where b.owner_unit_name = b2.owner_unit_name and (b.iban = '" + iban + "' or b2.iban ='" + iban + "')";
		return getRowsBySQLQuery(BankAccountInfo.class, query);
	}

	public boolean deleteAccount(String iban) {
		return deleteByQuery(Accounting.class, "BankAccountInfo", "iban", iban);
	}

}
