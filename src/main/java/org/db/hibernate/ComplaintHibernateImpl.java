package org.db.hibernate;

import org.db.dao.CompanyDAO;
import org.db.dao.ComplaintDAO;
import org.db.model.Complaint;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.Date;

/**
 * Created by mgunes on 11.12.2016.
 */
public class ComplaintHibernateImpl extends AbstractDAO implements ComplaintDAO {
    private Session session;

    public boolean saveComplaint(Complaint complaint) {
        return save(complaint);
    }

    public boolean deleteComplaint(String username, int announcementID) {
        String query = "DELETE FROM complaint WHERE student = '" + username + "' and announcement = " + announcementID;
        return updateBySQLQuery(Complaint.class, query);
    }

    public boolean punishAnnouncement(int annID, String result, String resultReply) {
        session = HibernateSessionFactory.getSessionFactory().openSession();
        String annHql = "UPDATE Announcement SET state = 4 WHERE id = " + annID;
        String complaintHQL = "UPDATE Complaint SET result = '" + result + "', resultReply = '" + resultReply + "', " +
                " resultTime = '" + new Date() + "' WHERE announcement = " + annID;

        try {
            session.getTransaction().begin();
            Query query1 = session.createQuery(annHql);
            Query query2 = session.createQuery(complaintHQL);

            query1.executeUpdate();
            query2.executeUpdate();

            session.getTransaction().commit();

            return  true;
        } catch (Exception ex) {
            session.getTransaction().commit();
            System.out.println("Şikayet güncellenemedi:" + ex.getMessage());
            return false;
        } finally {
            session.close();
        }
    }
}
