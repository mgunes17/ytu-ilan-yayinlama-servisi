package org.db.dao;

import org.db.model.Complaint;

/**
 * Created by mgunes on 11.12.2016.
 */
public interface ComplaintDAO {
    boolean saveComplaint(Complaint complaint);
    boolean deleteComplaint(String username, int announcementID);
}
