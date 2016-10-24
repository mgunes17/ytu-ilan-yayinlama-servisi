package org.db.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
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
    
    @OneToMany(mappedBy="company", cascade=CascadeType.ALL)
    private List<Announcement> announcements;
    
    @OneToMany(mappedBy="company", cascade=CascadeType.ALL)
    private List<AnnouncementPacket> packets;

	public Company(String mersisNo, String companyName, String username, String password) {
        super(username, password, 2);
        this.companyName = companyName;
    }

    public Company(){
    	super();
    }
    
    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
    
    public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public List<Announcement> getAnnouncements() {
		return announcements;
	}

	public void setAnnouncements(List<Announcement> announcements) {
		this.announcements = announcements;
	}
	
	public List<AnnouncementPacket> getPackets() {
		return packets;
	}

	public void setPackets(List<AnnouncementPacket> packets) {
		this.packets = packets;
	}

}
