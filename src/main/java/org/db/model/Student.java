package org.db.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;


@Entity
@Table(name="student")
@PrimaryKeyJoinColumn(name="user_name")
public class Student extends User implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Column(name="name" ,nullable=false)
    private String name;
	
    @Column(name="surname" ,nullable=false)
    private String surname;
    
    @ManyToOne
    @JoinColumn(name="department" ,nullable=false)
    private Department department;
    
    @OneToMany(mappedBy="pk.user", targetEntity=Application.class, 
    		fetch = FetchType.EAGER, cascade=CascadeType.ALL)
    @Fetch(value = FetchMode.SUBSELECT)
    private List<Application> myApplications = new ArrayList<Application>();

	public Student(){
        super();
    }

	public boolean isApplication(int id) {
		boolean application = false;
		int index = 0;
		
		while(application == false && index < myApplications.size()) {
			if(myApplications.get(index).getPk().getAnnouncement().getId() == id)
				application = true;
			
			index++;
		}
		
		return application;
	}
	
	//getter-setter
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
    
    public List<Application> getMyApplications() {
		return myApplications;
	}

	public void setMyApplications(List<Application> myApplications) {
		this.myApplications = myApplications;
	}
}
