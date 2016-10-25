package org.db.hibernate;

import static org.junit.Assert.assertEquals;

import org.db.dao.UserDAO;
import org.junit.Test;

public class CompanyTest {
    
    @Test
    public void saveCompany() {
    	UserDAO userDAO = new UserHibernateImpl();
    	assertEquals(true, userDAO.isUserExist("sirket1")); 	
    }
}
