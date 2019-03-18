package com.czm.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "message", schema = "filemanager", catalog = "")
public class MessageEntity {
    private int messageId;
    private String content;
    private Timestamp createTime;
    private UserEntity userBySenderId;
    private UserEntity userByTargetId;
    private Collection<MessagereplyEntity> messagerepliesByMessageId;

    @Id
    @Column(name = "messageId")
    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
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
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        MessageEntity that = (MessageEntity) o;
        return messageId == that.messageId &&
                Objects.equals(content, that.content) &&
                Objects.equals(createTime, that.createTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(messageId, content, createTime);
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
    @JoinColumn(name = "targetId", referencedColumnName = "userId", nullable = false)
    public UserEntity getUserByTargetId() {
        return userByTargetId;
    }

    public void setUserByTargetId(UserEntity userByTargetId) {
        this.userByTargetId = userByTargetId;
    }

    @OneToMany(mappedBy = "messageByMessageId")
    public Collection<MessagereplyEntity> getMessagerepliesByMessageId() {
        return messagerepliesByMessageId;
    }

    public void setMessagerepliesByMessageId(Collection<MessagereplyEntity> messagerepliesByMessageId) {
        this.messagerepliesByMessageId = messagerepliesByMessageId;
    }
}
