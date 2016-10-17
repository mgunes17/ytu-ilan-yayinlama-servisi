package org.db.model;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.db.compositePK.CommunicationWayPK;

@Entity
@Table(name="communication_way")

public class CommunicationWay {
	
	@EmbeddedId
	private CommunicationWayPK pk;

	public CommunicationWay() { }
	
	public CommunicationWay(CommunicationWayPK pk) {
		this.pk = pk;
	}
	
	public CommunicationWayPK getPk() {
		return pk;
	}

	public void setPk(CommunicationWayPK pk) {
		this.pk = pk;
	}
	
}
