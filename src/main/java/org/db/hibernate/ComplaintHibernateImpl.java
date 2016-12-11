package org.db.hibernate;

import org.db.dao.CompanyDAO;
import org.db.dao.ComplaintDAO;
import org.db.model.Complaint;

/**
 * Created by mgunes on 11.12.2016.
 */
public class ComplaintHibernateImpl extends AbstractDAO implements ComplaintDAO {

    public boolean saveComplaint(Complaint complaint) {
        return save(complaint);
    }

    public boolean deleteComplaint(String username, int announcementID) {
        String query = "DELETE FROM complaint WHERE student = '" + username + "' and announcement = " + announcementID;
        return updateBySQLQuery(Complaint.class, query);
    }
}
