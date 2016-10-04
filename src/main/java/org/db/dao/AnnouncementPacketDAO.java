package org.db.dao;

import java.util.List;

import org.db.model.AnnouncementPacket;

public interface AnnouncementPacketDAO {
	boolean savePacket(AnnouncementPacket packet);
	boolean deletePacket(int packetId);
	List<AnnouncementPacket> getAllPackets();
}
