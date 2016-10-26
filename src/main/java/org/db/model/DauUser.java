package org.db.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="dau_user")
@PrimaryKeyJoinColumn(name="user_name")

public class DauUser  extends User {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@ManyToOne
	@JoinColumn(name = "unit_name")
	private DonationAcceptUnit dau;

	public DauUser() {
		super();
	}
	
	public DonationAcceptUnit getDau() {
		return dau;
	}

	public void setDau(DonationAcceptUnit dau) {
		this.dau = dau;
	}
}
