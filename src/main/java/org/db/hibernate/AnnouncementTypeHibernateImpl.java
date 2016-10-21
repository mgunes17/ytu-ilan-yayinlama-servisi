package org.db.hibernate;

import java.util.List;

import org.db.dao.AnnouncementTypeDAO;
import org.db.model.AnnouncementType;

public class AnnouncementTypeHibernateImpl extends AbstractDAO implements AnnouncementTypeDAO {

	public List<AnnouncementType> getAllAnnouncementTypes() {
		// TODO Auto-generated method stub
		return getAllRows(AnnouncementType.class);
	}

}
