package org.db.hibernate;

import java.util.List;

import org.db.dao.AnnouncementCategoryDAO;
import org.db.model.AnnouncementCategory;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

public class AnnouncementCategoryHibernateImpl extends AbstractDAO implements AnnouncementCategoryDAO {
	private Session session;

	public List<AnnouncementCategory> getAllCategories() {
		return (List<AnnouncementCategory>) getAllRows(AnnouncementCategory.class);
	}

	public boolean saveCategory(AnnouncementCategory category) {
		// TODO Auto-generated method stub
		return saveOrUpdate(category);
	}

	public AnnouncementCategory getCategory(int id) {
		return (AnnouncementCategory) getObject(AnnouncementCategory.class, (Object)id);
	}

	public boolean isCategoryNameExist(String name) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			session.getTransaction().begin();
			String query = "SELECT * FROM announcement_category WHERE category_name = " + "'" + name + "';";
			SQLQuery sqlQuery = session.createSQLQuery(query);
			sqlQuery.addEntity(AnnouncementCategory.class);
			if(sqlQuery.list().isEmpty())
				return false;
			else
				return true;
		} catch(Exception ex) {
			session.getTransaction().rollback();
			System.out.println("İsim kontrolü yapılırken hata: " + ex.getMessage());
			return true;
		} finally {
			session.close();
		}
	}

	public List<AnnouncementCategory> getParentCategories() {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			session.getTransaction().begin();
			String query = "SELECT * FROM announcement_category WHERE parent_category_id = 0";
			SQLQuery sqlQuery = session.createSQLQuery(query);
			sqlQuery.addEntity(AnnouncementCategory.class);
			List<AnnouncementCategory> parent = (List<AnnouncementCategory>) sqlQuery.list();
			return parent;
		} catch(Exception ex) {
			session.getTransaction().rollback();
			System.out.println("İsim kontrolü yapılırken hata: " + ex.getMessage());
			return null;
		} finally {
			session.close();
		}	
	}
		
}
