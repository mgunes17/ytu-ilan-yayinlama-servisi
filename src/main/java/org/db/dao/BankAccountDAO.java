package org.db.dao;

import org.db.model.BankAccountInfo;

public interface BankAccountDAO {
	boolean saveBankAccount(BankAccountInfo bai);
	BankAccountInfo getAccount(String iban);
}
