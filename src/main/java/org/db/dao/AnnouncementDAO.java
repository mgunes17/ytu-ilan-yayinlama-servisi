package org.db.dao;

import java.util.List;

import org.announcement.SearchCriteria;
import org.db.model.Announcement;

public interface AnnouncementDAO {
	boolean saveAnnouncement(Announcement ann);
	List<Announcement> getAllAnnouncements();
	List<Announcement> getAnnouncementsOfCompany(String userName);
	List<Announcement> getActiveAnnouncements();
	List<Announcement> getByCriteria(SearchCriteria criteria);
	Announcement getAnnouncement(int id);
	boolean updateAnnouncement(Announcement ann);
}
