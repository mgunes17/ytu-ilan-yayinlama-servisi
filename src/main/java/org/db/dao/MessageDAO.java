package org.db.dao;

import java.util.List;

import org.db.model.Message;

public interface MessageDAO {
	List<Message> readMessages();
	void sendMessage(Message message);
}
