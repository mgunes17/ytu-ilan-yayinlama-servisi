package org.db.hibernate;

import java.util.List;

import org.db.dao.AnnouncementPacketDAO;
import org.db.model.AnnouncementPacket;

public class AnnouncementPacketHibernateImpl extends AbstractDAO implements AnnouncementPacketDAO {
	
	public boolean savePacket(AnnouncementPacket packet) {
		return save(packet);
	}

	public List<AnnouncementPacket> getAllPackets() {
		List<AnnouncementPacket> packetList = (List<AnnouncementPacket>) getAllRows(AnnouncementPacket.class);
		return packetList;
	}

	public boolean deletePacket(int packetId) {
		return delete(getPacket(packetId));
	}
	
	public AnnouncementPacket getPacket(int packetId) { //abstract dao içinde?
		return (AnnouncementPacket) getObject(AnnouncementPacket.class, packetId);
	}

}
