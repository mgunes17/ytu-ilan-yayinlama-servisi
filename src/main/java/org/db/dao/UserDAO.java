package org.db.dao;

import org.db.model.User;

public interface UserDAO {
	User getUser(String username);
	boolean isUserExist(String username);
	boolean update(Object user);
}
