package org.db.dao;

import org.db.model.DauUser;

public interface DauUserDAO {
	boolean saveDauUser(DauUser user);
	boolean deleteUser(String username);
}
