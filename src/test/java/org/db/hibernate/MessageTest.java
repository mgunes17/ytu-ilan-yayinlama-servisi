package org.db.hibernate;

import static org.junit.Assert.assertEquals;

import java.util.Date;

import org.db.compositePK.MessagePK;
import org.db.dao.MessageDAO;
import org.db.model.Message;
import org.junit.Before;
import org.junit.Test;

public class MessageTest {
	private Message message;
	private MessageDAO messageDAO;
	private MessagePK pk;
	
	@Before
	public void initialize() {
		message = new Message();
		pk = new MessagePK();
		messageDAO = new MessageHibernateImpl();
	}
	
	@Test
	public void sendMessage() {
		
		message.setMessageTitle("title");
		message.setIsRead(false);
		message.setMessageBody("message-body");
		message.setIPAddress("127.0.0.1");
		
		pk.setMailAddress("a@b.com");
		pk.setDateTime(new Date());

		
		message.setPk(pk);
		
		assertEquals(true, messageDAO.sendMessage(message));
	}
	
	@Test 
	public void delete() {
		assertEquals(true, messageDAO.deleteMessage(message));
	}
	
	@Test
	public void listMessages() {
		MessageDAO messageDAO = new MessageHibernateImpl();
		assertEquals(8, messageDAO.readMessages().size());
	}
}
