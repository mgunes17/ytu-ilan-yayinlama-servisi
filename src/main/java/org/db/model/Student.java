package org.db.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;


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

    public Student(){
        super();
    }

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
}
