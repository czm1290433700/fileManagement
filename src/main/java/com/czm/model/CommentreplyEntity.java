package com.czm.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "commentreply", schema = "filemanager", catalog = "")
public class CommentreplyEntity {
    private int commentReplyId;
    private String content;
    private Timestamp replyTime;
    private CommentEntity commentByCommentId;

    @Id
    @Column(name = "commentReplyId")
    public int getCommentReplyId() {
        return commentReplyId;
    }

    public void setCommentReplyId(int commentReplyId) {
        this.commentReplyId = commentReplyId;
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
    @Column(name = "replyTime")
    public Timestamp getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(Timestamp replyTime) {
        this.replyTime = replyTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CommentreplyEntity that = (CommentreplyEntity) o;
        return commentReplyId == that.commentReplyId &&
                Objects.equals(content, that.content) &&
                Objects.equals(replyTime, that.replyTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(commentReplyId, content, replyTime);
    }

    @ManyToOne
    @JoinColumn(name = "commentId", referencedColumnName = "commentId", nullable = false)
    public CommentEntity getCommentByCommentId() {
        return commentByCommentId;
    }

    public void setCommentByCommentId(CommentEntity commentByCommentId) {
        this.commentByCommentId = commentByCommentId;
    }
}
