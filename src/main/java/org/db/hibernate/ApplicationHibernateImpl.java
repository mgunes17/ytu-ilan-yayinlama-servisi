package org.db.hibernate;

import org.db.dao.ApplicationDAO;
import org.db.model.Application;

public class ApplicationHibernateImpl extends AbstractDAO implements ApplicationDAO {

	public boolean application(Application app) {
		return save(app);
	}

}
