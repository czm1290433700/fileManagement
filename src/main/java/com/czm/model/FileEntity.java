package com.czm.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "file", schema = "filemanager", catalog = "")
public class FileEntity {
    private int fileId;
    private String fileName;
    private Byte isDownloadable;
    private String uploadTime;
    private Long size;
    private String location;
    private String fileType;
    private FolderEntity folderByFolderId;
    private UserEntity userByUserId;

    @Id
    @Column(name = "FileId")
    public int getFileId() {
        return fileId;
    }

    public void setFileId(int fileId) {
        this.fileId = fileId;
    }

    @Basic
    @Column(name = "fileName")
    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    @Basic
    @Column(name = "isDownloadable")
    public Byte getIsDownloadable() {
        return isDownloadable;
    }

    public void setIsDownloadable(Byte isDownloadable) {
        this.isDownloadable = isDownloadable;
    }

    @Basic
    @Column(name = "uploadTime")
    public String getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(String uploadTime) {
        this.uploadTime = uploadTime;
    }

    @Basic
    @Column(name = "size")
    public Long getSize() {
        return size;
    }

    public void setSize(Long size) {
        this.size = size;
    }

    @Basic
    @Column(name = "location")
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Basic
    @Column(name = "fileType")
    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FileEntity that = (FileEntity) o;
        return fileId == that.fileId &&
                Double.compare(that.size, size) == 0 &&
                Objects.equals(fileName, that.fileName) &&
                Objects.equals(isDownloadable, that.isDownloadable) &&
                Objects.equals(uploadTime, that.uploadTime) &&
                Objects.equals(location, that.location) &&
                Objects.equals(fileType, that.fileType);
    }

    @Override
    public int hashCode() {
        return Objects.hash(fileId, fileName, isDownloadable, uploadTime, size, location, fileType);
    }

    @ManyToOne
    @JoinColumn(name = "folderId", referencedColumnName = "folderId", nullable = false)
    public FolderEntity getFolderByFolderId() {
        return folderByFolderId;
    }

    public void setFolderByFolderId(FolderEntity folderByFolderId) {
        this.folderByFolderId = folderByFolderId;
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
