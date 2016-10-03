package org.db.dao;

import java.util.List;

import org.db.model.BankAccountInfo;
import org.db.model.DonationAcceptUnit;

public interface DonationAcceptUnitDAO {
	boolean saveDonationAcceptUnit(DonationAcceptUnit dau);
	boolean saveBankAccount(BankAccountInfo bai);
	List<DonationAcceptUnit> getAllUnits();
}
