package org.db.dao;

import java.util.List;
import java.util.Map;

import org.announcement.SearchCriteria;
import org.db.model.Announcement;

import javax.servlet.http.HttpSession;

public interface AnnouncementDAO {
	boolean saveAnnouncement(Announcement ann);
	List<Announcement> getAllAnnouncements();
	List<Announcement> getAnnouncementsOfCompany(String userName);
	List<Announcement> getActiveAnnouncements();
	List<Announcement> getByCriteria(SearchCriteria criteria);
	List<Announcement> getBySQLCriteria(String query);
    List<Announcement> getByCriteria(Map<String, Object> parameter);
	List<Announcement> getComplaintAnnouncement();
	Announcement getAnnouncement(int id);
	boolean updateAnnouncement(Announcement ann);
}
