package org.db.dao;

import java.util.List;

import org.db.model.Announcement;
import org.db.model.Company;

public interface AnnouncementDAO {
	boolean saveAnnouncement(Announcement ann);
	List<Announcement> getAllAnnouncements();
	List<Announcement> getAnnouncementsOfCompany(String userName);
	Announcement getAnnouncement(int id);
	boolean updateAnnouncement(Announcement ann);
}
