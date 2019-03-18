package com.czm.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "event", schema = "filemanager", catalog = "")
public class EventEntity {
    private int eventId;
    private Timestamp createTime;
    private Timestamp endTime;
    private Byte isExpired;
    private String content;
    private UserEntity userByUserId;

    @Id
    @Column(name = "EventId")
    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    @Basic
    @Column(name = "createTime")
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Basic
    @Column(name = "endTime")
    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    @Basic
    @Column(name = "isExpired")
    public Byte getIsExpired() {
        return isExpired;
    }

    public void setIsExpired(Byte isExpired) {
        this.isExpired = isExpired;
    }

    @Basic
    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        EventEntity that = (EventEntity) o;
        return eventId == that.eventId &&
                Objects.equals(createTime, that.createTime) &&
                Objects.equals(endTime, that.endTime) &&
                Objects.equals(isExpired, that.isExpired) &&
                Objects.equals(content, that.content);
    }

    @Override
    public int hashCode() {
        return Objects.hash(eventId, createTime, endTime, isExpired, content);
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
