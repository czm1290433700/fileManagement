package com.czm.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "course", schema = "filemanager", catalog = "")
public class CourseEntity {
    private int courseId;
    private Integer noteNum;
    private Integer ffolderNum;
    private String name;
    private UserEntity userByUserId;
    private Collection<NoteEntity> notesByCourseId;

    @Id
    @Column(name = "courseId")
    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    @Basic
    @Column(name = "noteNum")
    public Integer getNoteNum() {
        return noteNum;
    }

    public void setNoteNum(Integer noteNum) {
        this.noteNum = noteNum;
    }

    @Basic
    @Column(name = "ffolderNum")
    public Integer getFfolderNum() {
        return ffolderNum;
    }

    public void setFfolderNum(Integer ffolderNum) {
        this.ffolderNum = ffolderNum;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CourseEntity that = (CourseEntity) o;
        return courseId == that.courseId &&
                Objects.equals(noteNum, that.noteNum) &&
                Objects.equals(ffolderNum, that.ffolderNum) &&
                Objects.equals(name, that.name) ;
    }

    @Override
    public int hashCode() {
        return Objects.hash(courseId, noteNum, ffolderNum, name);
    }

    @ManyToOne
    @JoinColumn(name = "userId", referencedColumnName = "userId", nullable = false)
    public UserEntity getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(UserEntity userByUserId) {
        this.userByUserId = userByUserId;
    }

    @OneToMany(mappedBy = "courseByCourseId")
    public Collection<NoteEntity> getNotesByCourseId() {
        return notesByCourseId;
    }

    public void setNotesByCourseId(Collection<NoteEntity> notesByCourseId) {
        this.notesByCourseId = notesByCourseId;
    }
}
