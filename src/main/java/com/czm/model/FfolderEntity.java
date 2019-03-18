package com.czm.model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "ffolder", schema = "filemanager", catalog = "")
public class FfolderEntity {
    private int ffolderId;
    private NoteEntity noteByNoteId;
    private UserEntity userByUserId;
    private CourseEntity courseByCourseId;

    public FfolderEntity(){

    }
    public FfolderEntity(NoteEntity noteByNoteId, UserEntity userByUserId, CourseEntity courseByCourseId) {
        this.noteByNoteId = noteByNoteId;
        this.userByUserId = userByUserId;
        this.courseByCourseId = courseByCourseId;
    }

    @Id
    @Column(name = "ffolderId")
    public int getFfolderId() {
        return ffolderId;
    }

    public void setFfolderId(int ffolderId) {
        this.ffolderId = ffolderId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FfolderEntity that = (FfolderEntity) o;
        return ffolderId == that.ffolderId  ;
    }

    @Override
    public int hashCode() {
        return Objects.hash(ffolderId);
    }

    @ManyToOne
    @JoinColumn(name = "noteId", referencedColumnName = "NoteId", nullable = false)
    public NoteEntity getNoteByNoteId() {
        return noteByNoteId;
    }

    public void setNoteByNoteId(NoteEntity noteByNoteId) {
        this.noteByNoteId = noteByNoteId;
    }

    @ManyToOne
    @JoinColumn(name = "userId", referencedColumnName = "userId")
    public UserEntity getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(UserEntity userByUserId) {
        this.userByUserId = userByUserId;
    }

    @ManyToOne
    @JoinColumn(name = "courseId", referencedColumnName = "courseId")
    public CourseEntity getCourseByCourseId() {
        return courseByCourseId;
    }

    public void setCourseByCourseId(CourseEntity courseByCourseId) {
        this.courseByCourseId = courseByCourseId;
    }
}
