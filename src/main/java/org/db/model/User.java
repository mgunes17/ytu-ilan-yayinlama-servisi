package org.db.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "users")
@Inheritance(strategy = InheritanceType.JOINED)
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "user_name")
	private String userName;

	@Column(name = "passwordFor", nullable = true)
	private String password;

	@Column(name = "user_type_no")
	private int userTypeNo;

	@Column(name = "membership_status")
	private int status;

	@OneToMany(mappedBy="user",  
            targetEntity=CommunicationWay.class, 
    fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	private List<CommunicationWay> commWays = new ArrayList<CommunicationWay>();

	public User() {
	}

	public User(String userName, String password, int userTypeNo) {
		this.userName = userName;
		this.password = password;
		this.userTypeNo = userTypeNo;
	}

	public List<CommunicationWay> getCommWays() {
		return commWays;
	}

	public String getPassword() {
		return password;
	}

	public int getStatus() {
		return status;
	}

	public String getUserName() {
		return userName;
	}

	public int getUserTypeNo() {
		return userTypeNo;
	}

	public void setCommWays(List<CommunicationWay> commWays) {
		this.commWays = commWays;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setStatus(int id) {
		status = id;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setUserTypeNo(int userTypeNo) {
		this.userTypeNo = userTypeNo;
	}
}
