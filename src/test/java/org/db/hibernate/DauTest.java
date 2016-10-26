package org.db.hibernate;

import static org.junit.Assert.*;

import org.db.dao.DonationAcceptUnitDAO;
import org.junit.Test;

public class DauTest {
	
	@Test
	public void getWaitingDonationTest() {
		String username = "dau1";
		DonationAcceptUnitDAO dau = new DauHibernateImpl();
		assertEquals(4, dau.getWaitingDonation(username).size());
	}

}
