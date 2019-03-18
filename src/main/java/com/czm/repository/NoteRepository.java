package com.czm.repository;

import com.czm.model.NoteEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface NoteRepository extends JpaRepository<NoteEntity,Integer> {
    /*通过userId查询note*/
    @Query("select note from NoteEntity note where note.userByUserId.userId=:userId")
    List<NoteEntity> selectNoteByUserId(@Param("userId") Integer userId);
    /*通过userId和courseId查询note*/
    @Query("select note from NoteEntity note where note.userByUserId.userId=:userId and note.courseByCourseId.courseId=:courseId")
    List<NoteEntity> selectNoteByUserIdAndCourseId(@Param("userId") Integer userId,@Param("courseId") Integer courseId);
    /*通过noteId查询note*/
    @Query("select note from NoteEntity note where note.noteId=:noteId")
    NoteEntity selectNoteByNoteId(@Param("noteId") Integer noteId);
    /*倒序获取对应用户的所有笔记*/
    @Query("select note from NoteEntity note where note.userByUserId.userId=:userId order by note.noteId desc ")
    List<NoteEntity> findAllByUserIdDesc(@Param("userId") Integer userId);
    /*通过创建时间获得最新的笔记*/
    @Query("select note from NoteEntity note order by note.createTime desc")
    List<NoteEntity> findLatestNote();
    /*通过创建时间获得最新指定课程的笔记*/
    @Query("select note from NoteEntity note where note.courseByCourseId.courseId=:courseId order by note.createTime desc")
    List<NoteEntity> findLatestNoteByCourseId(@Param("courseId") Integer courseId);
    /*通过isPublic和userId查询*/
    @Query("select note from NoteEntity note where note.isPublic=:isPublic and note.userByUserId.userId=:userId")
    List<NoteEntity> selectNoteByIsPublicAndUserId(@Param("isPublic") Byte isPublic,@Param("userId") Integer userId);
    /*模糊查询*/
    @Query("select note from NoteEntity note where note.userByUserId.userId=:userId and note.title like %:title%")
    List<NoteEntity> fuzzySelectNote(@Param("userId") Integer userId,@Param("title") String title);
    /*通过courseId和isPublic查询*/
    @Query("select note from NoteEntity note where note.userByUserId.userId=:userId and note.courseByCourseId.courseId=:courseId and " +
            "note.isPublic=:isPublic")
    List<NoteEntity> selectNoteByUserIdAndCourseIdAndIsPublic(@Param("userId") Integer userId,@Param("courseId") Integer courseId,
                                                              @Param("isPublic") Byte isPublic);
    /*courseId加标题模糊查询*/
    @Query("select note from NoteEntity note where note.userByUserId.userId=:userId and note.title like %:title% and " +
            "note.courseByCourseId.courseId=:courseId")
    List<NoteEntity> fuzzySelectNoteByCourseId(@Param("userId") Integer userId,@Param("title") String title,
                                               @Param("courseId") Integer courseId);
    /*isPublic加模糊查询*/
    @Query("select note from NoteEntity note where note.userByUserId.userId=:userId and note.title like %:title% and note.isPublic" +
            "=:isPublic")
    List<NoteEntity> fuzzySelectNoteByIsPublic(@Param("userId") Integer userId,@Param("title") String title,
                                               @Param("isPublic") Byte isPublic);
    /*courseId加isPublic加模糊查询*/
    @Query("select note from NoteEntity note where note.userByUserId.userId=:userId and note.title like %:title% " +
            "and note.isPublic=:isPublic and note.courseByCourseId.courseId=:courseId")
    List<NoteEntity> fuzzySelectNoteByIsPublicAndCourseId(@Param("userId") Integer userId,@Param("title") String title,
                                                          @Param("isPublic") Byte isPublic,@Param("courseId") Integer courseId);
    /*编辑笔记*/
    @Modifying
    @Transactional
    @Query("update NoteEntity note set note.title=:title,note.courseByCourseId.courseId=:courseId,note.isPublic=:isPublic," +
            "note.content=:content where note.noteId=:noteId")
    Integer UpdateNote(@Param("title")String title,@Param("courseId")Integer courseId,@Param("isPublic")Byte isPublic,
                       @Param("content")String content,@Param("noteId")Integer noteId);
    /*浏览量加1*/
    @Modifying
    @Transactional
    @Query("update NoteEntity note set note.view=note.view+1 where note.noteId=:noteId")
    Integer UpdateNoteView(@Param("noteId")Integer noteId);
}
