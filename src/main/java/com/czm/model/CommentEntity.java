package com.czm.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "comment", schema = "filemanager", catalog = "")
public class CommentEntity {
    private Timestamp commentTime;
    private String content;
    private int commentId;
    private UserEntity userBySenderId;
    private NoteEntity noteByNoteId;
    private AnswerEntity answerByAnswerId;
    private Collection<CommentreplyEntity> commentrepliesByCommentId;

    @Basic
    @Column(name = "commentTime")
    public Timestamp getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Timestamp commentTime) {
        this.commentTime = commentTime;
    }

    @Basic
    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Id
    @Column(name = "commentId")
    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CommentEntity that = (CommentEntity) o;
        return commentId == that.commentId &&
                Objects.equals(commentTime, that.commentTime) &&
                Objects.equals(content, that.content);
    }

    @Override
    public int hashCode() {
        return Objects.hash(commentTime, content, commentId);
    }

    @ManyToOne
    @JoinColumn(name = "senderId", referencedColumnName = "userId", nullable = false)
    public UserEntity getUserBySenderId() {
        return userBySenderId;
    }

    public void setUserBySenderId(UserEntity userBySenderId) {
        this.userBySenderId = userBySenderId;
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
    @JoinColumn(name = "answerId", referencedColumnName = "answerId")
    public AnswerEntity getAnswerByAnswerId() {
        return answerByAnswerId;
    }

    public void setAnswerByAnswerId(AnswerEntity answerByAnswerId) {
        this.answerByAnswerId = answerByAnswerId;
    }

    @OneToMany(mappedBy = "commentByCommentId")
    public Collection<CommentreplyEntity> getCommentrepliesByCommentId() {
        return commentrepliesByCommentId;
    }

    public void setCommentrepliesByCommentId(Collection<CommentreplyEntity> commentrepliesByCommentId) {
        this.commentrepliesByCommentId = commentrepliesByCommentId;
    }
}
