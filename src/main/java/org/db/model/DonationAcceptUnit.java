package org.db.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "donation_accept_unit")
public class DonationAcceptUnit implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="unit_name", nullable=false)
    private String unitName;
	
    @Column(name="balance")
    private int balance;
    
    
    @OneToMany(mappedBy="dau",  
            targetEntity=DauUser.class, cascade = CascadeType.ALL)
    List<DauUser> dauUser = new ArrayList<DauUser>();
    
    @OneToMany(mappedBy="ownerUnitName",  
    	    targetEntity=BankAccountInfo.class, cascade = CascadeType.ALL)
    List<BankAccountInfo> account = new ArrayList<BankAccountInfo>();

    public DonationAcceptUnit(){
        super();
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
