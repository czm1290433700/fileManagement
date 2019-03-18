package com.czm.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "notification", schema = "filemanager", catalog = "")
public class NotificationEntity {
    private int notificationId;
    private String content;
    private String title;
    private Timestamp createTime;
    private UserEntity userByTargetId;

    @Id
    @Column(name = "notificationId")
    public int getNotificationId() {
        return notificationId;
    }

    public void setNotificationId(int notificationId) {
        this.notificationId = notificationId;
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
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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
        NotificationEntity that = (NotificationEntity) o;
        return notificationId == that.notificationId &&
                Objects.equals(content, that.content) &&
                Objects.equals(title, that.title) &&
                Objects.equals(createTime, that.createTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(notificationId, content, title, createTime);
    }

    @ManyToOne
    @JoinColumn(name = "targetId", referencedColumnName = "userId", nullable = false)
    public UserEntity getUserByTargetId() {
        return userByTargetId;
    }

    public void setUserByTargetId(UserEntity userByTargetId) {
        this.userByTargetId = userByTargetId;
    }
}
