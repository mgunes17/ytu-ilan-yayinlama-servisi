package org.db.dao;

import java.util.List;

import org.db.model.Accounting;

public interface AccountingDAO {
	public boolean saveAccounting(Accounting accounting);
	public List<Accounting> getAllAccountings();
	public List<Accounting> getUnitAccountings(String unitName);
}
