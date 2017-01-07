package org.db.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by mgunes on 07.01.2017.
 */
@Entity
@Table(name = "interests")
public class Interests implements Serializable {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @ManyToOne
    @JoinColumn(name = "student")
    private Student student;

    @ManyToOne
    @JoinColumn(name = "category")
    private AnnouncementCategory category;

    @ManyToOne
    @JoinColumn(name = "ann_type")
    private AnnouncementType type;

    @Column(name = "language")
    private String language;

    @Column(name = "keywords")
    private String keywords;

    public Interests() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public AnnouncementCategory getCategory() {
        return category;
    }

    public void setCategory(AnnouncementCategory category) {
        this.category = category;
    }

    public AnnouncementType getType() {
        return type;
    }

    public void setType(AnnouncementType type) {
        this.type = type;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}
