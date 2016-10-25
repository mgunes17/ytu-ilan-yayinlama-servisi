package org.db.hibernate;

import java.util.List;

import org.db.dao.MessageDAO;
import org.db.model.Message;

public class MessageHibernateImpl extends AbstractDAO implements MessageDAO {
	
	public List<Message> readMessages() {
		List<Message> messageList = (List<Message>) getAllRows(Message.class);
		return messageList;
	}
	

	public boolean sendMessage(Message message) {
		return save(message);
	}
	
	public boolean deleteMessage(Message message) {
		return delete(message);
	}

}
