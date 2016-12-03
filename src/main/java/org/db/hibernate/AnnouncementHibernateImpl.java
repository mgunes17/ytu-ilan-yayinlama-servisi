package org.db.hibernate;

import java.util.List;

import org.announcement.SearchCriteria;
import org.db.dao.AnnouncementDAO;
import org.db.model.Announcement;
import org.db.model.AnnouncementType;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

public class AnnouncementHibernateImpl extends AbstractDAO implements AnnouncementDAO {
	private Session session;

	public List<AnnouncementType> getAllAnnouncementsTypes() {
		// TODO Auto-generated method stub
		return getAllRows(AnnouncementType.class);
	}

	public boolean saveAnnouncement(Announcement ann) {
		// TODO Auto-generated method stub
		return save(ann);
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
		return saveOrUpdate(ann);
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

}
