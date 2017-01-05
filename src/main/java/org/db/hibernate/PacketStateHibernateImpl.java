package org.db.hibernate;

import org.db.dao.AnnouncementPacketStateDAO;
import org.db.model.AnnouncementPacketState;

import java.util.List;

public class PacketStateHibernateImpl extends AbstractDAO implements AnnouncementPacketStateDAO {

	public AnnouncementPacketState getPacketState(int id) {
		return (AnnouncementPacketState) getObject(AnnouncementPacketState.class, id);
	}

	public List<AnnouncementPacketState> getAllStates() {
		return (List<AnnouncementPacketState>) getAllRows(AnnouncementPacketState.class);
	}

}
