package org.db.hibernate;

import org.db.dao.DauUserDAO;
import org.db.model.DauUser;

public class DauUserHibernateImpl extends AbstractDAO implements DauUserDAO {

	public boolean saveDauUser(DauUser user) {
		return save(user);
	}

}
