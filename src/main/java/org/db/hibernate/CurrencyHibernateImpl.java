package org.db.hibernate;

import java.util.List;

import org.db.dao.CurrencyDAO;
import org.db.model.Currency;

public class CurrencyHibernateImpl extends AbstractDAO implements CurrencyDAO {
	public List<Currency> getAllCurrencies() {
		List<Currency> currencyList = (List<Currency>) getAllRows(Currency.class);
		return currencyList;
	}
}
