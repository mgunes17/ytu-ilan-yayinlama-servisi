package org.db.hibernate;

import java.util.List;

import org.db.dao.AnnouncementPacketDAO;
import org.db.model.AnnouncementPacket;
import org.hibernate.Session;

public class AnnouncementPacketHibernateImpl extends AbstractDAO implements AnnouncementPacketDAO {
	private Session session;

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
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			session.beginTransaction();
			AnnouncementPacket packet = session.get(AnnouncementPacket.class, packetId);
			session.getTransaction().commit();
			return packet;
		}
		catch(Exception ex) {
			System.out.println("Paket getirilemedi");
			session.getTransaction().rollback();
			return null;
		}
		finally {
			session.close();
		}
	}

}
