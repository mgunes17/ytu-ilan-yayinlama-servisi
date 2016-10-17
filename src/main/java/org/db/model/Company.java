package org.db.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="company")
@PrimaryKeyJoinColumn(name="user_name")
public class Company extends User implements Serializable {
	private static final long serialVersionUID = 1L;
    
    @Column(name="company_name", nullable=false)
    private String companyName;
    
    @Column(name="location", nullable=true)
    private String location;

    public Company(String mersisNo, String companyName, String username, String password) {
        super(username, password, 2);
        this.companyName = companyName;
    }

    public Company(){}
    
    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getLocaiton() {
        return location;
    }

    public void setLocaiton(String locaiton) {
        this.location = locaiton;
    }
}
