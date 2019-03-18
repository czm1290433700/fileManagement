package com.czm.model;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "folder", schema = "filemanager", catalog = "")
public class FolderEntity {
    private int folderId;
    private String name;
    private Collection<FileEntity> filesByFolderId;
    private UserEntity userByUserId;

    @Id
    @Column(name = "folderId")
    public int getFolderId() {
        return folderId;
    }

    public void setFolderId(int folderId) {
        this.folderId = folderId;
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
        FolderEntity that = (FolderEntity) o;
        return folderId == that.folderId &&
                Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(folderId, name);
    }

    @OneToMany(mappedBy = "folderByFolderId")
    public Collection<FileEntity> getFilesByFolderId() {
        return filesByFolderId;
    }

    public void setFilesByFolderId(Collection<FileEntity> filesByFolderId) {
        this.filesByFolderId = filesByFolderId;
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
