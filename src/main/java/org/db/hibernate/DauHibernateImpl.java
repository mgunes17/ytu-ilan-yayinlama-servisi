package org.db.hibernate;

import java.util.List;

import org.db.dao.DonationAcceptUnitDAO;
import org.db.model.BankAccountInfo;
import org.db.model.CompanyOwnPacket;
import org.db.model.DonationAcceptUnit;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

public class DauHibernateImpl extends AbstractDAO implements DonationAcceptUnitDAO{
	private Session session;

	public boolean saveDonationAcceptUnit(DonationAcceptUnit dau) {
		return save(dau);
	}

	public boolean saveBankAccount(BankAccountInfo bai) {
		return save(bai);
	}

	public List<DonationAcceptUnit> getAllUnits() {
		return getAllRows(DonationAcceptUnit.class);
	}

	public List<CompanyOwnPacket> getWaitingDonation(String dauUsername) {
		try {
			String query = 
					"select id, owner_company, packet, used_announcements, approved, user_for_approved, time_to_request, time_to_approved " +
					"from company_own_packet cop, announcement_packet ap " +
					"where cop.packet=ap.packet_id and ap.donate_accept_unit = '" + dauUsername + "' ";
			session = HibernateSessionFactory.getSessionFactory().openSession();
			session.beginTransaction();
			SQLQuery sqlQuery = session.createSQLQuery(query);
			sqlQuery.addEntity(CompanyOwnPacket.class);
			List<CompanyOwnPacket> packetList = sqlQuery.list();
			session.getTransaction().commit();
			
			return packetList;
			
		} catch(Exception ex) {
			session.getTransaction().rollback();
			System.err.println("Bekleyen bağışlar getirilemedi:" + ex.getMessage());
			return null;
		}
		finally {
			session.close();
		}
		
	}

}
