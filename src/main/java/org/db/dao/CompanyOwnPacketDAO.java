package org.db.dao;

import org.db.model.CompanyOwnPacket;

public interface CompanyOwnPacketDAO {
	boolean save(CompanyOwnPacket cop);
	boolean updatePacket(CompanyOwnPacket cop);
	CompanyOwnPacket getPacket(int packetId);
}
