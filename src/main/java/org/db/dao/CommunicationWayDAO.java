package org.db.dao;

import org.db.model.CommunicationWay;

public interface CommunicationWayDAO {
	boolean saveCommWay(CommunicationWay way);
	boolean deleteCommWay(String title, String value);
}
