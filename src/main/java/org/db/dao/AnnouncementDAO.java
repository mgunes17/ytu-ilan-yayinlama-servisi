package org.db.dao;

import java.util.List;

import org.db.model.Announcement;

public interface AnnouncementDAO {
	boolean saveAnnouncement(Announcement ann);
	List<Announcement> getAllAnnouncements();
}
