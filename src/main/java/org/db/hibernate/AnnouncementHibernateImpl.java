package org.db.hibernate;

import java.util.List;

import org.db.dao.AnnouncementDAO;
import org.db.model.Announcement;
import org.db.model.AnnouncementType;

public class AnnouncementHibernateImpl extends AbstractDAO implements AnnouncementDAO {

	public List<AnnouncementType> getAllAnnouncementsTypes() {
		// TODO Auto-generated method stub
		return getAllRows(AnnouncementType.class);
	}

	public boolean saveAnnouncement(Announcement ann) {
		// TODO Auto-generated method stub
		return save(ann);
	}

}
