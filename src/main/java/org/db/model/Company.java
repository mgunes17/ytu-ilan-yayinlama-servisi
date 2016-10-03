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
	
    @Column(name="mersis_no", unique=true, nullable=false)
    private String mersisNo;
    
    @Column(name="company_name", nullable=false)
    private String companyName;
    
    @Column(name="location", nullable=false)
    private String location;

    public Company(String mersisNo, String companyName, String location, String
            username, String password) {
        super(username, password, 2);
        this.mersisNo = mersisNo;
        this.companyName = companyName;
        this.location = location;
    }

    public Company(){}
    
    public String getMersisNo() {
        return mersisNo;
    }

    public void setMersisNo(String mersisNo) {
        this.mersisNo = mersisNo;
    }

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
