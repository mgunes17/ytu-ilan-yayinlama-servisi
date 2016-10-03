package org.db.hibernate;

import java.util.List;

import org.db.dao.DonationAcceptUnitDAO;
import org.db.model.BankAccountInfo;
import org.db.model.DonationAcceptUnit;

public class DauHibernateImpl extends AbstractDAO implements DonationAcceptUnitDAO{

	public boolean saveDonationAcceptUnit(DonationAcceptUnit dau) {
		return save(dau);
	}

	public boolean saveBankAccount(BankAccountInfo bai) {
		return save(bai);
	}

	public List<DonationAcceptUnit> getAllUnits() {
		return getAllRows(DonationAcceptUnit.class);
	}

}
