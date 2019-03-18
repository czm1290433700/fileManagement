package com.czm.repository;

import com.czm.model.FfolderEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface FfolderRespository extends JpaRepository<FfolderEntity,Integer> {
    /*通过userId查询所有的收藏夹*/
    @Query("select ffolder from FfolderEntity ffolder where ffolder.userByUserId.userId=:userId")
    List<FfolderEntity> findAllByUserId(@Param("userId") Integer userId);
    /*通过noteId和userId查询单个收藏夹*/
    @Query("select ffolder from FfolderEntity ffolder where ffolder.noteByNoteId.noteId=:noteId and ffolder.userByUserId.userId=:userId")
    FfolderEntity findOneByNoteIdAndUserId(@Param("noteId") Integer noteId,@Param("userId") Integer userId);
    /*通过noteId和userId删除某个收藏*/
    @Modifying
    @Transactional
    @Query("delete from FfolderEntity ffolder where ffolder.noteByNoteId.noteId=:noteId and ffolder.userByUserId.userId=:userId")
    int deleteOneByNoteIdAndUserId(@Param("noteId") Integer noteId,@Param("userId") Integer userId);
    /*通过courseId和userId查询收藏*/
    @Query("select ffolder from FfolderEntity ffolder where ffolder.courseByCourseId.courseId=:courseId and " +
            "ffolder.userByUserId.userId=:userId")
    List<FfolderEntity> findAllByCourseIdAndUserId(@Param("courseId")Integer courseId,@Param("userId")Integer userId);
    /*通过title和userId模糊查询收藏*/
    @Query("select ffolder from FfolderEntity ffolder where ffolder.noteByNoteId.title like %:title% " +
            "and ffolder.userByUserId.userId=:userId")
    List<FfolderEntity> findAllByTitleAndUserId(@Param("title")String title,@Param("userId")Integer userId);
    /*通过courseId和title和userId模糊查询收藏*/
    @Query("select ffolder from FfolderEntity ffolder where ffolder.courseByCourseId.courseId=:courseId and" +
            " ffolder.noteByNoteId.title like %:title% and ffolder.userByUserId.userId=:userId")
    List<FfolderEntity> findAllByCourseIdAndTitleAndUserId(@Param("courseId")Integer courseId,
                                                           @Param("title")String title,@Param("userId")Integer userId);
}
