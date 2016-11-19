package org.db.dao;

import org.db.model.SpendingRequest;

public interface SpendingRequestDAO {
	boolean sendRequest(SpendingRequest sr);
}
