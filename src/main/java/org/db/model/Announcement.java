package org.db.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="announcement")
public class Announcement implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;
    
    @Column(name="title")
    private String title;
    
    @Column(name="brief", nullable=false)
    private String brief;
    
    @Column(name="content", nullable=false)
    private String content;
    
    @Column(name="number_of_page_views")
    private int numberOfPageViews;
    
    @Column(name="state")
    private int state; // ilan durumu oluşturulunca pasif, şikayette beklenen, aktif vs
    
    @ManyToOne  
    @JoinColumn(name = "owner_company", nullable=false)
    private Company ownerCompany; 
    
    @Column(name="owner_packet")
    private int ownerPacket;
    
    @ManyToOne
    @JoinColumn(name="announcement_type", nullable=false)
    private AnnouncementType announcementType; //staj, freelance, part time, full time
    
    public Announcement(){}

    public AnnouncementType getAnnouncementType() {
        return announcementType;
    }

    public void setAnnouncementType(AnnouncementType announcementType) {
        this.announcementType = announcementType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getNumberOfPageViews() {
        return numberOfPageViews;
    }

    public void setNumberOfPageViews(int numberOfPageViews) {
        this.numberOfPageViews = numberOfPageViews;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public Company getOwnerCompany() {
        return ownerCompany;
    }

    public void setOwnerCompany(Company ownerCompany) {
        this.ownerCompany = ownerCompany;
    }

    public int getOwnerPacket() {
        return ownerPacket;
    }

    public void setOwnerPacket(int ownerPacket) {
        this.ownerPacket = ownerPacket;
    }
}
