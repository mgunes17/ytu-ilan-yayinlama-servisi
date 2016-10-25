package org.db.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.db.compositePK.MessagePK;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;

@Entity
@Table(name="message")
public class Message implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private MessagePK pk;
	
    @Column(name="message_no", columnDefinition="serial")
    //@GenericGenerator(name="fieldGenerator", strategy="sequence")
    @Generated(GenerationTime.INSERT)     
    private int messageNo;
    
    @Column(name="message_title", nullable=false)
    private String messageTitle;
    
    @Column(name="message_body", nullable=false)
    private String messageBody;
    
    @Column(name="is_read", nullable=false)
    private boolean isRead;
    
    @Column(name="sender_ip_address", nullable=false)
    private String IPAddress;
    
    
    public String getIPAddress() {
        return IPAddress;
    }

    public void setIPAddress(String IPAddress) {
        this.IPAddress = IPAddress;
    }

    public boolean isIsRead() {
        return isRead;
    }

    public void setIsRead(boolean isRead) {
        this.isRead = isRead;
    }

    public int getMessageNo() {
        return messageNo;
    }

    public String getMessageTitle() {
        return messageTitle;
    }

    public void setMessageTitle(String messageTitle) {
        this.messageTitle = messageTitle;
    }

    public String getMessageBody() {
        return messageBody;
    }

    public void setMessageBody(String messageBody) {
        this.messageBody = messageBody;
    }
    
    public MessagePK getPk() {
		return pk;
	}

	public void setPk(MessagePK pk) {
		this.pk = pk;
	}

}
