package com.czm.model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "follow", schema = "filemanager", catalog = "")
public class FollowEntity {
    private int followId;
    private UserEntity userByFollowerId;
    private UserEntity userByFolloweeId;

    @Id
    @Column(name = "followId")
    public int getFollowId() {
        return followId;
    }

    public void setFollowId(int followId) {
        this.followId = followId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FollowEntity that = (FollowEntity) o;
        return followId == that.followId;
    }

    @Override
    public int hashCode() {
        return Objects.hash(followId);
    }

    @ManyToOne
    @JoinColumn(name = "followerId", referencedColumnName = "userId", nullable = false)
    public UserEntity getUserByFollowerId() {
        return userByFollowerId;
    }

    public void setUserByFollowerId(UserEntity userByFollowerId) {
        this.userByFollowerId = userByFollowerId;
    }

    @ManyToOne
    @JoinColumn(name = "followeeId", referencedColumnName = "userId", nullable = false)
    public UserEntity getUserByFolloweeId() {
        return userByFolloweeId;
    }

    public void setUserByFolloweeId(UserEntity userByFolloweeId) {
        this.userByFolloweeId = userByFolloweeId;
    }
}
