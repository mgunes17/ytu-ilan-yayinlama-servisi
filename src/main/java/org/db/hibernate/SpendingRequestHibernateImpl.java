package org.db.hibernate;

import org.db.dao.SpendingRequestDAO;
import org.db.model.SpendingRequest;

public class SpendingRequestHibernateImpl extends AbstractDAO implements SpendingRequestDAO {

	public boolean sendRequest(SpendingRequest sr) {
		return save(sr);
	}

}
