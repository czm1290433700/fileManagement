package com.czm.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "messagereply", schema = "filemanager", catalog = "")
public class MessagereplyEntity {
    private int messageReplyId;
    private String content;
    private Timestamp replyTime;
    private MessageEntity messageByMessageId;

    @Id
    @Column(name = "MessageReplyId")
    public int getMessageReplyId() {
        return messageReplyId;
    }

    public void setMessageReplyId(int messageReplyId) {
        this.messageReplyId = messageReplyId;
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
        MessagereplyEntity that = (MessagereplyEntity) o;
        return messageReplyId == that.messageReplyId &&
                Objects.equals(content, that.content) &&
                Objects.equals(replyTime, that.replyTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(messageReplyId, content, replyTime);
    }

    @ManyToOne
    @JoinColumn(name = "messageId", referencedColumnName = "messageId", nullable = false)
    public MessageEntity getMessageByMessageId() {
        return messageByMessageId;
    }

    public void setMessageByMessageId(MessageEntity messageByMessageId) {
        this.messageByMessageId = messageByMessageId;
    }
}
