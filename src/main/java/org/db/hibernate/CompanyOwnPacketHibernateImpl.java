package org.db.hibernate;

import org.db.dao.CompanyOwnPacketDAO;
import org.db.model.CompanyOwnPacket;

public class CompanyOwnPacketHibernateImpl extends AbstractDAO implements CompanyOwnPacketDAO {

	public boolean save(CompanyOwnPacket cop) {
		return super.save(cop);
	}

}
