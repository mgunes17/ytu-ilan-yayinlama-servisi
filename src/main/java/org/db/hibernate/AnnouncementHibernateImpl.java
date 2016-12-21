package org.db.hibernate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.announcement.SearchCriteria;
import org.db.dao.AnnouncementDAO;
import org.db.model.Announcement;
import org.db.model.AnnouncementType;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import javax.servlet.http.HttpSession;

public class AnnouncementHibernateImpl extends AbstractDAO implements AnnouncementDAO {
	private Session session;

	public List<AnnouncementType> getAllAnnouncementsTypes() {
		return getAllRows(AnnouncementType.class);
	}

	public boolean saveAnnouncement(Announcement ann) {
		return justSave(ann);
	}

	public List<Announcement> getAllAnnouncements() {
		return getAllRows(Announcement.class);
	}

	public List<Announcement> getAnnouncementsOfCompany(String userName) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			session.getTransaction().begin();
			String query = " SELECT *  FROM announcement where owner_company = '" + userName + "';";
			SQLQuery sqlQuery = session.createSQLQuery(query);
			sqlQuery.addEntity(Announcement.class);
			List<Announcement> annList = sqlQuery.list();
			session.getTransaction().commit();
			return annList;
		} catch(Exception ex) {
			session.getTransaction().rollback();
			System.out.println("Şirket ilanları getirilemedi:" + ex.getMessage());
			return null;
		} finally {
			session.close();
		}
	}

	public Announcement getAnnouncement(int id) {
		return (Announcement) getObject(Announcement.class, id);
	}

	public boolean updateAnnouncement(Announcement ann) {
		return save(ann);
	}

    public List<Announcement> getSuspendedAnnouncements() {
        String hql = "FROM Announcement WHERE state = 4";
        return getRowsByQuery(Announcement.class, hql, new HashMap<String, Object>());
    }

	public List<Announcement> getSuspendedOrderByName() {
		String hql = "FROM Announcement WHERE state = 4 ORDER BY ownerCompany";
		return getRowsByQuery(Announcement.class, hql, new HashMap<String, Object>());
	}

	public List<Announcement> getSuspendedOrderByDate() {
        String hql = "FROM Announcement WHERE state = 4 ORDER BY ownerCompany";
        return getRowsByQuery(Announcement.class, hql, new HashMap<String, Object>());
	}

	public List<Announcement> getActiveAnnouncements() {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			session.getTransaction().begin();
			String query = "SELECT *"
							+ " FROM announcement where state = 2;";
			SQLQuery sqlQuery = session.createSQLQuery(query);
			sqlQuery.addEntity(Announcement.class);
			List<Announcement> annList = sqlQuery.list();
			session.getTransaction().commit();
			return annList;
		} catch(Exception ex) {
			session.getTransaction().rollback();
			System.out.println("Aktif ilanlar getirilemedi:" + ex.getMessage());
			return null;
		} finally {
			session.close();
		}
	}

	public List<Announcement> getByCriteria(SearchCriteria criteria) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			session.beginTransaction();
			String query = "SELECT * FROM announcement " +
					"WHERE announcement_type = " + criteria.getTypeId() + " AND announcement_category = " + criteria.getCategoryId() + 
					" AND announcement_language = " + "'" + criteria.getLanguage() + "';";
			SQLQuery sqlQuery = session.createSQLQuery(query);
			sqlQuery.addEntity(Announcement.class);
			List<Announcement> annList = sqlQuery.list();
			session.getTransaction().commit();
			return annList;
		} catch (Exception e) {
			session.getTransaction().rollback();
			System.out.println("Kritere göre ilan filtreleme işlemi başarısız: " + e.getMessage());
			return null;
		} finally {
			session.close();
		}
	}

	public List<Announcement> getBySQLCriteria(String query) {
		return getRowsBySQLQuery(Announcement.class, query);
	}

	public List<Announcement> getByCriteria(Map<String, Object> parameter) {
	    String sql = "SELECT * from announcement";

	    if(parameter.size() != 0) {
            sql += " WHERE";
            for(String s: parameter.keySet()) {
                sql += " " + s + " = " + parameter.get(s) + " and ";
            }

            sql = sql.substring(0, sql.length() - 4); //son and i sil
        }

		return getRowsBySQLQuery(Announcement.class, sql);
	}

	public List<Announcement> getComplaintAnnouncement() {
		String sql = "SELECT a.id, a.title, a.brief, a.content, a.number_of_page_views, a.state, a.owner_company, a.owner_packet, a.proper_complaint, " +
                "a.announcement_type, a.announcement_language, a.announcement_category, a.application_count, a.publish_date " +
                "FROM announcement a, complaint c " +
                "WHERE a.state = 2 and c.announcement = a.id and a.proper_complaint = TRUE " +
                "group by a.id;";

		return getRowsBySQLQuery(Announcement.class, sql);
	}

}
