package org.db.hibernate;

import java.util.List;

import org.db.dao.MessageDAO;
import org.db.model.Message;
import org.hibernate.Session;

public class MessageHibernateImpl extends AbstractDAO implements MessageDAO {
	
	public List<Message> readMessages() {
		List<Message> messageList = (List<Message>) getAllRows(Message.class);
		return messageList;
	}
	

	public void sendMessage(Message message) {
		save(message);
	}
}
