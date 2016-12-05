package org.db.hibernate;

import org.db.dao.CompanyOwnPacketDAO;
import org.db.model.CompanyOwnPacket;

import java.util.List;

public class CompanyOwnPacketHibernateImpl extends AbstractDAO implements CompanyOwnPacketDAO {

	public boolean save(CompanyOwnPacket cop) {
		return super.save(cop);
	}

	public boolean updatePacket(CompanyOwnPacket cop) {
		return save(cop);
	}

	public CompanyOwnPacket getPacket(int packetId) {
		return (CompanyOwnPacket) getObject(CompanyOwnPacket.class, (Object)packetId);
	}

	public List<CompanyOwnPacket> getWaitingPacketsToCompany(String companyUserName) {
		String sql = "SELECT * FROM company_own_packet " +
				"WHERE owner_company = '" + companyUserName + "' and approved = FALSE and user_for_approved is null" +
				" order by time_to_request";

		return getRowsBySQLQuery(CompanyOwnPacket.class, sql);
	}

}
