package org.db.hibernate;

import org.db.dao.AnnouncementPacketStateDAO;
import org.db.model.AnnouncementPacketState;

public class PacketStateHibernateImpl extends AbstractDAO implements AnnouncementPacketStateDAO {

	public AnnouncementPacketState getPacketState(int id) {
		return (AnnouncementPacketState) getObject(AnnouncementPacketState.class, id);
	}

}
