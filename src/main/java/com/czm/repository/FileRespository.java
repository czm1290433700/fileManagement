package com.czm.repository;

import com.czm.model.FileEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FileRespository extends JpaRepository<FileEntity,Integer> {
    /*通过folderId获取所有的文件*/
    @Query("select file from FileEntity file where file.folderByFolderId.folderId=:folderId")
    List<FileEntity> findAllByFolderId(@Param("folderId")Integer folderId);
}
