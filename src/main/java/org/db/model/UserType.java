package org.db.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_type")
public class UserType {
    @Id
    @Column(name="type_no")
    private int typeNo;
    
    @Column(name="type_name")
    private String typeName;
    
    @Column(name="main_page")
    private String mainPage;

    public int getType_no() {
        return typeNo;
    }

    public void setType_no(int typeNo) {
        this.typeNo = typeNo;
    }

    public String getType_name() {
        return typeName;
    }

    public void setType_name(String typeNo) {
        this.typeName = typeNo;
    }

    public String getMain_page() {
        return mainPage;
    }

    public void setMain_page(String main_page) {
        this.mainPage = main_page;
    }
}
