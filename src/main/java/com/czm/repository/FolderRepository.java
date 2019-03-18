package com.czm.repository;

import com.czm.model.FolderEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FolderRepository extends JpaRepository<FolderEntity,Integer> {
    /*通过userId获取所有的文件夹*/
    @Query("select folder from FolderEntity folder where folder.userByUserId.userId=:userId")
    List<FolderEntity> findAllByUserId(@Param("userId")Integer userId);
}
