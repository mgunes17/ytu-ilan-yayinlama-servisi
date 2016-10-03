package org.db.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="donation_accept_unit")
@PrimaryKeyJoinColumn(name="user_name")

public class DonationAcceptUnit extends User {
	private static final long serialVersionUID = 1L;
	
	@Column(name="unit_name", nullable=false)
    private String unitName;
	
    @Column(name="balance")
    private int balance;

    public DonationAcceptUnit(){
        
    }
    
    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }
}
