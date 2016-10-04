package org.db.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="announcement_packet")
public class AnnouncementPacket implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
    @Column(name="packet_id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int packetId;
    @Column(name="title")
    private String title;
    @Column(name="announcement_count", nullable=false)
    private int announcementCount;
    @Column(name="price", nullable=false)
    private int price;
    @Column(name="last_date_used", nullable=false)
    private Date lastDateUsed;
    @Column(name="active_time", nullable=false)
    private int activeTime;
    @Column(name="currency", nullable=false)
    private int currency;
    @Column(name="condition", nullable=false)
    private String condition;
    @Column(name="donate_accept_unit", nullable=false)
    private String donateAcceptUnit;

    public AnnouncementPacket(){
        
    }
    
    public int getPacketId() {
        return packetId;
    }

    public void setPacketId(int packetId) {
        this.packetId = packetId;
    }

    public int getAnnouncementCount() {
        return announcementCount;
    }

    public void setAnnouncementCount(int announcementCount) {
        this.announcementCount = announcementCount;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Date getLastDateUsed() {
        return lastDateUsed;
    }

    public void setLastDateUsed(Date lastDateUsed) {
        this.lastDateUsed = lastDateUsed;
    }

    public int getActiveTime() {
        return activeTime;
    }

    public void setActiveTime(int activeTime) {
        this.activeTime = activeTime;
    }

    public int getCurrency() {
        return currency;
    }

    public void setCurrency(int currency) {
        this.currency = currency;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getDonateAcceptUnit() {
        return donateAcceptUnit;
    }

    public void setDonateAcceptUnit(String donateAcceptUnit) {
        this.donateAcceptUnit = donateAcceptUnit;
    }
    
    public String getTitle() {
        return condition;
    }

    public void setTitle(String condition) {
        this.condition = condition;
    }
}
