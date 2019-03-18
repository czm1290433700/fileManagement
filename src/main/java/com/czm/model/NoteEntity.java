package com.czm.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "note", schema = "filemanager", catalog = "")
public class NoteEntity {
    private int noteId;
    private String title;
    private String content;
    private String createTime;
    private Byte isPublic;
    private int view;
    private Collection<CommentEntity> commentsByNoteId;
    private CourseEntity courseByCourseId;
    private UserEntity userByUserId;

    @Id
    @Column(name = "NoteId")
    public int getNoteId() {
        return noteId;
    }

    public void setNoteId(int noteId) {
        this.noteId = noteId;
    }

    @Basic
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Basic
    @Column(name = "createTime")
    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    @Basic
    @Column(name = "isPublic")
    public Byte getIsPublic() {
        return isPublic;
    }

    public void setIsPublic(Byte isPublic) {
        this.isPublic = isPublic;
    }

    @Basic
    @Column(name = "view")
    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        NoteEntity that = (NoteEntity) o;
        return noteId == that.noteId &&
                Objects.equals(title, that.title) &&
                Objects.equals(content, that.content) &&
                Objects.equals(createTime, that.createTime) &&
                Objects.equals(isPublic, that.isPublic)&&
                Objects.equals(view, that.view);
    }

    @Override
    public int hashCode() {
        return Objects.hash(noteId, title, content, createTime, isPublic,view);
    }

    @OneToMany(mappedBy = "noteByNoteId",fetch = FetchType.EAGER)
    public Collection<CommentEntity> getCommentsByNoteId() {
        return commentsByNoteId;
    }

    public void setCommentsByNoteId(Collection<CommentEntity> commentsByNoteId) {
        this.commentsByNoteId = commentsByNoteId;
    }

    @ManyToOne
    @JoinColumn(name = "courseId", referencedColumnName = "courseId", nullable = false)
    public CourseEntity getCourseByCourseId() {
        return courseByCourseId;
    }

    public void setCourseByCourseId(CourseEntity courseByCourseId) {
        this.courseByCourseId = courseByCourseId;
    }

    @ManyToOne
    @JoinColumn(name = "userId", referencedColumnName = "userId", nullable = false)
    public UserEntity getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(UserEntity userByUserId) {
        this.userByUserId = userByUserId;
    }
}
